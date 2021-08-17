## Linearisation
>Links: 
>[[050100 Engineering Tools]]

Given a general continuous nonlinear function:

$$\dot{x} = f(x,u)$$

we aim to extract the continuous state space linearisation at an operating point $(x_0,u_0)$:

$$\dot{x} = Ax + Bu$$
$$y = Cx + Du$$

This is done by perturbing each state and measuring the impact on all others. The full algorithm is shown below, but I shall break it down line by line.

~~~python
# Perturb each of the state variables and compute linearization
for i in range(len(x)):

	dx = np.zeros([len(x)])
	dx[i] = eps

	A[:, i] = (_calc_xdot(x + dx, u) - _calc_xdot(x, u)) / eps
	C[:, i] = (get_obs(x + dx, u) - get_obs(x, u)) / eps

# Perturb each of the input variables and compute linearization
for i in range(len(u)):

	du = np.zeros([len(u)])
	du[i] = eps

	B[:, i] = (_calc_xdot(x, u + du) - _calc_xdot(x, u)) / eps
	D[:, i] = (get_obs(x, u + du) - get_obs(x, u)) / eps

return A, B, C, D
~~~

Firstly the A and C matrices, representing uncontrolled system dynamics and observations respectively, are found by perturbing the current state. The magnitude by which we want to perturb the state is small so as not to leave the small region around which the linearisation is accurate.

The vector of perturbations, dx is reset upon every iteration of the loop, and a single state in this vector is perturbed:

~~~python
dx = np.zeros([len(x)])
dx[i] = eps
~~~

This makes a single example of dx look as follows:

$$dx = \begin{bmatrix} 0 & 0 & 0 & 0 & \text{eps} & 0 & 0 & 0 \end{bmatrix}$$