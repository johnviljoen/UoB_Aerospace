Links: [[Lyapunov's Direct Method]]

# Summary

The most general form of a system's dynamics was given previously as:

$$\dot{x}=f(x,t)$$

Let $V(x)$ be a continuously differentiable function of $x$, **specified by us**, such that

1. $V(x)>0$ for all $x \neq 0$, and
2. i. $\dot{V}(x) \leq 0$ for all $x$

If these conditions are met, then $x=0$ will be stable for the system.

If the 2nd condition is tightened to be:

 2. ii. $\dot{V}(x)<0$ for all $x \neq 0$

Then $x=0$ will be *asymptotically* stable for the system.

If the above are true for values of $x$ which are within some finite domain $D$, then the system is said to be locally stable.

Global asymptotic stability is often required. To achieve this, $V(x)$ needs to satisfy a 3rd condition in addition to 1 and 2.ii:

 3. $V(x) \rightarrow \infty$ as $||x|| \rightarrow \infty$.

This condition is described as $V(x)$ being radially unbounded.