Links: [[401 Multivariable System Dynamics]]
# Continuous Time Multivariable System Response

- Problem

    Given $\dot{x} = Ax + Bu$; $y=Cx$ determine *y* for a defined initial condition x(0) and input *u*

## Classical time-domain method

- Summary

    Solution for *x(t)* via the classical method:

    From the state equation: $\dot{x}-Ax(t)=Bu(t)$

    Considering the *integrating factor* $\mu(t) = e^{-At}$ and pre-multiplying each side of the above equation by this factor:

    $$e^{-At}[\dot{x}(t) - Ax(t)] = e^{-At}[Bu(t)]$$

    Now differentiate the product of the proposed solution $x(t)$ with $\mu(t)$:

    $$\frac{d}{dt}[e^{-At}x(t)] = -Ae^{-At}x(t)+e^{-At}\dot{x}(t) = e^{-At}[\dot{x}-Ax(t)]$$

    We then obtain:

    $$\frac{d}{dt}[e^{-At}x(t)] = e^{-At}[Bu(t)]$$

    Integration of both sides yields:

    $$e^{-At}x(t)= \int_{0}^{t} e^{-A\tau}[Bu(\tau)] \,d\tau + \chi \text{ , where } \chi \text{ is the constant of integration}$$

    Let $t=0$, and we see that:

    $$e^0x(0)=Ix(0)=0+\chi, \text{ ie } \chi = x(0)$$

    Substitute for $\chi$, multiply each side by $e^{At}$, and the solution drops out:

    $$x(t)=\underbrace{e^{At}x(0)}_{\text{Free response}} + \underbrace{\int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau}_{\text{Forced response}}$$

    Where $\underset{nxn}{e^{At}}$ is the *transition matrix*, $\int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau$ is the *convolution vector.*

    Question: How to determine $e^{At}$; where *t* is a scalar?

    Note: 

    - In general, $e^{At} \neq [e^{A(i,j)t}]$
    - When *A* is diagonal (note as L):

    $$e^{\Lambda(i,j)t} = \begin{cases} \begin{matrix} [e^{A(i,j)t}] & \text{ for i = j} \\ [0] &\text{ for i} \neq j \end{matrix} \end{cases}$$

    So can we diagnolise *A* via certin linear transformation?

    Yes! Detailed derivation is not shown here. (in appendix of traditional notes)

    If we define *Eigenvalue matrix* as:

    $$diag[\lambda_1,  \lambda_2,  \cdots, \lambda_n] = \begin{bmatrix} \lambda_1 & 0 & \cdots & 0 \\ 0 & \lambda_2 & \cdots & 0 \\ 0 & 0 & \ddots & 0 \\ 0 & 0 & \cdots & \lambda_n \end{bmatrix} = \underset{nxn}{\Lambda}$$

    and *Eigenvector matrix* as:

    $$\left[{\begin{array}{c|c|c|c}W_1 & W_2 & \cdots & W_n\end{array}}\right] = \underset{nxn}{W}$$

    Then, refer to the expressions of system response:

    $$x(t)=\underbrace{e^{At}x(0)}_{\text{Free response}} + \underbrace{\int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau}_{\text{Forced response}}$$

    We can write:

    $$e^{At}=We^{\Lambda t}W^{-1}$$

    $$\int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau = \int_{0}^{t} We^{\Lambda(t-\tau)}W^{-1}Bu(\tau) \,d\tau$$

- Example

    For the state equation below, use both the time domain and the Laplace Transform methods to determine the state reponses from zero initial conditions with $u_1(t) = u_2(t) = 0.02$.

    $$\begin{bmatrix} \dot{x_1}(t) \\ \dot{x_2}(t) \end{bmatrix} = \begin{bmatrix} -10 & 1 \\ -13.33 & 0 \end{bmatrix} \begin{bmatrix} x_1(t) \\ x_2(t) \end{bmatrix} + \begin{bmatrix} 6 & 4 \\ 8 & 5.33 \end{bmatrix}\begin{bmatrix} u_1(t) \\ u_2(t) \end{bmatrix}$$

    $$\begin{bmatrix} x_1(0) \\ x_2(0) \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}, u(t) = \begin{bmatrix} 0.02 \\ 0.02 \end{bmatrix}$$

    - Solution

        $\because x(0) = 0 \therefore \int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau = \int_{0}^{t} We^{\Lambda(t-\tau)}W^{-1}Bu(\tau) \,d\tau = \int_{0}^{t} e^{A\tau} \,d\tau \because \text{ u(t) is constant}$

        evals:

        $$\left|\begin{matrix} \lambda+10 & -1 \\ 13.33 & \lambda \end{matrix}\right| = 0 \Rightarrow \lambda^2 + 10 \lambda + 13.33 = 0$$

        $$\begin{matrix} \lambda_1=-8.416 \\ \lambda_2 = -1.584 \end{matrix}$$

        evecs:

        $$\begin{matrix} \lambda_1 = -8.416: W_1 = \begin{bmatrix} 1 \\ 1.584 \end{bmatrix} \\ \lambda_2 = -1.584: W_2 =\begin{bmatrix} 1 \\ 8.416 \end{bmatrix} \end{matrix}$$

        $$\therefore \text{Modal matrix}: W = \begin{bmatrix} 1 & 1 \\ 1.584 & 8.416 \end{bmatrix}, W^{-1} = \frac{1}{6.832} \begin{bmatrix} 8.416 & -1 \\ -1.584 & 1 \end{bmatrix}$$

        Answer:

        $$\int_{0}^{t} e^{\Lambda\tau} \,d\tau = \int_{0}^{t} \begin{bmatrix} e^{-8.416\tau} & 0 \\ 0 & e^{-1.584\tau} \end{bmatrix} \,d\tau = \begin{bmatrix} \frac{1}{8.416}(1-e^{-8.416t}) & 0 \\ 0 & \frac{1}{1.584}(1-e^{-1.584t}) \end{bmatrix}$$

        $$\therefore x(t) = W \int_0^t e^{\Lambda\tau} W^{-1}Bu  \,d\tau = \begin{bmatrix} 0.02-0.02463e^{-8.416t} +0.004639e^{-1.584t} \\ 0.03902e^{-1.584t}-0.03902e^{-8.416t} \end{bmatrix}$$

        Note this gives us information about evals and evecs and therefore stability that the Laplace method does NOT provide to us.

## Laplace Transform method

- Summary

    $\dot{x} = Ax(t) + Bu(t)$

    $\Rightarrow sx(s) - x(0) = Ax(s) + Bu(s)$

    $\Rightarrow x(s) = (sI-A)^{-1}x(0) + (sI-A)^{-1}Bu(s)$

    $\Rightarrow x(t) = \underbrace{\mathcal{L}^{-1} \{(sI-A)^{-1} \}x(0)}_{\text{Free Response}} + \underbrace{\mathcal{L}^{-1}\{(sI-A)^{-1}}_{\text{Forced Response}} \}$

    Note:

    - $e^{At} = \mathcal{L}^{-1} \{ (sI-A)^{-1} \}$ compare this with the scalar case: $e^{at} = \mathcal{L}^{-1} \{\frac{1}{s-a} \}$
    - $\int_{0}^{t} e^{A(t-\tau)}Bu(\tau) \,d\tau = \mathcal{L}^{-1} \{(sI-A)^{-1}Bu(s) \}$
- Example

    For the state equation below, use both the time domain and the Laplace Transform methods to determine the state reponses from zero initial conditions with $u_1(t) = u_2(t) = 0.02$.

    $$\begin{bmatrix} \dot{x_1}(t) \\ \dot{x_2}(t) \end{bmatrix} = \begin{bmatrix} -10 & 1 \\ -13.33 & 0 \end{bmatrix} \begin{bmatrix} x_1(t) \\ x_2(t) \end{bmatrix} + \begin{bmatrix} 6 & 4 \\ 8 & 5.33 \end{bmatrix}\begin{bmatrix} u_1(t) \\ u_2(t) \end{bmatrix}$$

    $$\begin{bmatrix} x_1(0) \\ x_2(0) \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix}, u(t) = \begin{bmatrix} 0.02 \\ 0.02 \end{bmatrix}$$

    - Solution

        $$\because x(0) = 0, x(t) = \mathcal{L}^{-1} \{(sI-A)^{-1}Bu(s)\} \text{ ,where } u(s)=\frac{1}{s}\begin{bmatrix} 0.02 \\ 0.02 \end{bmatrix}$$

        $$(sI-A)^{-1}=\begin{bmatrix}s+10 & -1 \\13.33 & s \end{bmatrix}^{-1} = \frac{1}{(s+8.416)(s+1.584)} \begin{bmatrix} s & 1 \\ -13.33 & s+10 \end{bmatrix}$$

        $$\therefore x(t) = \mathcal{L}^{-1} \left\{ \frac{1}{s(s+8.416)(s+1.584)} \begin{bmatrix} s & 1 \\ -13.33 & s+10 \end{bmatrix}\begin{bmatrix} 6 & 4 \\ 8 & 5.33 \end{bmatrix} \begin{bmatrix} 0.02 \\ 0.02 \end{bmatrix} \right\}$$

        $$\therefore x(t) = 0.02\mathcal{L}^{-1} \left\{ \frac{\frac{1}{13.33}\begin{bmatrix} 13.33 \\ 0\end{bmatrix}}{s} \frac{\frac{-1}{57.5}\begin{bmatrix} -70.83 \\ -112.2 \end{bmatrix}}{s + 8.416} \frac{\frac{1}{-10.82}\begin{bmatrix}-2.51 \\ -21.11 \end{bmatrix}}{s+1.584}\right\}$$

        $$\therefore x(t) = \begin{bmatrix} 0.02-0.02463e^{-8.416t} +0.004639e^{-1.584t} \\ 0.03902e^{-1.584t}-0.03902e^{-8.416t} \end{bmatrix}$$

        which is the same result as with the continuous time method 🙂