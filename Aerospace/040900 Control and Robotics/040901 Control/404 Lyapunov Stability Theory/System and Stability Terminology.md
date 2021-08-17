Links: [[404 Lyapunov Stability Theory]]
# System and Stability Terminology

- Recap of some linear systems terminology
	
    State Space notation: $\dot{x} = Ax + Bu + d$

    Where:

    $x$ is the state vector of dimensions $n\times1$: $x=\begin{bmatrix} x_1 \\ x_2 \\ \vdots \\ x_n \end{bmatrix}$,

    $A$ is the $n\times n$ system (plant) matrix

    $B$ is the $n\times m$ input matrix

    $u$ is the $m\times 1$ input vector

    $d$ is a disturbance vector, frequently assumed to be zero

    The measured outputs $y$ and controlled outputs $z$ are related to the states via: $y=Cx$ and $z=Ex$

    $C$ and $E$ are respectively the measured and controlled output matrices.

    In a controlled system, the control signal (input vector $u$) is itself generally a function of the system state $x$. For example state-feedback control of multivariable systems:

    ![Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFC_block_diagram.svg](Control%20of%20Multivariable%20Systems%20f6a76d65550b4b578a169bfde98f2e31/SFC_block_diagram.svg)

    For the above, the control signal is: $u=-Kx+K_Rr$, so the CL dynamics are:

    $$\dot{x} = Ax-BKx+BK_Rr=(A-BK)x+BK_Rr$$

    So for a linear system, CL stability is assured if all the n evals of ($A-BK$) are in the LHP. This is highly useful, since for any plant $\{A,B\}$ we can generally place the evals wherever we wish, e.g. to give a quick, critically damped response.

    Other features of linear systems:

    - if $A$ is non-singular, then a linear system will have a **unique equilibrium state** (point).
    - The equilibrium point will be stable if all the evals of $A$ are in the LHP, irrespective of the initial conditions.
    - The transient response of the systems is determined by the natural modes of the system, and we can solve its behaviour analytically, e.g. via:

    $$x(t)=\underbrace{e^{At}x(0)}_{\text{Free response}} + \underbrace{\int{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau}_{\text{Forced response}}$$

    - A sinusoidal input will result in a sinusoidal output of the same frequency.
    - Superposition applies, so e.g. doubling the input will double the output.
- Stability Concepts

    Stability is almost invariably an essential requirement for controlled systems, whether linear or nonlinear.

    However, when the assumption of linearity is removed, it is significantly more difficult to demonstrate stability, theoretically or experimentally.

    For example, a nonlinear system may be stable for small inputs, but not for large ones.

    The system with equation $\dot{y} = -y + y|y|^{0.5}$ shown below converges to 0 for inital condition $|y(0)|<1$, but is unstable for $|y(0)|>1$. Moreover, there are 3 equilibrium values for $y$ (namely -1,0,1) of which only one is a stable equilibrium.

    ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/imageonline-co-invertedimage_(5).png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/imageonline-co-invertedimage_(5).png)

    It is helpful to introduce some new expressions in order to examine stability of nonlinear systems:

    **System Dynamics** can be expressed in several ways:

    $\dot{x} = f(x,t)$ , general dynamics, non-autonomous system 

    $\dot{x} = f(x,u,t)$, general controlled system dynamics, leading to:

    $\dot{x} = f(x,G(x),t)$, since $u=G(x)$

    $\dot{x} = f(x)$, general dynamics, autonomous system

    $\dot{x} = A(t)x+B(t)u$, linear, time-variant controlled system

    $\dot{x} = Ax+Bu$, linear, time-invariant controlled system

    **Equilibrium**

    At equilibrium, clearly $\dot{x}=0$

    $\Rightarrow f(x^*,u,t)=0$ for a general system, where $x^*$ is an equilibrium state.

    For a linear time-invariant system with $u=0$, this means $Ax^*=0$ hence $x^*=0$ or $A$ is singular.

    note that if the equilibrium is not at the origin $(x^*=x_e \neq0)$, then it can be effectively moved there by subtracting $x_e$ from $x$. This change of variable will generally be assumed for algebraic simplicity.

    **Asymptotic Stability**

    For an asymptotically stable system: $x(t) \rightarrow 0$ as $t \rightarrow \infty$.

    **Global and local asymptotic stability**

    For a globally asymptotically stable system: $x(t) \rightarrow 0$ as $t \rightarrow \infty$, for any initial state $x(0)$.

    For a locally asymptotically stable system:  $x(t) \rightarrow 0$ as $t \rightarrow \infty$, provided that the initial state $x(0)$ is within some range, known as the ***zone of attraction***.

    **Lyapunov Stability**

    A Lyapunov-stable system is one whose state will remain in some region near to the origin without necessarily reaching the origin.

    **Exponential Stability**

    A system is exponentially stable if it is asymptotically stable *and* if there exists values $\alpha>0,\lambda >0$, such that $||x(t)||≤\alpha||x(0)||e^{-\lambda t}$ for all $t>0$

    This means that the system will converge to the origin at a rate at least as fast as an exponential function $e^{-\lambda t}$.

    Note that a system that is exponentially stable will be asymptotically stable, but the reverse is not necessarily true.

    For a **controlled** system, it is desireable to **demonstrate** that the system is **globally exponentially stable**.

    This can be significantly more difficult to demonstrate for nonlinear systems than for linear ones

    To illustrate global and local stability, consider the systems shown schematically below, in which a ball is constrained to roll under gravity along one of 2 curves, with some dissipative damping/friction:

    ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled.png)

    We define the system states as $x=\begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} y \\ \dot{y} \end{bmatrix}$, where $y$ is the *horizontal* position of the ball. The blue (on uninverted photo) system (initial conditions 1 and 2) has global stability: for any initial values of displacement $y(0)$ and velocity $\dot{y}(0)$. The ball will eventually end up stationary at the origin i.e. $x(t) \rightarrow \begin{bmatrix} 0 \\ 0 \end{bmatrix} = 0$ as $t \rightarrow \infty$

    This can be shown in the phase plane, i.e. plotting $x_2(t)$ vs $x_1(t)$ (or $\dot{y}(t)$ vs $y(t)$).

    ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%201.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%201.png)

    The orange (on uninverted photo) system has local stability: if the ball is initially stationary and the absolute value of its initial position $|y(0)|<y_{cr}(3)$ then it will eventually end up stationary at the origin.

    However, if it starts outside these limits $(4)$ the response wil be unstable.

    Therefore the **zone of attraction** is $-y_{cr}<y(0)<y_{cr}$

    This can be broadened to include the effects of non-zero initial velocity:

    From energy considerations, the ball will remain in the gravitational potential well if its initial total kinetic + potential energy is less than the energy needed to escape the gravitational potential well.

    Assuming conservatively for now that the dmping term is negligible, then we can express this as:

    $$mgz(0)+\frac{1}{2}m\dot{y}^2(0)<mgh$$

    Where $z(0)$ is the initial height of the ball above the x-axis

    This reduces to:

    $$gz(0)+\frac{1}{2}\dot{y}(0)<gh$$

    The region of attraction can then be shown in the $\dot{y}$ vs $y$ phase plane:

    ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%202.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%202.png)

    **Limit Cycles** are an example of a Lyapunov-stable system.

    In a limit cycle, the **system oscillates continuously** over some finite range.

    This in not generally a desireably result, but can be the consequence of a system with inherently nonlinear dynamics or a nonlinear controller.

    The **Van der Pol equation** is a well known example of a limit cycle:

    $$m\ddot{y} + c(y^2-1)\dot{y}+ky=0$$

    This can be regarded as a standard mass, spring damper system, except that the dampener term varies with $y$:

    For $y^2<1$ the damping is negative, hence the system will be unstable at such values, so that the origin $x=\begin{bmatrix} y \\ \dot{y} \end{bmatrix}=\begin{bmatrix} 0 \\ 0 \end{bmatrix} = 0$ cannot be a stable equilibrium.

    But for $y^2>1$ the damping is positive and hence stable. So we would expect the system to oscillate with $y^2$ sometimes $>1$ and sometimes $<1$.

    The behaviour of $m=k=1$, $c=0.25$ is show below for 2 different initial conditions. A limit cycle is clearly visible.

    ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%203.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%203.png)