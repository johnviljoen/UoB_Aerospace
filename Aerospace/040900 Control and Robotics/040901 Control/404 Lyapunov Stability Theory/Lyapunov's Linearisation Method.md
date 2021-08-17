Links: [[404 Lyapunov Stability Theory]]
# Lyapunov's Linearisation Method

[[Linearisation of Dynamic Systems]]

- Example 1

    Simple Damped Pendulum:

    **insert damped pendulum diagram here :)**

    The equation of motion is $ml^2 \ddot{\theta} + c \dot{\theta} + mglsin({\theta})$=0

    $$\Rightarrow \ddot{\theta}=-\frac{g}{l}sin(\theta)-\frac{c}{ml^2}\dot{\theta}$$

    The state vector is:

    $$x=\begin{bmatrix} x_1\\x_2 \end{bmatrix}=\begin{bmatrix}\theta \\ \dot{\theta} \end{bmatrix}, \text{ so } x_2 = \dot{x}_1$$

    $$\Rightarrow \dot{x} = \begin{bmatrix} \dot{x}_1 \\ \dot{x}_2 \end{bmatrix} = \begin{bmatrix} x_2 \\ -\frac{g}{l}sin(x_1)-\frac{x}{ml^2}x_2 \end{bmatrix} = \begin{bmatrix}f_1(x) \\ f_2(x) \end{bmatrix} = f(x)$$

    The Jacobian is:

    $$\frac{\partial f(x)}{\partial x} = \begin{bmatrix} \frac{\partial f_1(x)}{\partial x_1} & \frac{\partial f_1(x)}{\partial x_2} \\ \frac{\partial f_2(x)}{\partial x_1} & \frac{\partial f_2(x)}{\partial x_2}  \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ -\frac{g}{l}cos(x_1) & -\frac{c}{ml^2}\end{bmatrix}$$

    Equilibrium states satisfy the condition:

    $$\dot{x} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} = \begin{bmatrix} x_2 \\ -\frac{g}{l}sin(x_1)-\frac{c}{ml^2}x_2\end{bmatrix}$$

    i.e. $x_2 = 0$ and $sin(x_1)=0$.

    Hence there are infinitely many equilibrium states, given by:

    $$x=\begin{bmatrix} x_1\\x_2 \end{bmatrix} = \begin{bmatrix}n \pi \\ 0 \end{bmatrix}, n=0,1,2... \infty$$

    Taking first $n=0$ hence $x=\begin{bmatrix} 0 \\ 0 \end{bmatrix}$, then previously:

    $$A = \left(\frac{\partial f(x)}{\partial x}\right)_{x=0} = \begin{bmatrix} 0 & 1 \\ -\frac{g}{l}cos(x_1) & -\frac{c}{ml^2}\end{bmatrix}_{x=0}= \begin{bmatrix} 0 & 1 \\ -\frac{g}{l} & -\frac{c}{ml^2}\end{bmatrix}$$

    Hence we again write $f(x) = \left(\frac{\partial f(x)}{\partial x}\right)_{x=0}x+f_{ht}(x)$, i.e.:

    $$\begin{bmatrix} x_2 \\ -\frac{g}{l}sin(x_1)-\frac{c}{ml^2}x_2 \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ -\frac{g}{l} & -\frac{c}{ml^2}\end{bmatrix}\begin{bmatrix} x_1 \\ x_2\end{bmatrix} + f_{ht}(x)$$

    $$\Rightarrow f_{ht}(x)=\begin{bmatrix} x_2 \\ -\frac{g}{l}sin(x_1)-\frac{c}{ml^2}x_2 \end{bmatrix} - \begin{bmatrix} 0 & 1 \\ -\frac{g}{l} & -\frac{c}{ml^2}\end{bmatrix}\begin{bmatrix} x_1\\x_2\end{bmatrix}=\begin{bmatrix} 0& 0 \\ \frac{g}{l}(x_1-sin(x_1)) & 0 \end{bmatrix}$$

    i.e.

    $$f_{ht}(x) = \begin{bmatrix} 0 & 0 \\ \frac{g}{l}\left( \frac{x_1^3}{3!}-\frac{x_1^5}{5!}+ \cdots \right) & 0\end{bmatrix}$$

    To analyse the stability, we calculate the eigenvalues of $A$:

    $$|A-\lambda I| = \begin{vmatrix} 0-\lambda & 1 \\ -\frac{g}{l} & -\frac{c}{ml^2}-\lambda \end{vmatrix}=\lambda^2+\frac{c}{ml^2}\lambda + \frac{g}{l}=0$$

    $$\Rightarrow \lambda_{1,2}=\frac{\frac{-c}{ml^2}\pm \sqrt{\frac{c^2}{m^2l^4}-\frac{4g}{l}}}{2}=\frac{-c\pm\sqrt{c^2-4gm^2l^3}}{2ml^2}$$

    Since the real part of $\sqrt{c^2-4gm^2l^3}$ must be $<c$ for all reasonable component values, we can conclude that both the eigenvalues $\lambda_{1,2}$ are in the LHP.

- Example 2

   ** insert inverted pendulum diagram here :)**

    For an inverted pendulum, there is an equilibrium state corresponding to $n=1$ hence $x = \begin{bmatrix} \pi \\ 0 \end{bmatrix}$. Noting that $sin(\pi + \phi) = sin(\pi)cos(\phi)+cos(\pi)sin(\phi)=-sin(\phi)$, we make the substitution $\phi=\theta-\pi$. Since $\dot{\phi} = \dot{\theta}$ and $\ddot{\phi} = \ddot{\theta}$, the equation of motion is then:

    $$\ddot{\phi} = \frac{g}{l}sin(\phi)-\frac{c}{ml^2}\dot{\phi} = \frac{g}{l}sin(x_1) -\frac{c}{ml^2}x_2$$

    $$\Rightarrow f(x) = \dot{x} = \begin{bmatrix} x_2 \\ \frac{g}{l}sin(x_1) -\frac{c}{ml^2}x_2 \end{bmatrix}$$

    The corresponding Jacobian is $\begin{bmatrix} 0 & 1 \\ \frac{g}{l}cos(x_1) & \frac{-c}{ml^2} \end{bmatrix}$, for which linearisation yields:

    $$A = \left( \frac{\partial f(x)}{\partial x} \right)_{x=0} = \begin{bmatrix} 0 & 1 \\ \frac{g}{l} & \frac{-c}{ml^2} \end{bmatrix}$$

    Which has eigenvalues:

    $$\lambda_{1,2}=\frac{\frac{-c}{ml^2}\pm \sqrt{\frac{c^2}{m^2l^4}+\frac{4g}{l}}}{2} =\frac{-c\pm\sqrt{c^2+4gm^2l^3}}{2ml^2}$$

    Now the real part of $\sqrt{c^2+4gm^2l^3}$ must be $> c$, so one of the eigenvalues will be in the RHP, hence the system is - unsurprisingly - unstable

- Example 3

    Non-linear 1st order system

    Consider the equation $\dot{y} = \alpha y + \beta y^3$

    $\Rightarrow x = x_1 = y$

    $\dot{x} = \alpha x_1 + \beta x_1^3 = f(x)$

    This has one equilibrium value at $x_1 = 0$ and two more at $x_1 = \pm \sqrt{\frac{-\alpha}{\beta}}$

    Taking $x_1=0$, then $A =\left(\frac{\partial f(x)}{\partial x}\right)_{x=0} = \alpha + 3 \beta x_1^2 |_{x_1=0} = \alpha$

    The eigenvalue is found via $| \alpha - \lambda | = 0$ i.e. $\lambda = \alpha$.

    So the system will be stable if $\alpha<0$ and unstable if $\alpha>0$.

    But if $\alpha=0$ then the linearisation method does not allow us to conclude whether the system is stable or not, since the system is then $\dot{y} = \beta y^3$ and we have eliminated the higher order $\beta$ term via linearisation.

- Linearisation of Controlled Systems

    The linearisation method can be extended to include controlled systems:

    $\dot{x} = f(x,u)$

    $$\text{Let }A=\left(\frac{\partial f(x,u)}{\partial x}\right)_{(x=0)(u=0)} \text{ and } B=\left(\frac{\partial f(x,u)}{\partial u}\right)_{(x=0)(u=0)}$$

    Then $\dot{x} = Ax+Bu$ is the linearised form of the controlled system.

    Since typically $u$ is a function of $x$ it too can be expressed as a linearised form of $x$:

    $$u=u(x)=u(0)+ \left( \frac{\partial u}{\partial x} \right)_{x=0}x+ \cdots$$

    Also typically $u(0) = 0$, (or else we can substitute a non-zero value of $u$ to achieve this)

    $$u \approx \left( \frac{\partial u}{\partial x} \right)_{x=0}x = Gx, \text{ say}$$

    Hence the linearised controlled system is:

    $$\dot{x} = f(x, G(x)) = (A+BG)x$$

- Example 1

    Proportional plus Derivative control of the Inverted Pendulum

    **insert PID inverted pendulum diagram here :)**

    Control torque $u$ is applied to the base of the pendulum, so the equation of motion is:

    $$ml^2\ddot{\phi}+c\dot{\phi}-mglsin(\phi)=u$$

    $$\Rightarrow \ddot{\phi} = \frac{g}{l}sin(\phi)-\frac{c}{ml^2}\dot{\phi}+\frac{u}{ml^2}$$

    Taking $x=\begin{bmatrix} x_1\\x_2 \end{bmatrix} = \begin{bmatrix} \phi \\ \dot{\phi} \end{bmatrix}$, then:

    $$\dot{x}=\begin{bmatrix} \dot{x}_1\\ \dot{x}_2 \end{bmatrix} = \begin{bmatrix} x_2 \\ \frac{g}{l}sin(x_1)-\frac{c}{ml^2}x_2+\frac{u}{ml^2} \end{bmatrix} = \begin{bmatrix} f_1(x,u) \\ f_2(x,u)\end{bmatrix} = f(x,u)$$

    Hence  $A=\left(\frac{\partial f(x,u)}{\partial x}\right)_{x=0} = \begin{bmatrix} 0 & 1 \\ \frac{g}{l} & \frac{-c}{ml^2} \end{bmatrix}$, as previously

    Also $B =\left(\frac{\partial f(x,u)}{\partial u}\right)_{(x=0,u=0)}= \begin{bmatrix} \frac{\partial f_1(x,u)}{\partial u} \\ \frac{\partial f_2(x,u)}{\partial u} \end{bmatrix} = \begin{bmatrix} 0 \\ \frac{1}{ml^2} \end{bmatrix}$

    For Proportioanal plus Derivative Control:

    $$u=-k_p\phi - k_d \dot{\phi} = -k_px_1 - k_d x_2$$

    $$\Rightarrow u = u(x) = u(0) + \left( \frac{\partial u}{\partial x} \right)_{x=0}x+\cdots$$

    $$= 0 + \begin{bmatrix} -k_p & -k_d \end{bmatrix} \begin{bmatrix} x_1 \\ x_2\end{bmatrix} + 0 + \cdots=Gx$$

    $$\Rightarrow BG = \begin{bmatrix} 0 \\ \frac{1}{ml^2} \end{bmatrix}\begin{bmatrix} -k_p & -k_d \end{bmatrix} = \begin{bmatrix} 0 & 0 \\ \frac{-k_p}{ml^2} & \frac{-k_d}{ml^2} \end{bmatrix}$$

    So we can write the linearised controlled system in the form:

    $$\dot{x} = f(x,u)=f(x,G(x))=(A+BG)x= \left( \begin{bmatrix}0 & 1 \\ \frac{g}{l} & \frac{-c}{ml^2} \end{bmatrix} + \begin{bmatrix} 0 & 0 \\ \frac{-k_p}{ml^2} & \frac{-k_d}{ml^2} \end{bmatrix} \right)\begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ \frac{g}{l}-\frac{k_p}{ml^2} & \frac{-(c+k_d)}{ml^2} \end{bmatrix}\begin{bmatrix} x_1 \\ x_2\end{bmatrix}$$

    The eigenvalues of the controlled system $A+BG$ are the roots of:

    $$ ⁍$$

    $$\Rightarrow \lambda_{1,2} = \frac{\frac{-(c+k_d)}{ml^2} \pm \sqrt{\frac{(c+k_d)^2}{m^2l^4}-4\left( \frac{k_p}{ml^2}-\frac{g}{l} \right)}}{2}$$

    So we can ensure that the real parts of both $\lambda_{1,2}$ are < 0 through choice of $k_p$ and $k_d$, and hence guaruntee local CL stability if $\left( \frac{k_p}{ml^2}-\frac{g}{l} \right) >0$, i.e. if $k_p > mgl$.

    This should agree with out intuition: near the steady state (equilibrium) $k_d \dot{\phi}$ and $c \dot{\phi}$ are negligible as the system is almost stationary, and so equation of motion is:

    $$ml^2 \approx mgl \phi - k_p \phi$$

    So if $k_p > mgl$ then $\ddot{\phi}$ will have the opposite sign to $\phi$, leading to a stable response.

- Summary

    The linearisation method is valuable, as it allows us to assess the stability of a nonlinear plant or system. From this we can design controllers that are stable.

    It has two limitations which may be significant:

    - The linearisation assumption becomes less accurate as the system moves away from the equilibrium state, hence the stability of the controlled system may change.
    - It cannot be used to determine the stability of systems whose linearised model is marginally stable.

    Nonetheless, the linearisation method is a useful tool for systems which are not too nonlinear and which always operate near the equilibrium state.