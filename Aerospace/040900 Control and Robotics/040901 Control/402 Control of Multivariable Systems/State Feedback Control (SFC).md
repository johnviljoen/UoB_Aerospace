Links: [[402 Control of Multivariable Systems]]
# State Feedback Control (SFC)

![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFC_block_diagram.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFC_block_diagram.svg)

- Assumptions
    - Assumes all state variables $x_j$ (*j* = 1,2, ..., *n*) are **measurable**. This can be expensive in transducer requirements (for large *n*) and can sometimes be impossible to implement.
    - Assumes the plant is **controllable**.
    - Assumes the system is square.
- Summary
    - Plant: $\dot{x} = Ax + Bu$
    - Controlled Output: $z = Ex$
    - Controller: $\underset{mx1}{u} = -\underset{mxn}{K} \underset{nx1}{x} + \underset{mxm}{K_R} \underset{mx1}{r}$; $\begin{cases} K: \text{feedback gain matrix} \\ K_R: \text{forward gain matrix} \end{cases}$
    - Closed-Loop Dynamics: $\dot{x} = Ax-BKx+BK_Rr=\underbrace{(A-BK)}_{A'}x+\underbrace{BK_R}_{B'}r$
    - CL Stability: is therefore ensured if all *n* evals(*A-BK*) are in the LHP, by suitable choice of *K*.
    - CL Steady-State  Response: assume the steady state value of $r = \bar{r} =$  constant

        $\dot{x} = (A-BK)x + BK_Rr \Rightarrow \bar{\dot{x}}=0=(A-BK)\bar{x}+BK_R\bar{r}$ 

        $\therefore \bar{x}=-(A-BK)^{-1}BK_R\bar{r}$

        $\therefore \bar{z}-E(A-BK)^{-1}BK_R\bar{r}=\bar{r}$ if and only if $-E(A-BK)^{-1}BK_R=I_m$

        $$\therefore K_R = -[E(A-BK)^{-1}B]^{-1}$$

        Setting $K_R$ equal to this will ensure that the $\bar{z} = \bar{r}$ in the steady state when $\bar{r}$ is constant.

    - Regulation/Tracking Control: $\begin{cases} \begin{matrix} \text{Regulation} & \rightarrow & r=0; \text{ so } K_R \text{ is not required } \\ \text{Tracking} & \rightarrow & r \neq 0; K_R\text{ calculated as before}  \end{matrix} \end{cases}$
    - Desired CL evals: Should in LHP, but **where** exactly? Optimal control problem,
        - Select all *n* evals at $s=-\omega_c$ on the Re axis (to achieve 'multivariable critical damping'); it can be shown that the multivariable system CL step response settling time is then given by:

        $$t_s = \frac{1.35n + 3}{\omega_c}$$

    - Choosing K: SISO plant:
        - $K = \begin{bmatrix} k_1 & k_2 & \cdots & k_n \end{bmatrix}$; *n* values to be determined in order to assign *n* eval(*A-BK*)
        - Unique solution
    - Choosing K: MIMO plant:

        $$\underset{mxn}{K} = \begin{bmatrix}k_{11} & k_{12} & \cdots & k_{1n} \\ k_{21} & \ddots & \vdots & \\ \vdots & \cdots & \ddots & \\ k_{m1} & & & k_{mn} \end{bmatrix}$$

        - There are $mxn$ values to be determined in order to assign only *n*.
        - eval(*A-BK*) $\rightarrow$ non-unique solution. This over-determined problem has been a topic of research since the 1960s. In general, we can add constraints to the basic control design in order to seek a unique solution for $K$. Four common examples with breif descriptions are provided:
            - **Optimal Control** (Bellman, Pontryagin; c1960): minimises a scalar quadratic performance index, $J$, with respect to $u$ (e.g fuel consumption minimisation in lunar lander control). In steady-state, this yields a unique $K$, called the linear quadratic regulator (LQR) solution.
            - **Eigenstructure Assignment** (Kautsky & Nichols; c1985): Assigns $K$ so that the variation in desired evals(*A-BK*) is minimised with respect to variations in $\{A,B\}$. The CL design is therefore 'robust', i.e. it is insensitive to plant parameter variations. If $P$ is the row vector of $n$ desired evals(*A-BK*).
            - **Decoupling Control**: attempts to decouple the CL dynamics as well as assigning the required CL evals, i.e. attempt to ensure that:

            $$A-BK = \begin{bmatrix} \underset{n_1xn_1}{A_{c1}} & 0 & 0 & 0 \\ 0 & \underset{n_2xn_2}{A_{c2}} & 0 & 0 \\ 0 & 0 & \ddots & 0 \\ 0 & 0 & 0 & \underset{n_mxn_m}{A_{cm}} \end{bmatrix}$$

            - **Linear Model Reference Control (LMRC)** (Winsor & Roy; c1970) determines a unique K so that the CL system accurately follows the behaviour of a predefined reference model.
    - If $\{A,B\}$ are not perfectly known (usually the case), then normally the CL transient, steady-state and decoupling performance of SFC will be compromised. (as $K_R$ will be poorly defined as $K_R = f(A,B,E,K)$)

- Example 1

    Given a fairly standard m-k-c SISO system:

    $$A = \begin{bmatrix} 0 & 1 \\ \omega_n^2 & -2\zeta\omega_n \end{bmatrix}, B = \begin{bmatrix} 0 \\ \lambda\omega_n^2 \end{bmatrix}, E=\begin{bmatrix} 1 & 0 \end{bmatrix}$$

    when $\omega_n =$ 1rad/s, $\zeta =$ 1.25, $\lambda =$ 1m/N. A tracking SFC is to be designed.

    i) Show the system is controllable

    ii) Find $K$ that ensures the CL system has multivariable critical damping with $t_s \approx$ 1.0s

    iii) Find $K_R$ so that $\bar{e} =$ 0.

    iv) Sketch the CL step response

    - Solution

        i) $P_c = \left[\begin{array}{c|c} \begin{matrix} 0 \\ 1 \end{matrix} & \begin{matrix} 1 \\ -2.5 \end{matrix} \end{array}\right]$, Rank = 2 = n $\therefore$ controllable

        ii) Let: $K = \begin{bmatrix} k_1 & k_2 \end{bmatrix}$, two states, two gains, mxn, 1x2

        $$⁍$$

        $$⁍$$

        Therefore the CL evals are given by:

        $$|sI-(A-BK)| = \begin{vmatrix} s & -1 \\1+k_1 & s+2.5+k_2\end{vmatrix} $$

        $$\therefore s^2 + (2.5+k_2)s+(k_1+1) = 0$$

        desired evals at $s=-\omega_c$, $t_s = \frac{1.35n+3}{\omega_c} \Rightarrow \omega_c = \frac{1.35*2+3}{1}=5$.7 for $t_s=1$

        $\therefore$ desired CE is:

        $$(s+5.7)^2 = s^2 +11.4s+32.5 = 0$$

        $$\therefore k_2=8.9, k_1=31.5, K=\begin{bmatrix}31.5 & 8.9\end{bmatrix}$$

        iii) $K_R = -[E(A-BK)^{-1}B]^{-1}$, $r-z=0=e$ for zero SS error

        $$A-BK = \begin{bmatrix} 0 & 1 \\ -32.5 & -11.4 \end{bmatrix}; (A-BK)^{-1}=\begin{bmatrix} -0.35 & -0.03 \\ 1 & 0 \end{bmatrix}$$

        $$E = \begin{bmatrix}1&0\end{bmatrix}; B=\begin{bmatrix}0\\1\end{bmatrix}$$

        $$\therefore K_R=-\begin{bmatrix} \begin{bmatrix}1&0\end{bmatrix}\begin{bmatrix} -0.35 & -0.03 \\ 1 & 0 \end{bmatrix} \begin{bmatrix}0\\1\end{bmatrix} \end{bmatrix}^{-1} = 33.33$$

        iv) Critically damped, $t_s$=1.0s, $\bar{e}=0$;

        ![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/crit_damped_mimo_sys.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/crit_damped_mimo_sys.svg)

- Example 2

    University population consists of $x_1$ students, $x_2$ lecturers, and $x_3$ others (neither students not lecturers). A conceptual linear model of such a population's dynamics is given:

    $$\begin{bmatrix} \dot{x}_1(t) \\ \dot{x}_2(t) \\ \dot{x}_3(t) \end{bmatrix} = \begin{bmatrix}-1&-1&0\\1&-2&0\\1&2&0 \end{bmatrix}\begin{bmatrix} x_1(t)\\x_2(t)\\x_3(t)\end{bmatrix} + \begin{bmatrix} 1&0\\0&1\\0&0 \end{bmatrix}\begin{bmatrix}u_1(t)\\u_2(t) \end{bmatrix}$$

    Where time is in normalised units, $u_1(t)$ is the number of new students added to the population and $u_2(t)$ is the number of new lecturers added to the population ($u_i(t)$ can be negative!).

    The number of students and lecturers is to be controlled. Derive the continuous-time state-feedback controller gain

    $$K=\begin{bmatrix} k_1 & k_2 & k_3 \\ k_4 & k_5 & k_6 \end{bmatrix}$$

    that decouples $x_1$ from $x_2$ and $x_3$, that decouples $x_2$ from $x_1$, and that assigns all closed-loops eigenvalues to $s=-1.0$.

    - Solution

        $$BK = \begin{bmatrix} 1 & 0 \\ 0 & 1 \\ 0 & 0 \end{bmatrix} \begin{bmatrix} k_1 & k_2 & k_3 \\ k_4 & k_5 & k_6 \end{bmatrix} = \begin{bmatrix} k_1 & k_2 & k_3 \\ k_4 & k_5 & k_6 \\ 0&0&0\end{bmatrix} \Rightarrow(A-BK)=\begin{bmatrix} -1-k_1 & -1-k_2 & -k_3 \\ 1-k_4 & -2-k_5 & -k_6 \\ 1 & 2 & 0 \end{bmatrix}$$

        Closed Loop System Dynamics:

        $x_1$ is decoupled from $x_2$ and $x_3$ if $\begin{cases} -1-k_2=0 \\ -k_3=0 \end{cases} \Rightarrow \begin{cases} k_2=-1 \\ k_3=0 \end{cases}$

        $x_2$ is decoupled from $x_1$ if $1-k_4=0 \Rightarrow k_4=1$

        So CLP evals are now given by:

        $$\begin{vmatrix} \lambda+1+k_1 & 0 & 0 \\ 0 & \lambda+2+k_5& k_6 \\ -1 & -2 & \lambda \end{vmatrix} = (\lambda+1+k_1)[\lambda(\lambda+2+k_5)+2k_6]$$

        $$\Rightarrow \lambda^3+(3+k_1+k_5)\lambda^2 + (2+2k_1+k_5+2k_6+k_1k_5)+(2k_6+2k_1k_6)=0$$

        Since desired CLP is:

        $$(\lambda+1)^3=\lambda^3+3\lambda^2+3\lambda+1=0$$

        $\therefore$

        $$\begin{matrix} 3+k_1+k_5=3 \Rightarrow k_1=-k_5 \\ 2+2k_1-k_1+2k_6-k_1^2=3 \Rightarrow k_6=\frac{1-k_1k_1^2}{2} \\ 2k_6(1+k_1)=(1-k_1+k_1^2)(1+k_1)=1 \Rightarrow k_1^3=0\end{matrix}$$

        $$\Rightarrow \begin{matrix} k_1=k_5=0 \\ k_6=0.5 \end{matrix} \Rightarrow K=\begin{bmatrix} 0 & -1 & 0 \\ 1 & 0 & 0.5 \end{bmatrix}$$