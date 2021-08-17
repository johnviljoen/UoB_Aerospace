# Response of the Approximate Short Period Transfer Functions to a Step Input

> Links [[040300 Aircraft Dynamics]]

> Contents
> [[Chapter 3 Response of the Approximate Short Period Transfer Functions to a Step Input#3 1 Theory]]
> [[Chapter 3 Response of the Approximate Short Period Transfer Functions to a Step Input#3 2 Applied to Step Input]]

## 3.1 Theory

It is useful to understand the response of the approximate short period transfer function to a step input. This gives an insight into the influence of the transfer function parameters and indicates the considerations that are relevant when specifying pilot handling qualities for an aircraft.

The initial and final value theorems provide easy to apply methods or rules to help with determining the end points of the time response. These theorems are as follows:

**Initial Value Theorem**

$$\lim_{t \rightarrow 0} f(t) = \lim_{s \rightarrow \infty} sF(s)$$

**Final Value Theorem**

$$\lim_{t \rightarrow \infty} f(t) = \lim_{s \rightarrow 0} sF(s)$$

For example, the final value of $\alpha$ following a step input (i.e. $\alpha_{ss}$) can be found as follows.

$$\alpha = \theta - \gamma$$

so that

$$\alpha_{ss} = (\theta-\gamma)_{ss}$$

Now, $\theta(s) = \delta(s) \frac{k_q}{s} \frac{[T_{\theta_2}s+1]}{\Delta}$ and $\gamma(s) = \delta(s) \frac{k_q}{s} \frac{1}{\Delta}$.

So for a step input of unit amplitude, $\delta(s) = \frac{1}{s}$, we have:

$$\alpha_{ss} = s \frac{1}{s} \left[ \frac{k_q}{s} \frac{[T_{\theta_2s+1}]}{\Delta} - \frac{k_q}{s} \frac{1}{\Delta} \right] \bigg{|}_{s \rightarrow 0}$$ 

$$ = \frac{k_q}{s}\frac{T_{\theta_2}s}{\Delta} \bigg{|}_{s \rightarrow 0} = k_qT_{\theta_2}$$

An example of the initial value theorem is to find the initial normal acceleration, $n_{z_{cg}}$ following a unit step input.

$$\frac{n_{z_{cg}}(s)}{\delta(s)} = k_n \frac{1}{\Delta}$$

$$\therefore n_{z_{cg}0} = s\delta(s)k_n \frac{1}{\Delta} \bigg{|}_{s \rightarrow \infty} = 0$$

## 3.2 Applied to Step Input

Returning now to the response of the aircraft transfer function to a step input, [[Chapter 2 The Approximate Short Period Transfer Functions | Chapter 2]] showed that a common factor in the denominator is $\Delta$ and of course:

$$\Delta = \frac{s^2}{\omega_{sp}^2} + \frac{2\zeta_{sp}s}{\omega_{sp}} + 1$$

i.e. a second order system.

Consider first the response of a simple second order transfer function,

$$\frac{y}{x} = \frac{\omega_{sp}^2}{s^2 + 2\zeta_{sp}\omega_{sp}s + \omega_{sp}^2}$$

Now is $x$ is unit step input (i.e. $\frac{1}{s}$) then the response is as shown below.

![[Pasted image 20210208182216.png]]

However in the case of the pitch rate transfer function:

$$\frac{q(s)}{\delta(s)} = k_q\frac{T_{\theta_2}s+1}{\Delta}$$

there is a zero in the numerator (lead).

To see how this numerator may affect the response of the basic second order system, re-arrange the $q$ transfer function as:

$$\frac{q(s)}{\delta(s)} = k_q \left[ \frac{T_{\theta_2}s}{\Delta} + \frac{1}{\Delta} \right]$$

Thus the response of $q$ to a step input of the elevator will be the sum of the response of the basic second order system plus its derivative times $T_{\theta_2}$.

Assuming $\omega = 6$, $\zeta = 0.7$, $T_{\theta_2} = 0.25$ and $k_q=1$ then for a step input the $q$ response can be synthesized as shown below.

![[Pasted image 20210208182759.png]]

Thus it can be seen that the timing and magnitude of the initial peak of the $q$ response is significantly affected by $T_{\theta_2}$. Furthermore the initial slope of the $q$ response is finite and is $k_q T_{\theta_2} \omega_{sp}^2$.

Consider next the response of $\theta$, which is the integral of $q$, for pure longitudinal motions.

![[Pasted image 20210208183032.png]]

Now if the step input is applied and then removed the response for a range of $T_{\theta_2}$ values can be considered.

![[Pasted image 20210208183117.png]]

![[Pasted image 20210208183128.png]]

The influence of $T_{\theta_2}$ also appears in the flight path angle response since:

$$\frac{\theta(s)}{\delta(s)} = \frac{k_q}{s} \frac{[T_{\theta_2}s+1]}{\Delta}$$

and

$$\frac{\gamma(s)}{\delta(s)} = \frac{k_q}{s} \frac{1}{\Delta}$$

$$\therefore \frac{\gamma(s)}{\delta(s)} = \frac{k_q}{s} \frac{1}{\Delta} \frac{s}{k_q} \frac{\Delta}{[T_{\theta_2}s+1]} = \frac{1}{[T_{\theta_2}s+1]}$$

In other words the flight path angle lags the pitch angle response by a first order transfer function with a time constant of $T_{\theta_2}$.

Also since 

$$\alpha_{ss} = (\theta -\gamma)_{ss} = k_qT_{\theta_2}$$

$$q_{ss} = k_q$$

and 

$$\dot{\gamma}_{ss} = k_q$$

the $\theta$ and $\gamma$ time responses have the same steady state slop, $k_q$, following a step input.

![[Pasted image 20210208183806.png]]

![[Pasted image 20210208183820.png]]

Example time response for the approximate short period transfer function with $T_{\theta_2}$ varies and $k_q$ constant.
