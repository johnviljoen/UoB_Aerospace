Links: [[402 Control of Multivariable Systems]]
# Fundamentals

- Controllability
    - Definition

        **A plant is controllable** if it is possible to drive the state x from one set of conditions to anoter in a finite time with finite controls. This depends on the structure of the pair $\{A,B\}$

    - Calculation
        - Diagonalised Method

            **The decoupled nature of the diagonalised state equation does allow relatively straightforward determination of controllability**.

            $\dot{x}^* = Lx^*+Gu$, since $L = W^{-1}AW, G=W^{-1}B$

            $\dot{x}_j^*=L_{(:,j)}x_j^* + G_ju$, where j = 1,...,n and $G_j$ is the $j^{th}$ row of G

            Each $x^*$ is therefore independant of the others and affected bu u **if** $\Gamma$ **has no null rows**. It can be shown that the same condition applies to the original system, $\dot{x} = Ax + Bu$.

            - $\{A,B\}$ is controllable if and only if $\Gamma = W^{-1}B$ has no null rows

            Assumption: all poles are distinct

        - Controllability Matrix Method

            $\{A,B\}$ controllable if $P_c = \left[\begin{array}{c|c|c|c|c} B & AB & A^2B & \cdots & A^{n-1}B \end{array}\right]$ has rank *n*.

            $P_c$ is called the *controllability matrix.*

            There is a slightly different one for SFCIA controllability.

- Pseudo-Inverse

    When the matrix $A$ is non-square, it is possible to form a 'pseudo'-inverse of it, written as $A^{\dagger}$. We consider the case $\underset{nxm}{A};m<n$, where $A$ is assumed to be of full rank (m).

    The pseudo-inverse is defined as: (for $\underset{nxm}{A};m<n$)

    $$\underset{mxn}{A}^\dagger = [A^TA]^{-1}A^T$$

    if $\underset{nxm}{A};m>n$:

    $$\underset{mxn}{A}^\dagger = A^T[AA^T]^{-1}$$

- Observability

    A plant is **observable** if it is possible to determine the initial state x(0) from observation history of y(t), given the control u(t), within finite time.

    This depends on the structure of the pair $\{A,C\}$

    This is a similar (or dual) concept to controllability. If the state can be estimated, this implies that each element of $x (x_j)$ is somehow 'contained' in $y$ as an independant quantity. This independence is again examined via the decoupled state description:

    $$\begin{matrix}\dot{x}^*=\bold{L}x^*+Gu; & \Lambda=\text{diag}\begin{bmatrix} \lambda_1&\cdots&\lambda_2 \end{bmatrix}; \Gamma=W^{-1}B\end{matrix}$$

    $$\text{and } y=Cx = \underbrace{CW}_{\phi}x^*; \text{ defining } x^*=W^{-1}x \text{ so that } x=Wx^*$$

    So each $x_j^*$ (and hence $x_j$) has an influence independently on y is $\Phi=CW$ has *no* *null columns*. This yields the first test for observability:

    - $\{A,C\}$ is observable if CW has no null columns

    Alternatively, the more easily calculated rank test is:

    - $\{A,C\}$ is observable if $\underbrace{P_o}_{\text{observability matrix}} = \begin{bmatrix} C \\ CA \\ CA^2 \\ \vdots \\ CA^{n-1}\end{bmatrix}$has rank *n*