Links: [[401 Multivariable System Dynamics]]
# Phase Canonical Form of State-Space Equations

- Summary

    This is the most common method; if the plant has *m*  dof with each dof represented by an $n_ith$-order differential equation, then typically:

    $\underset{nx1}{x}=\begin{bmatrix} y_1\\ \dot{y_1}\\ \vdots \\ \frac{d^{n_1-1}}{dt^{n_1-1}} y_1 \\ \hline \vdots \\ \hline y_m\\ \dot{y_m}\\ \vdots \\ \frac{d^{n_m-1}}{dt^{n_m-1}} y_m\end{bmatrix}$; often $n_i = 2$ for electromechanical systems, so that: $\underset{nx1}{x} = \begin{bmatrix} y_1\\ \dot{y_1} \\ \hline y_2 \\ \dot{y_2} \\ \hline \vdots \\ \hline y_m \\ \dot{y_m}\end{bmatrix}$, where $n = 2m$. 

    For a plant with *m* DoF, each DoF can be modelled as a differential equation of order $n_i$: the system (or plant) is then modelled as a set of *m* simultaneous differential equations;

    *state equation*: $\dot{x} = Ax + Bu$

    *system state*: $\underset{nx1}{x}$, where $n=\sum_{i=1}^{m} n_i$

    *measured output equation*: $y=Cx$, where $\underset{pxn}{C}$is the measured output matrix

    *controlled output equation*: $z=Ex$, where $\underset{qxn}{E}$is the controlled output matrix

- Example

    A simplified model of a hovering machine is shown below. Determine a phase canonical state equation for the system when $\theta$ is small. Also determine the measured output and controlled output equations when $y=h$ and $z=\begin{bmatrix} h\\ \theta \\ \end{bmatrix}$. Assume that horizontal motion is negligible in this case.

    ![Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/Untitled%201.png](Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/Untitled%201.png)

    - Solution

        Apply Newtons 2nd Law: $m = 2, n = 4$

        DoF 1: Vertical motion: 

        $$ku_1 cos(\theta) + ku_2 cos(\theta) - mg - c_1 \dot{h} = m \ddot{h}$$

        $$⁍$$

        DoF 2: Rotation motion: 

        $$ku_2L - ku_1L - c_2\dot{\theta} = J\ddot{\theta}$$

        $$⁍$$

        Let $\underset{nx1}{x} = \begin{bmatrix} x_1 \\ x_2 \\ x_3 \\x_4 \end{bmatrix} = \begin{bmatrix} h \\ \dot{h} \\ \theta \\ \dot{\theta} \end{bmatrix}$; differentiate states:$\begin{cases} \dot{x_1} = \dot{h} = x_2  \\ \dot{x_2} = \ddot{h} = -(\frac{c_1}{m})\dot{h}+(\frac{k}{m})u_1 + (\frac{k}{m})u_2 -g  \text{ from (1)} \\ \dot{x_3} = \dot{\theta} = x_4 \\ \dot{x_4} = \ddot{\theta} = -(\frac{c_2}{J})\dot{\theta}-(\frac{kL}{J})u_1+(\frac{kL}{J})u_2 \text{ from (2)} \end{cases}$

        Therefore if we place these equations into state space form:

        $$\underbrace{\begin{bmatrix} \dot{x_1} \\ \dot{x_2} \\ \hline \dot{x_3} \\ \dot{x_4} \end{bmatrix}}_{\dot{x}} = \underbrace{\left[\begin{array}{c|c} \begin{matrix} 0 & 1 \\ 0 & -\frac{c_1}{m} \\ \end{matrix} & \begin{matrix} 0 & 0 \\ 0 & 0 \end{matrix} \\ \hline \begin{matrix} 0 & 0 \\ 0 & 0 \end{matrix} & \begin{matrix} 0 & 1 \\ 0 & -\frac{c_2}{J} \\ \end{matrix} \end{array} \right]}_{A} \underbrace{\begin{bmatrix} x_1 \\ x_2 \\ \hline x_3 \\ x_4\end{bmatrix}}_{x} + \underbrace{\left[\begin{array}{c|c} \begin{matrix} 0 \\ \frac{k}{m} \\ \end{matrix} & \begin{matrix} 0 \\ \frac{k}{m} \end{matrix} \\ \hline \begin{matrix} 0 \\ -\frac{kL}{J} \end{matrix} & \begin{matrix} 0 \\ \frac{kL}{J} \\ \end{matrix} \end{array} \right] }_{B}\underbrace{\begin{bmatrix} u_1 \\ \hline u_2 \end{bmatrix}}_{u} + \underbrace{\begin{bmatrix} 0 \\ -g \\ \hline 0 \\ 0 \end{bmatrix}}_{d}$$

        Where$\underset{nxn}{A} \text{: Plant matrix,} \underset{nxm}{B} \text{: Input matrix,} \underset{nx1}{d} \text{: disturbance vector}$ and they come together in the general state equation:

        $$\dot{x} = Ax + Bu + d$$

        Also $\underset{px1}{y} = h = x_1 = \underbrace{\left[\begin{array}{cc|cc} 1 & 0 & 0 & 0\end{array}\right]}_{C} \begin{bmatrix} x_1 \\ x_2 \\ \hline x_3 \\ x_4 \end{bmatrix}$is the measured output equation, which has the general form: $y=Cx$, where $\underset{pxn}{C}$is the measured output matrix

        Finally, $z = \begin{bmatrix} h \\ \hline \theta \end{bmatrix} = \begin{bmatrix} x_1 \\ \hline x_3 \end{bmatrix} = \underbrace{\left[\begin{array}{cc|cc}1 & 0 & 0 & 0 \\ \hline 0 & 0 & 1 & 0 \end{array}\right]}_{E} \begin{bmatrix} x_1 \\ x_2 \\ \hline x_3 \\ x_4 \end{bmatrix}$ is the controlled output equation, which has the general form: $z = Ex$, where $\underset{qxn}{E}$ is the controlled output matrix