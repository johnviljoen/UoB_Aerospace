Links: [[Lyapunov's Direct Method]] [[Summary]]
# Damped Pendulum Example

Local vs global stability for a simple damped pendulum

![Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2012.png](Lyapunov%20Stability%20Theory%20dee3b3f783af4b3a809edc3ac6957f0c/Untitled%2012.png)

The equation of motion is:

$$ml^2 \ddot{\theta} + c\dot{\theta}+mglsin(\theta)=0$$

$$\therefore \ddot{\theta}=-\frac{g}{l}sin(\theta)-\frac{c}{ml^2}\dot{\theta}$$

The state vector:

$$x = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}=\begin{bmatrix} \theta \\ \dot{\theta} \end{bmatrix}, \text{ so } x_2=\dot{x_1}$$

If we choose $V(x)$ to be the kinetic plus potential energy of the pendulum:

$$V(x) = \frac{1}{2}ml^2\dot{\theta}^2+mgl(1-cos(\theta))=\frac{1}{2}ml^2x_2^2+mgl(1-cos(x_1))$$

Then condition 1 is achieved: $V(x)>0$ for all $x \neq 0$.

Differentiating $V(x)$ gives:

$$\dot{V}(x)=ml^2x_2\dot{x}_2+mglsin(x_1)\dot{x}_1$$

$$=ml^2x_2\dot{x}_2+mglsin(x_1)x_2$$

$$=x_2(ml^2\dot{x}_2+mglsin(x_1))$$

The equation of motion is:

$$ml^2\dot{x}_2+cx_2+mglsin(x_1)=0$$

$$\therefore ml^2\dot{x}_2+mglsin(x_1)=-cx_2$$

$$\therefore \dot{V}(x)=x_2(-cx_2)=-cx_2^2$$

So condition 2.ii is also satisfied

However, condition 3 is not satisfied, since $V(x)$ does not tend to $\infty$ as $x_1 \rightarrow \infty$, i.e. $V(x)$ is not radially unbounded

This means that this choice of $V(x)$ suggests that the pendulum has local rather than global asymptotic stability. This should agree with intuition: there will be stable equilibria at $x_1=2n \pi$, where $n$ is any real integer.

Also note that the shape $V(x)$ will be similar to that of the locally asymptotically stable example $V(x)=x_2^2+1-cos(x_1)$ plotted above.

