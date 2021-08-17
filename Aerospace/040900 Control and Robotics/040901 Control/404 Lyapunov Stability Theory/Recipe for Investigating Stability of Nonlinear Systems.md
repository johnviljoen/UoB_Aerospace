Links: [[404 Lyapunov Stability Theory]]
# Recipe for Investigating Stability of Nonlinear Systems

- Overview

    1. Express the systems dynamics in the form:

    $$\dot{x}=f(x)=\left(\frac{\partial f(x)}{\partial x}\right)_{x=0}x+f_{ht}(x)=Ax+e(x)$$

    2. Choose $Q$ and calculate $P$ such that $A^TP+PA=-Q$

    We know that the resulting quadratic Lyapunov function $V(x) = x^TPx$ will be $>0$ for all $x \neq 0$ and radially unbounded

    3. Calculate:

    $$ ⁍$$

    Then always $-x^TQx<0$ for all $x \neq 0$

    So $\dot{V}<0$ and stability is assured if we can show that **either**:

    $$x^TPe(x)<0$$

    or

    $$-x^TQx+2x^TPe(x)<0$$

- Notes
    1. Frequently we take $Q=I_n$ for simplicity, since we know $I_n$ is symmetric positive definite. This gives:

        $$-x^TQx = -(x_1^2 + x_2^2 + \cdots + x_n^2)$$

    2. Typically $2x^TPe(x)$ may have terms in $x_i^2, x_j^2, x_ix_j$ for $i,j = 1 ... n$. Hence it can be difficult to demonstrate whether this is $<0$ for all $x \neq 0$. E.g. if $2x^TPe(x) = x_1^2+x_2^2+4x_1x_2$ then this can be $=0, <0$ or $>0$ depending on $x_{1,2}$. Youngs inequality can be helpful in such cases:

        $$2ab \leq \frac{a^2}{\gamma}+\gamma b^2 \text{ for any real-valued } \gamma>0$$

    3. Note that in practice systems may be stable for significantly larger values of $u_0$ than those shown to be stable in the below example. This method yields rather conservative results.
- Example

    A mass, spring and damper system is driven by a force $u$, such that its equation of motion is:

    $$m\ddot{y} + c\dot{y} + ky=u_o ycos(\omega t)$$

    Using a quadratic Lyapunov function $V(x)=x^TPx$, show that the system will have global asymptotic stability at the origin if the following physical values apply: m=1kg, c=1Ns/m, k=1N/m, $u_0$=0.3N

    - Solution

        Using the recipe above:

        1. The system dynamics may be rewritten as:

            $$\ddot{y} = \frac{(-c\dot{y}-ky+u_0ycos(\omega t)}{m}$$

            Substituting the given physical values leads to:

            $$\ddot{y}=-\dot{y}-y+0.3ycos(\omega t)$$

            Define the state vector:

            $$x=\begin{bmatrix} x_1 \\ x_2 \end{bmatrix}=\begin{bmatrix} y \\ \dot{y} \end{bmatrix}$$

            Express this in the form:

            $$\dot{x} = f(x)=Ax + e(x)$$

            $$\therefore \dot{x}=\begin{bmatrix} \dot{x}_1 \\ \dot{x}_2 \end{bmatrix} = \begin{bmatrix}0& 1 \\ -1 & -1 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} + \begin{bmatrix} 0 \\ 0.3 x_1 cos(\omega t) \end{bmatrix}$$

        2. Set $Q=I_n=\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$, and find $P$ such that $A^TP + PA=-Q$:

            $$\Rightarrow\begin{bmatrix} -1 & 0 \\ 0 & -1 \end{bmatrix} = \begin{bmatrix} 0 & -1 \\ 1 & -1 \end{bmatrix}\begin{bmatrix} p_{11} & p_{12} \\ p_{21} & p_{22} \end{bmatrix} + \begin{bmatrix} p_{11} & p_{12} \\ p_{21} & p_{22} \end{bmatrix}\begin{bmatrix} 0 & 1 \\ -1 & -1 \end{bmatrix}$$

            Since we know $P$ will be symmetric, this means $p_{21} = p_{12}$

            Operating element-by-element:

            $$-1=0\times p_{11}-1\times p_{21}+p_{11}\times0+p_{12}\times(-1)=-2p_{12} \Rightarrow p_{12}=0.5$$

            $$0=-p_{22}+p_{11}-p_{12} \Rightarrow p_{11}=p_{22}+0.5$$

            $$0=p_{11}-p_{12}-p_{22} \text{ again}$$

            $$-1=p_{12}-p_{22}+p_{21}-p_{22}=1-2p_{22}$$

            $$\therefore p_{22}=1, p_{11}=1.5$$

            Combining these:

            $$P=\begin{bmatrix} 1.5 & 0.5 \\ 0.5 & 1 \end{bmatrix}$$

        3. Calculate $\dot{V}(x)=-x^TQx+2x^TPe(x)$

            $$\Rightarrow \dot{V}(x)=-\begin{bmatrix}x_1&x_2\end{bmatrix}\begin{bmatrix}1&0\\0&1\end{bmatrix}\begin{bmatrix} x_1\\x_2\end{bmatrix}+2\begin{bmatrix}x_1&x_2\end{bmatrix}\begin{bmatrix}1.5&0.5\\0.5&1\end{bmatrix}\begin{bmatrix}0\\0.3x_1cos(\omega t)\end{bmatrix}$$

            $$=-x_1^2-x_2^2+\begin{bmatrix}3x_1+x_2&x_1+2x_2\end{bmatrix}\begin{bmatrix}0\\0.3x_1cos(\omega t)\end{bmatrix}$$

            $$=-x_1^2-x_2^2+0.3x_1^2cos(\omega t) + 0.6x_1x_2cos(\omega t)$$

            i.e.

            $$-x^TQx=-x_1^2-x_2^2$$

            and

            $$2x^TPe(x)=0.3x_1^2cos(\omega t) +0.6x_1x_2cos(\omega t)$$

            For asymptotic stability this must be $<0$

            Whilst  $-x^TQx<0$, it is not true that $X^TPe(x)<0$ for all $x \neq 0$.

            Can we instead demonstrate stability by showing that: ?

            $$-x^TQx+2x^TPe(x)<0$$

            We know that $cos(\omega t)\leq1$ 

            $$\therefore \dot{V}(x)=-x^TQx+2x^TPe(x) \leq-x_1^2-x_2^2+0.3x_1^2+0.6x_1x_2$$

            $$=-0.7x_1^2-x_2^2+0.6x_1x_2$$

            Youngs inequality states $2ab \leq \frac{a^2}{\gamma}+\gamma b^2$

            $$\therefore 0.6x_1x_2 \leq 0.3\frac{x_1^2}{\gamma}+0.3\gamma x_2^2$$

            $$\therefore \dot{V}(x) \leq-x_1^2 \left( 0.7- \frac{0.3}{\gamma} \right)-x_2^2(1-0.3\gamma)$$

            This will be $<0$ if we can find a positive real value $\gamma$ such that:

            $0.7-\frac{0.3}{\gamma} >0$, and

            $1-0.3\gamma >0$

            The first condition is alternatively $\gamma>\frac{0.3}{0.7} \approx 0.429$

            The second condition is alternatively $\gamma \frac{1}{0.3}=3.3\dot{3}$

            These can be simultaneously satisfied by any value $\gamma$ between $0.429$ and $3.3\dot{3}$

            For illustration, taking e.g. $\gamma=1$ gives:

            $$\dot{V}(x) \leq -x_1^2 \left(0.7-\frac{0.3}{1} \right)-x_2^2(1-0.3\times 1)$$

            $$=0.4x_1^2-0.7x_2^2$$

            Which is clearly $<0$ for all $x \neq 0$

            Hence we can conclude that conditions 1, 2.ii, and 3 are satisfied, so the system is globally asymptotically stable.

            - Response Diagram:

                ![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2013.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2013.png)