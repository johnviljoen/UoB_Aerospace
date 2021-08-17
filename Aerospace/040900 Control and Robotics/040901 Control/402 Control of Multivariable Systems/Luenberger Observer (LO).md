Links: [[402 Control of Multivariable Systems]]
# Luenberger Observer (LO)

![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/Luenberger_observer.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/Luenberger_observer.svg)

- Summary

    The basic assumption of a measurable $\underset{n\times 1}{x}$is removed; the problem is to estimate $x$, (as $\underset{n\times 1}{\hat{x}}$) given the plant input $\underset{m\times 1}{u}$ the measured output $\underset{m\times 1}{y} = Cx$ and triple $\{A,B,C\}$. The device or coding that achieves this is called the *Luenberger Observer* (LO), which ensures $\hat{x} \rightarrow x$, if $\{A,B,C\}$ is known accurately and $\{A,C\}$ is observable. 

    Notes:

    - Usually $m≤n$. Therefore, one cannot simply invert $C$ in order to determine $\hat{x}=C^{-1}y$, since $C$ is generally non-square.
    - In addition, the use of a pseudo-inverse, $\hat{x}=C^\dagger y$, will generally yield unsatisfactory results because: $\hat{x}=C^\dagger y = C^\dagger C x \neq x$, where $C^\dagger C \neq I_n$

    Plant: $\dot{x} = A \underset{n\times 1}{x} + B \underset{m\times 1}{u}$; $x$ is not directly measureable; $\{A,C\}$ is observable

    Measured Output: $\underset{m\times 1}{y} = Cx$ ; $m≤n$

    LO: $\dot{\hat{x}} = \underbrace{A\hat{x} + Bu}_{\text{prediction}} + \underbrace{G\begin{bmatrix}  y-\overbrace{C\hat{x}}^{\hat{y}}\end{bmatrix}}_{\text{correction}}$; where IC: $\hat{x}(0)$ is often zero; $\underset{n\times m}{G}$ is the **observer gain matrix**.

    State estimation error dynamics: Define the estimation error as $x_e = x-\hat{x}$

    $$\dot{x}_e = \dot{x}-\dot{\hat{x}} = Ax+Bu-A\hat{x}-Bu-G[\underbrace{y}_{Cx} - C\hat{x} ] = Ax_e-GC[c-\hat{x}]$$

    $$\Rightarrow \dot{x}_e = [A-GC]x_e$$

    Observer Stability: As a result of the homogenous error dynamics, $x_e \rightarrow 0$ is guarunteed, whatever $x_e(0)$, by locating all n evals(*A-GC*) in LHP. Stability of the LO is therefore ensured by approriate choice of G. Notic the similarity (duality) to the SFC/SFCIA problem, which can be formalised as follows.

    [Duality of SFC and LO](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/Duality%20of%20SFC%20and%20LO%20276e6d8a80784b89b211ddb3129b6730.csv)

    Note that the order of $\{A,B,K\}$ in the SFC design is the same as $\{A^T, C^T, G^T\}$ in the LO design. Hence the *Duality Principle* is stated as follows: given any SFC design method to yield $K$, this same method can be used to determine $G$, if $A$ is replaced with $A^T$, $B$ with $C^T$ and $K$ with $G^T$.

- Example

    A state description of the aircraft in roll is given by:

    $$\begin{bmatrix} \dot{x}_1(t) \\ \dot{x}_2(t) \\ \dot{x}_3(t) \end{bmatrix} = \begin{bmatrix} 0 & 1 & 0 \\ 0 & -2 & -40 \\ 0 & 0 & -50 \end{bmatrix}\begin{bmatrix} x_1(t) \\ x_2(t) \\ x_3(t) \end{bmatrix} + \begin{bmatrix} 0 \\ 0 \\ 50 \end{bmatrix}u(t)$$

    where $x_1(t)$ is the roll angle, $x_2(t)$ is the roll rate, and $x_3(t)$ is the aileron deflection, and $u(t)$ is the command voltage to the aileron servo-motor.

    Suppose that the only measurement available is $y(t)=0.1x_1(t)$, i.e. a measure of the roll angle. Is the system observable? if so, design a continuous time Luenberger Observer for the system so that the observer poles are located at $s=-25$.

    - Solution

        Observability:

        $$y = 0.1x_1 \Rightarrow C \begin{bmatrix} 0.1&0&0 \end{bmatrix}, n=3$$

        $$\therefore P_o = \begin{bmatrix} C \\ CA\\ CA^2 \end{bmatrix} = \begin{bmatrix} 0.1&0&0\\0&0.1&0\\0&-0.2&-4 \end{bmatrix}, |P_o| = -0.04 \neq0$$

        $$\therefore \text{rank}(P_o) = 3 = n$$

        $$\therefore \text{observable}$$

        Design Observer Gain Matrix, G:

        evals:

        $$|\lambda I-A+GC|=0$$

        Where: $\underset{3\times 1}{G}=\begin{bmatrix} g_1 \\ g_2 \\ g_3 \end{bmatrix}$, so: $GC = \begin{bmatrix} g_1\\g_2\\g_3 \end{bmatrix} \begin{bmatrix} 0.1& 0&0 \end{bmatrix} = \begin{bmatrix} 0.1g_1&0&0 \\ 0.1g_2&0&0 \\ 0.1g_3&0&0 \end{bmatrix}$

        $$\therefore \begin{vmatrix} \lambda+ 0.1g_1&-1&0 \\ 0.1g_2&\lambda+2&40 \\ 0.1g_3&0&\lambda+50\end{vmatrix}=0$$

        $$\Rightarrow \lambda^3 + \lambda^2(52+0.1g_1) +\lambda(100+5.2g_1+0.1g_2)+(10g_1+5g_2-4g_3)=0$$

        $$\text{Desired CE: } (\lambda+25)^3= \lambda^3+75\lambda^2+1875\lambda +15625=0$$

        $$\text{so: } g_1 = 230, g_2 = 5790, g_3=3906 , \text{ i.e. } G=\begin{bmatrix} 230\\5790\\3906 \end{bmatrix}$$