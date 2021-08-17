Links: [[401 Multivariable System Dynamics]]
# Terminology

- Input Vector

    Input vector: $u=\begin{bmatrix} u_1\\ u_2\\ \vdots \\ u_m \end{bmatrix}$

- Measured Output Vector

    Measured output vector: $y=\begin{bmatrix} y_1\\ y_2\\ \vdots \\ y_p \end{bmatrix}$

- Controlled Output

    $\underset{q,1}{Z}$, not necessarily the same as the measured output, y

- Reference (Demand)

    $\underset{q,1}{r}$, a vector of the same dimension as z

- Square Systems and Degrees of Freedom

    Given the assumption of identical dimensions for r and z, the control system is said to be *square* with *q degrees of freedom (DoF)*

- Control Problem

    Determine u (mx1) so that z (mx1) follows a given reference vector r (mx1) in a well defined, stable manner. In addition, the controlled outputs zi should be decoupled from one another.

    ![Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/Untitled.png](Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/Untitled.png)

- System State

    The dependant variable in all this, x (nx1),  $n=\sum_{i=1}^{m} n_i$