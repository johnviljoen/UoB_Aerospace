Links: [[Lyapunov's Direct Method]]

# Nonlinear 1st Order Example

Non-linear 1st order system - again:

Recall the equation $\dot{y} = \alpha y + \beta y^3$, expressed as:

$$\dot{x}=\alpha x_1+\beta x_1^3=f(x)$$

This has one equilibrium value at $x_1=0$ and two more at $x_1 = \pm \sqrt{\frac{-\alpha}{\beta}}$.

Taking $x_1=0$, then:

$$A=\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}=\alpha+3\beta x_1^2 \big|_{x_1=0}=\alpha$$

The eigenvalue is found via $|\alpha-\lambda|=0$, i.e. $\lambda=\alpha$

$\therefore$ the system will be stable if $\alpha<0$ and unstable if $\alpha>0$

However, if $\alpha=0$ then the linearisation method did not allow us to conclude whether the system is stable or not, since the system is then $\dot{y}=\beta y^3$, and we had eliminated the higher order $(\beta)$ term via linearisation.

If we now take:

$$ ⁍$$

Then conditions 1 and 3  are satisfied.

Differentiating $V(x)$ gives:

$$\dot{V}(x) = 2x \dot{x} = 2x\beta x^3=2\beta x^4$$

$\therefore$ condition 2.ii is also satisfied if $\beta<0$, so we conclude that the system is globally asymptotically stable.