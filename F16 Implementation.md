# F16 Implementation
> links:
> - [[050000 Model Predictive Control]]

## Model
The full model is of 18 states:

$$x = \left\{ npos, epos, h, \phi, \theta, \psi, V, \alpha, \beta, p, q, r, T, \delta_h, \delta_a, \delta_r, \delta_{lf2}, \delta_{lf1} \right\}^T$$

Where the first 12 states contain the translational and angular, positions and velocities. The subsequent 6 are all actuator states, most of which are not needed for MPC. This is because their models can be contained in the constraints in the MPC optimisation.

Other states in the first 12 are very weakly controllable or are independant of dynamics. For example npos, epos, and $\psi$ do not change the dynamics of the aircraft at all. Therefore the state space used for the MPC is shown below:

$$x = \left\{ h, \phi, \theta, V, \alpha, \beta, p, q, r,  \delta_{lf2}, \delta_{lf1} \right\}^T$$

This has the benefit of drastically decreasing the time to linearise the model as the resulting state space matrices have far fewer elements, and therefore require far fewer C calls. For example A is 11x11 rather than 18x18, 121 C calls rather than 324.

As for the inputs to the system, as of the time of writing all actuators are being used, making the input vector as follows:

$$u = \left\{ T, \delta_h, \delta_a, \delta_r \right\}^T$$

## Cost Function

The cost function is defined as follows:

$$\mathop{\text{minimize}}_{u} \quad J = \pmb{x}^T_k \tilde{\pmb{Q}} \pmb{x}_k + \pmb{u}^T_k \tilde{\pmb{R}} \pmb{u}_k$$

where:

$$\tilde{\pmb{Q}} = \begin{bmatrix} Q & & & \\ & \ddots & & \\ & & Q & \\ & & & \bar{Q} \end{bmatrix} \quad \text{and} \quad \tilde{\pmb{R}} = \begin{bmatrix} R & & \\ & \ddots & \\ & & R \end{bmatrix}$$

where:

$$Q = C^T C \quad \text{and} \quad R = I_{nxn} * r$$

Where in this case $r$ = 1.  This makes it clear that choice of the diagonal elements in $R$ will dictate penalties applied to the different inputs, and the choice of $Q$ will dictate penalties applied to the states. The reason for using $C^T C$ as an initial guess for $Q$ is to ensure only observable states are penalised.

Therefore the resulting $Q$ and $R$ matrices for the MPC problem are as follows:

$$Q_{mxm} = \begin{bmatrix}
  0. & 0. & 0. & 0. & 0. & 0. &
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. &  1.00048095 & 0.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 1.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  1. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 1. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 1. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 0. & 0. & 0.\\
  0. & 0. & 0. & 0. & 0. & 0.&
  0. & 0. & 0. & 0. & 0.\\
\end{bmatrix}, \quad \quad R_{nxn} = \begin{bmatrix}
  0.01 & 0. & 0. & 0.\\
  0. & 0.01 & 0. & 0.\\
  0. & 0. & 0.01 & 0.\\
  0. & 0. & 0. & 0.01\\
\end{bmatrix}$$

## Mode 2 LQR Controller

The next task is to create the optimal mode 2 controller, this is chosen to be a linear quadratic regulator. This is due to it giving optimal predicted performance over mode 2. This is calculated by solving the discrete algebraic ricatti equation using scipy.linalg.solve_discrete_are. Let the result of this be $P$. Then the LQR gain matrix, $K$ is found using the following equation:

$$K = (R + B^T P B)^{-1}(B^TPA)$$

The code used us shown below:

~~~python
def lqr(A,B,Q,R):
	# first, solve the ricatti equation
    P = np.matrix(scipy.linalg.solve_discrete_are(A, B, Q, R))
    # compute the LQR gain
    K = np.matrix(scipy.linalg.inv(B.T @ P @ B+R) @ (B.T @ P @ A))
    return K
~~~

## Terminal Weighting Matrix

In order to calculate the infinite cost across both modes 1 and 2, a terminal weighting matrix is required to encapsulate the total cost of the LQR controller across mode 2. This will be implemented as $\bar{Q}$ as previously shown in $\tilde{\pmb{Q}}$ before as the final matrix.

This is done by choosing $\bar{Q}$ such that $x^T_{N|k}\bar{Q}x_{N|k}$ is equal to the cost over the mode 2 prediction horizon. This is achieved by specifying $\bar{Q}$ as the solution of the Lyapunov equation:

$$\bar{Q} - (A+BK)^T\bar{Q}(A+BK)=Q+K^TRK$$

~~~python
Q_bar = scipy.linalg.solve_discrete_lyapunov((A + B @ K).T, Q + K.T @ R @ K)
~~~

$\bar{Q}$ is as follows:

![[Pasted image 20210813165223.png]]

## Cost Function Rearrangement

$$J = \pmb{u}^TH\pmb{u} + 2(x_{ref}-x_k)^T F^T\pmb{u}$$

$$\text{subject to}: \quad \underline{x} - A^i x_k \leq \mathcal{C}_i \pmb{u}_i \leq \bar{x} - A^i x_k$$

$$\underline{\pmb{u}} \leq I \pmb{u}_i \leq \bar{\pmb{u}}$$

$$\dot{\underline{\pmb{u}}} \leq \text{subtraction matrix } \pmb{u}_i \leq \bar{\dot{\pmb{u}}}$$

$$J = (\pmb{x}_{ref} -\pmb{x}_k)^T \tilde{\pmb{Q}}(\pmb{x}_{ref} - \pmb{x}_k) + \pmb{u}_k^T\tilde{\pmb{R}}\pmb{u}_k$$

$$J = \pmb{u}^TH\pmb{u} + 2(x_{ref}-x_k)^T F^T\pmb{u}$$
$$\text{subject to}: \quad \underline{x} - A^i x_k \leq \mathcal{C}_i \pmb{u}_i \leq \bar{x} - A^i x_k$$


