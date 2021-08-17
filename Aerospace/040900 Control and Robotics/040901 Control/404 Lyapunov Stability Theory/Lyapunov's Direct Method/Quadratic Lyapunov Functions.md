Links: [[Lyapunov's Direct Method]]

# Quadratic Lyapunov Functions

A quadratic Lyapunov function is of the form

$$V(x)=x^TPx$$

Where $P$ is an $n\times n$ matrix, to be determined by the control engineer.

If $P$ is symmetric positive definite then $V(x)=x^TPx$ will satisfy conditions 1 and 3, hence quadratic Lyapunov functions are often a good starting point in the search for a suitable $V(x)$.

Condition 2.ii $(\dot{V}(x)<0$ for all $x \neq 0)$ must also be satisfied to demonstrate stability.

First we investigate quadratic Lyapunov functions for **linear systems**: $\dot{x}=f(x)=Ax$

**Theorem**:

For any given symmetric positive definite matrix $Q$ and matrix $A$ whose eigenvalues have strictly negative real parts, there exists a symmetric positive definite matrix $P$ such that:

$$A^TP+PA=-Q \text{ (This is Lyapunov's equation)}$$

Given $V(x)=x^TPx$, then

$$\dot{V}(x)=\dot{x}^TPx+x^TP\dot{x}$$

$$=(Ax)^TPx+x^TPAx$$

$$=x^TA^TPx+x^TPAx$$

$$=x^T(A^TP+PA)x$$

$$=-x^TQx$$

Since $Q$ is symmetric positive definite, this means that:

$$\dot{V}(x)=-x^TQx<0 \text{ for all }x \neq 0$$

So for stable linear systems, we can conclude that:

If we choose a symmetric positive definite matrix $Q$ and from that calculate $P$ such that $A^TP+PA=-Q$, then resulting quadratic Lyapunov function of the form $V(x)=x^TPx$ will have $\dot{V}(x)<0$ for all $x \neq 0$, so satisfying condition 2.ii.

Also as previously noted $V(x)=x^TPx$ will satisfy conditions 1 and 3, hence global asymptotic stability of linear systems will be demonstrated via this choice of $V(x)$

Now we investigate quadratic Lyapunov functions for **nonlinear systems**.

Previously we used Maclaurin's theorem to express nonlinear dynamics in the form:

$$\dot{x}= f(x) =\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}x + f_{ht}(x)$$

Where the linear component:

$$A=\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}$$

For simplicity of notation, now let $e(x)=f_{ht}(x)$

$$\therefore \dot{x}=f(x)=Ax+e(x)$$

As previously, let $V(x) = x^TPx$, so again

$$\dot{V}(x)=\dot{x}^TPx+x^TP\dot{x}$$

$$= (Ax+e(x))^TPx+x^TP(Ax+e(x))$$

$$=(Ax)^TPx+x^TPAx+e(x)^TPx+x^TPe(x)$$

$$=x^T(A^TP+PA)x+e(x)^TPx+x^TPe(x)$$

Since $A^TP+PA=-Q$ and $P$ is symmetric, this reduces to:

$$\dot{V}(x)=-x^TQx+2x^TPe(x)$$

If this can be shown to be $<0$ for all $x \neq 0$ then global asymptotic stability is assured.