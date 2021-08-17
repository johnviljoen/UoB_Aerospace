Links: [[Lyapunov's Direct Method]]
# Full Explanation

The energy of a system and its dissipation are the conceptual basis for Lyapunov's Direct Method.

If the total energy of a system is continuously decreasing, then the system will eventually have zero energy and must therefore reach an equilibrium state.

This is true for all forms of energy - kinetic, potential, electrical, chemical etc.

It is also true for nonlinear as well as linear systems.

Conveniently, the total energy of a system, however complicated, is a simple scalar value.

**In mathematical form:**

The most general form of a system's dynamics was given previously as:

$$\dot{x}=f(x,t)$$

Also let $V(x)$ be a continuously diffenetiable function of $x$, **specified by us**, such that

1. $V(x)>0$ for all $x \neq 0$, and
2. i. $\dot{V}(x) \leq 0$ for all $x$

If these conditions are met, then $x=0$ will be stable for the system.

If the 2nd condition is tightened to be:

 2. ii. $\dot{V}(x)<0$ for all $x \neq 0$

Then $x=0$ will be *asymptotically* stable for the system.

If the above are true for values of $x$ which are within some finite doman $D$, then the system is said to be locally stable.

Global asymptotic stability is often required. To achieve this, $V(x)$ needs to satisfy a 3rd condition in addition to 1 and 2.ii:

 3. $V(x) \rightarrow \infty$ as $||x|| \rightarrow \infty$.

This condition is described as $V(x)$ being radially unbounded.

**In words**: Lyapunov's Direct Method states that we can demonstrate that a system is globally asymptotically stable if we can find a function $V(x)$ which is positive definite and radially unbounded (1 and 3), and whose time derivative $\dot{V}(x)$ is negative definite (2.ii).

- Diagram of local vs global asymptotic stability

	![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2010.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2010.png)

	![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2011.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2011.png)