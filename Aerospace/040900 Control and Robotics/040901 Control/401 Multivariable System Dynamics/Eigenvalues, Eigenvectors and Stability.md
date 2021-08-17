Links: [[401 Multivariable System Dynamics]]
# Eigenvalues, Eigenvectors and Stability

- Summary

    The term $|sI-A|$ is a scalar $n^{th}$-order polynomial in *s*; it is the ***characteristic polynomial*** of *G(s)*;

    The ***characteristic equation*** (CE) is $|sI-A|=0$

    The n roots of this polynomial are call the ***characteristic roots*** of *G(s)*.

    The problem of solving $|sI-A|=0$ is known as an ***eigenvalue problem***

    The *n* roots are called eigenvalues of *A*, or eval(*A*). Thus: eval(*A*) = roots of CE of *G(s)*

    **Stability:** We require all poles in the left half plane (LHP) of the s-plane for stability, ie:

    ***G(s) is stable if all eval(A) are in the LHP***

    By convention, we use a special symbol $\lambda$, to denote the eigenvalues, then eval(*A*) are given by *n* solutions to $|\lambda I - A|=0$ and are written as $\lambda_1, \lambda_2, ..., \lambda_n$

    Eigenvectors (evecs):

    A non-trivial solution for $(\lambda_i I - A)W_i = 0$, where $W_i$ is the (right-hand) eigenvector corresponding to the eval $\lambda_i
    Each eval has its corresponding evec, $W_i$, given by:

    $$\underset{nxn}{A} \underset{nx1}{W_i} = \underset{1x1}{\lambda_i} \underset{nx1}{W_i}$$

- Example

    ![Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_2.svg](Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_2.svg)

    Assume that $x(t) = \begin{bmatrix} y \\ \dot{y} \end{bmatrix}$ and the system is underdamped: $0≤\zeta<1$. Determine the evals, evecs and stability conditions.

    - Solution

        From the previous example with transfer function matrix:

        $$\begin{bmatrix} \dot{x_1} \\ \dot{x_2} \end{bmatrix} = \underbrace{\begin{bmatrix} 0 & 1 \\ -\omega_n^2 & -2\zeta\omega_n \end{bmatrix}}_{A} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} + \underbrace{\begin{bmatrix} 0 \\ \lambda\omega_n^2 \end{bmatrix}}_{B}u$$

        Evals:

        $$|sI-A|=0 \Rightarrow \left|\begin{matrix} s & -1 \\ \omega_n^2 & s+2\zeta\omega_n \end{matrix}\right|$$

        $\Rightarrow s^2 + 2\zeta\omega_ns+\omega_n^2 = 0$

        $\Rightarrow s=-\zeta\omega_n \pm j\omega_d$; $\omega_d=\omega_n\sqrt{1-\zeta^2}$;

        $$\begin{matrix} \lambda_1 = -\zeta\omega_n+j\omega_d \\ \lambda_2 = -\zeta\omega_n-j\omega_d\end{matrix}$$

        Evecs:

        let $W_1 = \begin{bmatrix} W_{11} \\ W_{12} \end{bmatrix} \because AW_1 = \lambda_1W_1 \Rightarrow \begin{bmatrix} 0 & 1 \\ -\omega_n^2 & -2\zeta\omega_n \end{bmatrix} = (-\zeta\omega_n + j\omega_d) \begin{bmatrix} W_{11} \\ W_{12} \end{bmatrix}$

        We obtain:

        $$\begin{matrix}\text{ \textcircled{\raisebox{-.9pt} {1}} } W_{12} = (-\zeta\omega_n+j\omega_d)W_{11} \\\text{ \textcircled{\raisebox{-.9pt} {2}}} -\omega_n^2W_{11}-2\zeta\omega_nW_{12} = (-\zeta\omega_n+j\omega_d)W_{12} \end{matrix} 
        $$

        $\therefore \frac{W_{11}}{W_{12}} = \frac{1}{-\zeta\omega_n+j\omega_d}$, 

        $$ \begin{matrix} W_1 = \begin{bmatrix} 1 \\ -\zeta\omega_n+j\omega_d \end{bmatrix} \\ W_2 = \begin{bmatrix} 1 \\ -\zeta\omega_n-j\omega_d\end{bmatrix}\end{matrix}$$

        Stability:

        Since $0≤\zeta<1$, the system is: $\begin{cases} \zeta = 0 : \text{marginally stable} \\ 0<\zeta<1 : \text{stable} \end{cases}$

        ![Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_3.svg](Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_3.svg)