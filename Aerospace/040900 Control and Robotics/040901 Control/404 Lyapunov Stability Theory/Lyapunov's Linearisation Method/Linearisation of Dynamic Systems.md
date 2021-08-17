Links: [[Lyapunov's Linearisation Method]]

# Linearisation of Dynamic Systems

We previously noted the following general equation of motion for a (nonlinear) autonomous system: $\dot{x}=f(x)$

If necessary, we can generally transform the state variable $x$ such that $x=0$ is an equilibrium state, i.e. such that $f(0)=0$

Via Maclaurin's series, we can expand $f(x)$:

$$f(x)=f(0)+\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}x+\frac{1}{2} \left( \frac{\partial^2f(x)}{\partial x^2} \right)_{x=0}x^2 + \cdots$$

Since $f(0) = 0$ we can eliminate it and write the above as:

$$f(x)=\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}x+f_{ht}(x)$$

Where $f_{ht}(x)$ is the sum of all higher order (nonlinear) terms.

$\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}$ is the jacobian matrix of $f(x)$ with respect to $x$ at $x=0$.

Hence if $x$ has n states then $\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}$ is an $n\times n$ matrix whose elements $\{i,j\}=\frac{\partial f_i(x)}{\partial x_j}$.

If we now write $A = \left(\frac{\partial f(x)}{\partial x}\right)_{x=0}$, then the linearised equation of the system has the familiar form: $\dot{x}=Ax$

From this we can assess the stability and behaviour of the nonlinear system near to the equilibrium point, simply via the evals($A$).

In particular:

- If the linearised system is unstable (i.e. at least one of the evals of $A$ is strictly in the RHP), then the equilibrium point of the nonlinear system will be unstable.
- If the linearised system is stable (i.e. all of the evals of $A$ are strictly in the LHP), then the equilibrium point of the nonlinear system will be asymptotically stable.
- If the linearised system is marginally stable (i.e. at least one of the evals of $A$ is on the imaginary axis and the remaining ones are strictly in the LHP), then the stability of the equilibrium point of the nonlinear system cannot be determined: it ould be stable, asymptotically stable, or unstable.

The 3rd point is understood by recognising that if the linearised system is marginally stable, then the (higher order, ignored) nonlinear terms will govern stability of the system. But since they were eliminated via the linearisation process, we will not be able to asceratain either their effects, or the stability of the system.