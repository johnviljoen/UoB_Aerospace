Links: [[402 Control of Multivariable Systems]]
# Linear Model Reference Control (LMRC)

![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/LMRC_block_diagram.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/LMRC_block_diagram.svg)

- Summary

    LMRC determines a unique $K$ such that the CL system accurately follows the behaviour of a predefined reference model. It is still a form of SFC, but a linear model is used in parallel with SFC to define an ideal controlled response, $z_m$. The block diagram is shown above.

    We require $z \rightarrow z_m$ by suitable choice of $\{K,K_R\}$. It will be seen that $\{K,K_R\}$ depend explicitly on $\{A, B, A_m, B_m\}$. Note that $E$ is the same in each branch of the above figure.

    - Calculation

        Pre-defined reference model:

        $$\dot{x}_m(t)=A_mx_m(t)+B_mr(t)$$

        Closed-loop plant: 

        $$\dot{x}(t)=(A-BK)x(t)+BK_Rr(t)$$

        Error Dynamics:

        $$\dot{x}_e(t)=\dot{x}_m(t)-\dot{x}(t)=A_mx_m(t)+B_mr(t)-(A-BK)x(t)-BK_Rr(t)$$

        $$\dot{x}_e(t)=A_mx_e(t)+[A_m-A+BK]x(t)+[B_m-BK_R]r(t)$$

        Therefore if:

        $$[A_m-A+BK]=0_n \text{ and } [B_m-BK_R]=0_{n,m}, \text{ then:}$$

        $$\dot{x}_e(t)=A_mx_e(t) \Rightarrow x_e(t) \rightarrow 0 \Rightarrow x(t)\rightarrow x_m(t) \text{ as t increases}$$

        Hence, we need:

        $$BK=A-A_m \text{ and } BK_R=B_m$$

        Therefore if we can find $B^{-1}$ we can solve the above equations for $K$ and $K_R$. However B is not always square and so we must use the **pseudo-inverse** (described in fundamentals above). This makes the solutions to $K$ and $K_R$ as follows:

        $$K=B^\dagger(A-A_m)$$

        $$K_R = B^\dagger B_m$$

        Where $\underset{mxn}{B}^\dagger$  is the pseudo-inverse of $\underset{nxm}{B}$ given by: (if $m>n$)

        $$B^\dagger = [B^TB]^{-1}B^T$$

        Finally substitute the expressions of gains into:

        $$[A_m-A+BK]=0_n \text{ and } [B_m-BK_R]=0_{n,m}$$

    - Erzbergers Conditions

        The unique solutions provided by the LMRC calculation are only valid if the Erzbergers conditions are satisfied for the perfect model following:

        $$[I_n-BB^\dagger][A-A_m]=0_n$$

        $$[I_n-BB^\dagger]B_m=0_{n,m}$$

        This limits the choices which can be made for $A_m$ and $B_m$. The steady state specification $\bar{z}=\bar{r}$ is satisfied by $B_m$. In the steady state:

        $$\bar{\dot{x}} = 0 =A_m\bar{x}_m + B_m\bar{r} \Rightarrow \bar{x}_m = -A_m^{-1}B_m\bar{r}$$

        $$\because z_m = Ex_m \Rightarrow\bar{z}=-EA_m^{-1}B_m\bar{r} \Rightarrow\bar{z}_m=\bar{r} \text{ if } -EA_m^{-1}B_m=I$$

        $$\text{i.e. } B_m=-A_mE^\dagger; \text{ where } E^\dagger=E^T[EE^T]^{-1}$$

    - Choosing a Reference Model

        Often, $A_m$ is chosen to be decoupled:

        $$\underset{nxn}{A_m}=\begin{bmatrix} \underset{n_1xn_1}{A_{m1}} & 0 & 0 & 0 \\ 0 & \underset{n_2xn_2}{A_{m2}} & 0 & 0 \\ 0 & 0 & \ddots & 0 \\ 0 & 0 & 0 & \underset{n_mxn_m}{A_{mm}}\end{bmatrix}$$

        For many system each DoF is 1st or 2nd order, i.e.

        $$\begin{matrix} \underset{1x1}{A_{mi}} = [-\omega_c]; & \omega_c = \frac{1.35 \times1+3}{t_s} = \frac{4.35}{t_s} \end{matrix}$$

        $$\begin{matrix}\underset{2x2}{A_{mi}} = \begin{bmatrix}0&1\\-\omega_c^2&-2\omega_c \end{bmatrix}; & \omega_c=\frac{1.35\times 2+3}{t_s}=\frac{5.7}{t_s}\end{matrix}$$

        These equations also allow us to satisfy the transient response specification for a given $t_s$.

        Note:

        - In above two equations the 'x1' and 'x2' used as 'n' are the 'n' of the subsystem and NOT the whole system, leading to them being 1 and 2 as opposed to 2 and 4. This is done as the system is decoupled and so subsystems can be treated independently.
        - If $\{A,B\}$ are not perfectly known (this is usually the case), then normally the CL transient, steady-state and decoupling performance of SFC will be diminished.

- Example

    A water distribution system consists of three interconnected reservoirs, labelled $i=1,2,3$. The corresponding level of liquid in reservoir $i$ is $x_i$, and the controlled output for each reservoir is $z_i = x_i$. Control of the levels is achievd by influencing the flow $u_i$ into each reservoir; the open-loop plant dynamics can then be represented by the state-equation:

    $$\begin{bmatrix} \dot{x}_1 \\ \dot{x}_2 \\ \dot{x}_3 \end{bmatrix}=\begin{bmatrix}-0.002&0.001&0\\0.001&-0.003&0.001\\0&0.001&-0.002 \end{bmatrix}\begin{bmatrix} x_1\\x_2\\x_3 \end{bmatrix} + \begin{bmatrix} 0.001&0&0\\0&0.001&0\\0&0&0.001 \end{bmatrix}\begin{bmatrix}u_1\\u_2\\u_3\end{bmatrix}$$

    i) A LMRC controller is proposed for this system. What are the advantages of an LMRC design over more conventional state-feedback controller designs? Sketch a block diagram of the closed loop strategy

    ii) If the reference controlled output, $z_m=Ex_m$, is to math the constant reference signal r, show that $B_m=-A_mE^\dagger$. Hence, if the reference model is to be decoupled, with all of its eigenvalues located at $\lambda=-0.01$, determine the parameter matrices $\{A_m,B_m\}$. What is the corresponding reference model step-response settling time? Sketch this response for any one of the reference controlled outputs, $z_{mi}$.

    iii) Show that Erzberger's Conditions are satisfied, irrespective of the entries in $\{A,A_m,B_m\}$. Determine the corresponding controller gains $\{K,K_R\}$, and confirm that the closed-loop parameter matrices are identical to those of the reference model.

    iv) Make *brief* comments on how the LMRC strategy can be extended to incorporate an adaptive component. You may add to your sketch in part (i), if necessary.

    - Solution

        i)

        - No eigenvalue problem to be solved
        - Simple hand calculations possible
        - Attractive/Intuitive concept

        ii) (the derivation of the steady state error = 0 $K_R$ from earlier:

        $$\begin{matrix}\dot{x}_m=A_mx_m+B_mr; & \text{let }\bar{r}=\text{ const}; & A_m=\text{ stable} \end{matrix}$$

        $$\Rightarrow \bar{\dot{x}}_m=0=A_m\bar{x}_m+B_m\bar{r} \Rightarrow \bar{x}_m=-A_m^{-1}B_m\bar{r}$$

        $$\begin{matrix}\Rightarrow z_m=E\bar{x}_m = -EA_m^{-1}B_m\bar{r}=\bar{r} & \text{ if } -EA_m^{-1}B_m=I\end{matrix}$$

        $$\text{i.e. } B_m=-A_mE^\dagger$$

        We require:

        $$A_m=-0.01I_3$$

        So if:

        $$E=I_3, \text{ then } E^\dagger=I_3$$

        $$B_m=-A_mE^\dagger=+0.01I_3I_3 = 0.01I_3$$

        Settling time $t_s$:

        $$t_s \approx \frac{1.35 \times 1 + 3}{0.01}=435s$$

        For each reference model DoF (n=1)

        Sketch:

        iii)

        $$B=0.001I_3 \Rightarrow B^\dagger=B^{-1}(=1000I_3); \text{ so } B^\dagger B=I_3$$

        $$\therefore (I_3-B^\dagger B)=0_3 \Rightarrow \text{automatic satisfaction of Erzberger's conditions}$$

        $$K=B^\dagger(A-A_m)=1000I_3\begin{bmatrix}-2+10&1&0\\1&-3+10&1\\0&1&-2+10 \end{bmatrix}0.001=\begin{bmatrix}8&1&0\\1&7&1\\0&1&8 \end{bmatrix}$$

        $$K_R=B^\dagger(A-A_m)=1000I_30.01I_3=10I_3$$

        Closed loop plant:

        $$A-BK=A_m$$

        $$BK_R=B_m$$

        iv) -