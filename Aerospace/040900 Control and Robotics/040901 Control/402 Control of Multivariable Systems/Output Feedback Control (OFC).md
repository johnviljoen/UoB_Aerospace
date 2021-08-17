Links: [[402 Control of Multivariable Systems]]
# Output Feedback Control (OFC)

![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/OFC_block_diagram.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/OFC_block_diagram.svg)

- Summary

    **OFC** combines SFC and LO when $x$ is not measurable.

    Plant: $\dot{x} = A \underset{n\times 1}{x}+B\underset{m\times 1}{u}$; $\{A,B\}$ is controllable; $x$ is not measurable. $m≤n$

    Measured output: $\underset{m\times 1}{y} = Cx, m≤n$; $\{A,C\}$ observable.

    OFC Controller: $\begin{cases} \begin{matrix} \text{LO}: & \dot{\hat{x}}=A\hat{x}+Bu+G[y-C\hat{x}]; & \text{ or } \dot{x}_e=(A-GC)x_e, \text{ where } x_e = x-\hat{x} \\ \text{SFC}: & u=-K\hat{x}+K_Rr&  \end{matrix} \end{cases}$

    CL dynamics: 

    $$⁍$$

    We now construct a 2n-dimensional state system as follows:

    $$\begin{bmatrix} \dot{x} \\ \hline \dot{x}_e \end{bmatrix} = \underbrace{\left[ \begin{array}{c|c} A-BK&BK \\ \hline 0_n&A-GC \end{array} \right]}_{A_o}\begin{bmatrix} x \\ \hline x_e \end{bmatrix}+\begin{bmatrix}BK_R\\0_{n,m}\end{bmatrix}r \text{  } \text{ note the dimensions:} \underbrace{A_o}_{2n\times 2n}$$

    Stability is guaranteed if all 2n evals($A_o$) are in the LHP.

    CL stability and the Seperation Principle: 

    It can be shown that: 2n evals($A_o$) = n evals($A-BK$) $\cup$ n evals($A-GC$), due to the presence of the $0_n$ block in $A_o$.

    i.e. OFC evals = SFC evals $\cup$ LO evals

    Hence the **Separation Principle**: separate, stable designs of the SFC and LO components guarantee a stable OFC design

    CL Steady State Response:

    For the steady state estimation error, by locating all n evals($A-GC$) in the LHP, we obtain:

    $$\bar{\dot{x}}_e = [A-GC]\bar{x}_e=0 \Rightarrow\bar{x}_e=0$$

    So from the equation for the CL dynamics:

    $$\bar{\dot{x}}=0=[A-BK]\bar{x}+BK\underbrace{\bar{x}_e}_{=0} + BK_R\bar{r}=0$$

    This is the same steady state equation as used for the geneeration of $K_R$ in SFC case, so the solution is the same, too:

    $$K_R = -\left[ C(A-BK)^{-1}B \right]^{-1}$$

    Relative Locations of SFC and LO evals: Experience shows that making the LO evals 3-5 times 'faster' than the SFC components evals will lead to a viable design for the OFC:

    ![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/relative_SFC_LO_eval_positions.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/relative_SFC_LO_eval_positions.svg)

    Notes:

    - Making the LO evals 'faster' results in relatively large entries in $G$, causing noise problems in the state estimate, $\hat{x}$, and hence in the control signal, $u$.
    - An optimal solution for the LO gain matrix, $G$, can be found using statistical information on noise processes within the OFC control loop. This is called the Kalman Filter, and it is a dual of the LQR method briefly described in SFC.
    - Output feedback controller with integral action (OFCIA) cab also be constructed. Again a separation principle will be valid for the seperate designs of the SFCIA and the LO gains.
- Example

    A water distribution system consists of three interconnected reservoirs, labelled $i=1,2,3$. The corresponding level of liquid in reservoir $i$ is $x_i$, and it is possible to directly measure this level as $y_i = x_i$, using a suitable trnsducer. Control of the levels is achieved by influencing the flow $u_i$ into each reservoir; the open-loop plant dynamics can then be represented by the state-equation:

    $$\begin{bmatrix} \dot{x}_1\\ \dot{x}_2 \\ \dot{x}_3 \end{bmatrix} = \begin{bmatrix} -0.002 & 0.001 & 0 \\ 0.001 & -0.003 & 0.001 \\ 0 & 0.001 & -0.002 \end{bmatrix} \begin{bmatrix} x_1\\x_2\\x_3 \end{bmatrix} + \begin{bmatrix} 0.001 &0&0 \\ 0 & 0.001&0 \\ 0& 0& 0.001 \end{bmatrix}\begin{bmatrix} u_1\\u_2\\u_3 \end{bmatrix}$$

    i) If the transucer for reservoir 3 fails, is the system observable from the measured outputs $y_1$ and $y_2$? Similarly, if the transducer for reservoirs 2 and 3 both fail, is the system observable from the measured output $y_1$?

    ii) An OFC is required for the system, in the event of transducer failures. Determine the values of the entries $k_j$ ($j = 1,2,3,4$) in the feedback gain matrix, $K$, given that:

    $$K = \begin{bmatrix} k_1 & k_4 & 0 \\ k_4 & k_2 & k_4 \\ 0 & k_4 & k_3 \end{bmatrix}$$

    and the closed loop dynamics are to be decoupled, each decoupled degree of freedom having a time constant $T =$ 250s. Hence determine the forward gain matrix, $K_R$, when the controlled output vector is required to be equal to the state vector.

    iii) Suppose transducers 2 and 3 have failed. If the corresponding Luenberger Observer gain is: $G = \begin{bmatrix} 0.03053 \\ 0.3029 \\ 1.192 \end{bmatrix}$, show that the observer eigenvalues are all located at $\lambda=-0.0125$.

    - Solution

        i) Since $x_1$ and $x_2$ are measured: $y = \underbrace{\begin{bmatrix} 1 & 0 & \\ 0 & 1 & 0 \end{bmatrix}}_{C} \begin{bmatrix} x_1\\x_2\\x_3 \end{bmatrix}$

        So $P_o = \begin{bmatrix} C \\ CA \\ CA^2 \end{bmatrix} = \left[ \begin{array}{c} \begin{matrix} 1 & 0 & 0 \end{matrix} \\ \hline \begin{bmatrix} 0 & 1 & 0 \\ -0.002 & 0.001 & 0 \\ 0.001 & -0.003 & 0.001 \end{bmatrix} \\ \hline CA^2 \end{array} \right] \rightarrow \begin{cases} \text{Det of this is 3x3 matrix } \neq 0) \\ \text{Rank } (P_o) = 3 \\ \text{Observable} \end{cases}$ 

        If $x_1$ is measured:  $y = \underbrace{\begin{bmatrix} 1 & 0 & \\ 0 & 1 & 0 \end{bmatrix}}_{C} \begin{bmatrix} x_1\\x_2\\x_3 \end{bmatrix} \Rightarrow P_o=\begin{bmatrix} C \\ CA \\ CA^2 \end{bmatrix}=\begin{bmatrix}1&0&0\\-2\times10^{-3}&1\times 10^{-3} & 0 \\ 5\times10^{-6}&-5\times 10^{-6} & 1\times 10^{-6} \end{bmatrix}$

        Since Det of $P_o \neq 0$, Rank $(P_o)=3$, Observable.

        ii) $A-BK=10^{-3}\begin{bmatrix}-2&1&0\\1&-3&1\\0&1&-2 \end{bmatrix}-10^{-3}\begin{bmatrix} k_1 & k_4 & 0 \\ k_4 & k_2 & k_4 \\ 0 & k_4 & k_3 \end{bmatrix} =10^{-3}\begin{bmatrix}-2-k_1 & 1-k_4 & 0 \\ 1-k_4 & -3-k_2 & 1-k_4 \\ 0 & 1-k_4 & -2-k_3 \end{bmatrix}$

        This is decoupled if $K_4=1$ and

        $$\begin{vmatrix} \lambda+10^{-3}(2+k_1) & 0 & 0 \\ 0& \lambda + 10^{-3}(3+k_2) & 0 \\ 0 & 0 & \lambda +10^{-3}(2+k_3) \end{vmatrix}=0$$

        The required CLP DoF time constants are $T=250s$

        Note: Consider the general first order transfer function $G(s)$

        $$G(s)=\frac{K}{\tau s + 1} \text{ i.e. } \begin{cases} 10^{-3}(2+k_1)=\frac{1}{250} \\ 10^{-3}(3+k_2)=\frac{1}{250} \Rightarrow\begin{cases}k_1=2\\k_2=1\\k_3=2 \end{cases} \\ 10^{-3}(2+k_3)=\frac{1}{250} \end{cases}$$

        The pole of the system is at $s=-\frac{1}{\tau}$, $\tau$ is called the time constant, $K$ is called the DC-gain or steady state gain.

        Forward gain: $K_R = -\left[ E(A-BK)^{-1} B\right]^{-1}$ where $E=I_3$

        $$K_R = -\left[ 10^{3}\begin{bmatrix}-4 & 0 & 0 \\ 0 & -4 0 \\ 0 & 0 & -4  \end{bmatrix}^{-1}10^{-3}\right]^{-1}=\begin{bmatrix} 4 & 0 & 0 \\ 0 & 4 & 0 \\ 0 & 0 & 4 \end{bmatrix}$$

        iii) Since the transducers 2 and 3 have failed, $C = \begin{bmatrix} 1 & 0 & 0 \end{bmatrix}$, $G=\begin{bmatrix} 0.03053 \\ 0.3029 \\ 1.192 \end{bmatrix}$

        $$\Rightarrow A-GC=\begin{bmatrix} -0.002 & 0.001 & 0 \\ 0.001 & -0.003 & 0.001 \\ 0 & 0.001 & -0.002 \end{bmatrix}-\begin{bmatrix} 0.03053 \\ 0.3029 \\ 1.192 \end{bmatrix}\begin{bmatrix} 1 & 0 & 0 \end{bmatrix} = \begin{bmatrix}-0.002-0.03053 & 0.001 & 0 \\ 0.001-0.3029 & -0.003 & 0.001 \\ -1.192 & 0.001 & -0.002\end{bmatrix} $$

        Where evals are given by:

        $$\begin{vmatrix} \lambda+0.03253 & -0.001 & 0 \\ 0.3019 & \lambda+0.003 & -0.001 \\ 1.192 & -0.001 & \lambda+0.002 \end{vmatrix}=0$$

        $$\Rightarrow \lambda^3+3.753\times10^{-2} \lambda^2+4.696\times10^{-4}\lambda+1.958\times10^{-6}=0$$

        The observer evals are all located $\lambda\approx-0.0125$,

        $$\Rightarrow (\lambda+0.0125)^3=0$$

        Compare coefficients, they match, therefore observer evals are all located $\lambda \approx -0.0125$.