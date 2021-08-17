Links: [[402 Control of Multivariable Systems]]
# State Feedback Control with Integral Action (SCFIA)

![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFCIA_block_diagram.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFCIA_block_diagram.svg)

- Summary

    Purpose: We wish to ensure that $\bar{z}=\bar{r}$ even is $\{A,B\}$ is not known exactly. Recall that, under such conditions, SFC alone cannot normally ensure $\bar{z}=\bar{r}$. However, we will see that SFCIA can ensure the required stead-state condition, assuming that the *augmented plant* system is controllable.

    Original plant: $\dot{x} = Ax+Bu$ ; Controlled output: $z=Ex$

    Integral action: $x_I = \int_0^t [r-z] \,d\tau \Rightarrow \dot{x}_I=\underset{mx1}{r}-\underset{mx1}{z}=r-Ex$

    **Augmented Plant:** The complete augmented plant is now given by the following **augmented form**:

    $$\begin{bmatrix} \dot{x}\\ \hline \dot{x}_I \end{bmatrix} = \left[ \begin{array}{c|c} A&0_{n,m}\\ \hline -E&0_m \end{array} \right] \begin{bmatrix} x \\ \hline x_I \end{bmatrix}+\begin{bmatrix} B \\ \hline 0_m \end{bmatrix}u + \begin{bmatrix} 0_{n,m}\\ \hline I_m \end{bmatrix}{r}$$

    $$\underbrace{\dot{x}_i}_{(n+m)\times1} = \underbrace{A_i}_{(n+m)\times(n+m)}\underbrace{x_i}_{(n+m)\times1}+\underbrace{B_i}_{(n+m)\times m} \underbrace{u}_{m\times 1} + \underbrace{B_r}_{(n+m)\times m} \underbrace{r}_{m\times 1}$$

    Open loop dynamics and controllability: We must extend the previous test on controllability for SFC systems to take account of the plant state equation together with the new integral of error term.

    $$P_{ci} = \left[ \begin{array}{c|c|c|c|c} B_i &A_iB_i&A_i^2B_i&\cdots&A_i^{n+m-1}B_i \end{array} \right]$$

    which must be of rank $n+m$.

    Closed loop dynamics:

    SFCIA controller: $\underset{m\times 1}{u} = -\underset{m\times n}{K}\underset{n\times 1}{x} + \underset{m\times m}{K_I}\underset{m\times 1}{x}$; $K_I$ is the integral gain matrix

    Writing the SFCIA equation in augmented form yields:

    $$u=-\left[ \begin{array}{c|c}K&-K_I \end{array} \right]\begin{bmatrix} x\\ \hline x_I \end{bmatrix} = -K_ix_i$$

    $$\begin{matrix} x_i= \underbrace{\begin{bmatrix}x\\ \hline x_I \end{bmatrix}}_{(n+m)\times 1} & K_i=\underbrace{\left[ \begin{array}{c|c} K & -K_i\end{array} \right]}_{m\times(n+m)}\end{matrix}$$

    The CL dynamics are therefore given by:

    $$\begin{matrix} \dot{x}_i=A_ix_i+B_iu+B_rr; & u=-K_ix_i \end{matrix}$$

    $$\Rightarrow \dot{x}_i=\underbrace{(A_i-B_iK_i)}_{A_{ic}}x_i+B_rr$$

    CL stability: is therefore determined by the $n+m$ evals($A_{ic}$), which must all be location in the LHP via suitable choice of $K_i = \left[ \begin{array}{c|c}K&-K_I \end{array} \right]$, using any of the standard SFC design techniques.

    $$\text{evals}(A_i-B_iK_i)=\text{evals}\left( \left[\begin{array}{c|c} A&0\\ \hline -E&0 \end{array} \right] - \underbrace{\overbrace{\underbrace{\begin{bmatrix} B\\ \hline 0 \end{bmatrix}}_{m\times m}}^{n\times m} \left[ \begin{array}{c|c} \underset{m\times n}{K}&\underset{m\times m}{-K_I} \end{array} \right]}_{\left[ \begin{array}{c|c} BK&-BK_I\\ \hline 0 & 0 \end{array} \right]} \right)$$

    $$= \text{evals} \left[ \begin{array}{c|c} A-BK&BK_I\\ \hline -E&0 \end{array}\right]$$

    $$\because A_{ic} \text{ stable, } \therefore \bar{\dot{x}}_i=0, \text{ } x_i = \begin{bmatrix} x \\ \hline x_I \end{bmatrix}$$

    CL Steady State Response: Recall that $\dot{x}_I = r - z$, so in the steady state:

    $$\bar{\dot{x}}_I = 0 = \bar{r}-\bar{z} \Rightarrow \bar{z}=\bar{r}$$

    Hence, zero steady state error is automatically satisfied by the SFCIA policy. This result is independent of any variations in $\{A,B\}$, as long as the CL systems remains stable.

- Example

    A coupled twin reservoir process system has the state-space representation:

    $\dot{x}=Ax+Bu$ where:  $x = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}=$ Liquid level in reservoir $\begin{bmatrix} 1 \\ 2 \end{bmatrix}$

    $u=\begin{bmatrix} u_1 \\ u_2 \end{bmatrix}=$ Flow control into reservoir $\begin{bmatrix} 1 \\ 2 \end{bmatrix}$, $A=\begin{bmatrix} -0.02&0.01\\0.01&-0.01 \end{bmatrix}$; $B=\begin{bmatrix} 0.01&0\\0&0.01\end{bmatrix}$

    i) if the controlled output is the liquid level reservoir 1, what is the corresponding controlled output matrix, E.

    ii) The desired control strategy is to be *state-feedback with control action*. Show that the CL dynamics are associated with the eigenvalues of $A_{ic}$, where:

    $$A_{ic} = \left[ \begin{array}{c|c} A-BK&BK_I \\ \hline -E&0\end{array} \right]$$

    iii) Determine the off-diagonal entries of $K$ so that $(A-BK)$ is diagonal

    iv) Hence, if $K_I = \begin{bmatrix} 0.25\\0 \end{bmatrix}$, determine $k_{11}$ and $k_{22}$ so that all CL evals are located at $s=-0.05$. What is the estimated CL step response settling time?

    - Solution

        i) $z=x_1 \Rightarrow z = \begin{bmatrix} 1&0 \end{bmatrix}x = Ex$, so setting $E=\begin{bmatrix} 1 & 0 \end{bmatrix}$ will control just the level in reservoir 1.

        ii) $\dot{x}=Ax+Bu$; and from the SFCIA block diagram: $u=-Kx+K_Ix_I$

        Also $\dot{x}_I=r-z=r-Ex$

        So $\dot{x}=Ax-BKx+BK_Ix_I=(A-BK)x+BK_Ix_I$

        Combining these yields:

        $$\begin{bmatrix} \dot{x} \\ \hline \dot{x}_I \end{bmatrix} = \underbrace{\left[ \begin{array}{c|c} A-BK & BK_I \\ \hline -E & 0 \end{array} \right]}_{A_{ic}} \begin{bmatrix} x \\ \hline x_I \end{bmatrix} + \begin{bmatrix} 0 \\ \hline 1 \end{bmatrix}r$$

        So the CL dynamics are seen to be governed by the evals($A_{ic}$).

        iii) 

        $$\begin{matrix}A= \begin{bmatrix} -0.02&0.01\\ 0.01&-0.02 \end{bmatrix}; & B=\begin{bmatrix} 0.01&0\\0&0.01 \end{bmatrix} \end{matrix}$$

        $$\Rightarrow A-BK=\begin{bmatrix} -0.02&0.01\\ 0.01&-0.02 \end{bmatrix}-\begin{bmatrix} 0.01&0\\0&0.01 \end{bmatrix}\begin{bmatrix} k_{11}&k_{12}\\k_{21}&k_{22}\end{bmatrix}$$

        $$= \begin{bmatrix} -0.02-0.01k_{11}& 0.01-0.01k_{12} \\ 0.01-0.01k_{21} & -0.02-0.01k_{22} \end{bmatrix}$$

        This will be diagonal if $k_{12} = k_{21} = 1$

        iv) The relevant CL eigenvalues are those of $A_{ic}$.

        $$A_{ic}= \left[ \begin{array}{c|c} A-BK & BK_I \\ \hline -E & 0 \end{array} \right] = \left[ \begin{array}{c|c} \begin{matrix} -0.02-0.01k_{11}&0\\0&-0.02-0.01k_{22} \end{matrix} & \begin{matrix} 0.0025\\ 0\\\end{matrix} \\ \hline \begin{matrix} \end{matrix} \begin{matrix} -1 & 0 \end{matrix} & 0 \end{array} \right] \because BK_I = \begin{bmatrix} 0.0025\\0 \end{bmatrix}$$

        The evals($A_{ic}$) are given by:

        $$|\lambda I_3-A_{ic}|=\begin{vmatrix} \lambda+0.02+0.01k_{11}&0&-0.0025\\0&\lambda+0.02+0.01k_{22}&0\\ 1&0&\lambda \end{vmatrix} = 0$$

        $$\Rightarrow (\lambda)(\lambda+0.02+0.01k_{11})(\lambda+0.02+0.01k_{22})+(1)(0.025)(\lambda+0.02+0.01k_{22})=0$$

        Compare this with the desired CLCE: and then compare the coefficients of the various powers of $\lambda$ in order to find $k_{11}, k_{22}$ and $t_s$

        $$(\lambda+0.05)^3 = 0$$

        $$k_{22} = 3, k_{11} = 8$$

        $$t_s \approx 141s$$