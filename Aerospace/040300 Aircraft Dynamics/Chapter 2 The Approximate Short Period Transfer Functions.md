

# The Approximate Short Period Transfer Functions

> Links [[040300 Aircraft Dynamics]]

> Contents:
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 1 Intro]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 2 Cramers Rule]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 3 The Aircraft Longitudinal Equations]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 4 Summary of Equations]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 4 1 Transfer Functions]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 4 2 Parameter Definitions]]
> [[Chapter 2 The Approximate Short Period Transfer Functions#2 5 Numerical Example]]

## 2.1 Intro

The usual form of the aircraft equations of motion is a set of matrix equations as given in [[Chapter 1 Revision Notes on Aircraft Equations of Motion | Chapter 1]]. These can be visualised in terms of Newton’s second law and are easily related to the motion in each axis. However, they do not readily provide an insight into the system dynamics from a control point of view. For example the natural frequencies, damping ratios and gains are not evident. To establish these it is more simple to convert the equations into transfer function form. The simplest and most widely used algebraic approach to this is by using Cramer’s rule.

The ultimate aim is to get a transfer function which is in terms of first and second order factors in _s_, the Laplace operator, since these are readily understood. For example, a transfer function with a second order denominator can always be rearranged to be:

$$ \frac{\text{numerator}}{(s^2+2\zeta\omega_ns+\omega_n^2)}$$

In this way the frequency and damping can easily be deduced.

## 2.2 Cramers Rule

#### Theory
          
See Kreysig “Advanced Engineering Mathematics” for a full description. In this unit, however, it is sufficient to recall that given:

$$\pmb{A}(s)\pmb{x}(s)=\pmb{Bu}(s) \tag{1}$$

$$x_j = \frac{|\pmb{A}_j|}{|\pmb{A}|}\pmb{u}$$

In the situations discussed here $\pmb{A}$ is a matrix, $\pmb{x}$ is a vector of responses, and $\pmb{B}$ is a vector which scales the input, $\pmb{u}$, into each equation.

The equation says:

>To obtain the response of the _j_th element of **x** given a single input, _u_, find the determinant of the matrix **A** with the _j_th column replaced by **B**, and divide this by the determinant of **A** itself.


## 2.3 The Aircraft Longitudinal Equations

The main example to be used in this course is the development of the transfer function for the approximate short period motion resulting from a pitch command. This will lead on to the parameters relevant to pilot handling qualities. The longitudinal equations were given in [[Chapter 1 Revision Notes on Aircraft Equations of Motion | Chapter 1]]:-

$$ \begin{bmatrix} ms-X_u & -X_w & mg-(X_q+mW_0)s \\ -Z_u & ms-Z_w & -(Z_q + mU_0)s \\ -M_u & -(M_w + M_\dot{w}s) & I_{yy}s^2-M_qs \end{bmatrix} \begin{bmatrix} u \\ w \\ \theta \end{bmatrix} = \begin{bmatrix} X_\delta \\ Z_\delta \\ M_\delta \end{bmatrix}\delta \tag{2} $$

where $\delta$ represents the sum of control surface effects. 

By deleting the column and row associated with the forward speed ($u$) terms the equations for the approximate short period motion are obtained.

$$ \begin{bmatrix} ms-Z_w & -(Z_q + mU_0)s \\  -(M_w + M_\dot{w}s) & I_{yy}s^2-M_qs \end{bmatrix} \begin{bmatrix} w \\ \theta \end{bmatrix} = \begin{bmatrix} Z_\delta \\ M_\delta \end{bmatrix} \delta $$

Dividing the first eqution through by $m$ and the second by $I_{yy}$ allows some simplifications to be made:

$$ \begin{bmatrix} s-\frac{Z_w}{m} & -\frac{Z_qs}{m}-U_0s \\ -\frac{M_w}{I_{yy}}-\frac{M_\dot{w}s}{I_{yy}} & s^2-\frac{M_qs}{I_{yy}} \end{bmatrix} \begin{bmatrix} w \\ \theta \end{bmatrix} = \begin{bmatrix} \frac{Z_\delta}{m} \\ \frac{M_\delta}{I_{yy}} \end{bmatrix}\delta $$
          
Certain assumptions can now be made which are reasonably valid in most cases relating to the short period approximation of a conventional aircraft. They are useful because they simplify the algebra and make the resulting expressions clearer. A fuller analysis would not make them. The assumptions are:

- $\frac{Z_q}{m}$ can be deleted since it is much smaller than $U_0$
- $\frac{Z_\delta}{m}$ can also be deleted as it is small

The equations for the short period motion therefore reduce to:

 $$ \begin{bmatrix} s-\frac{Z_w}{m} & -U_0s \\ -\frac{M_w}{I_{yy}}-\frac{M_\dot{w}s}{I_{yy}} & s^2-\frac{M_qs}{I_{yy}} \end{bmatrix} \begin{bmatrix} w \\ \theta \end{bmatrix} = \begin{bmatrix} 0 \\ \frac{M_\delta}{I_{yy}} \end{bmatrix}\delta \tag{3}$$
 
Now with Cramer’s rule the transfer function from a command input $\delta$ to both the $w$ and the $\theta$ response can be found. The first step is to find the denominator of the transfer function, which is the determinant of the above matrix:

 $$ \begin{vmatrix} s-\frac{Z_w}{m} & -U_0s \\ -\frac{M_w}{I_{yy}}-\frac{M_\dot{w}s}{I_{yy}} & s^2-\frac{M_qs}{I_{yy}} \end{vmatrix} = s \left[ s^2-s\left( \frac{Z_w}{m} + \frac{M_q}{I_{yy}} + \frac{M_\dot{w}U_0}{I_{yy}} \right) + \frac{Z_wM_q}{mI_{yy}} - \frac{M_wU_0}{I_{yy}} \right] $$ 
 
 Which is of the form:
 
 $$ s \left[ s^2 + 2\zeta_{sp}\omega_{sp}s + \omega_{sp}^2 \right] $$
 
 Which can be rearranged as:
 
 $$s\omega_{sp}^2 \left[ \frac{s^2}{\omega_{sp}^2} + \frac{2\zeta_{sp}s}{\omega_{sp}}+1 \right] $$
 
 Where the short period natural frequency: $\omega_{sp} = \sqrt{\frac{Z_wM_q}{mI_{yy}} - \frac{M_wU_0}{I_{yy}}}$
 
 and the short period damping ratio $\zeta_{sp}$ can be found from:
 
 $$ 2\zeta_{sp}\omega_{sp} = -\left( \frac{Z_w}{m} + \frac{M_q}{I_{yy}} + \frac{M_\dot{w}U_0}{I_{yy}} \right) $$
 
 To simplify the notation further it is convenient to define:
 
 $$ \Delta = \left[ \frac{s^2}{\omega_{sp}^2} + \frac{2\zeta_{sp}s}{\omega_{sp}} + 1 \right] $$
 
 so that the denominator of the transfer functions will be $s\omega_{sp}^2\Delta$
 
 The next step is to find the numerator of the transfer function for $\theta$. This is given by the determinant of the matrix in equation (3) with the second column replaced by the vector on the right hand side, i.e.:
 
 $$ \begin{bmatrix} s-\frac{Z_w}{m} & 0 \\ -\frac{M_w}{I_{yy}}-\frac{M_\dot{w}s}{I_{yy}} & \frac{M_\delta}{I_{yy}} \end{bmatrix} = \left( s-\frac{Z_w}{m}\right)\frac{M_\delta}{I_{yy}} = -\frac{Z_w}{m}\frac{M_\delta}{I_{yy}}\left[ -\frac{m}{Z_w}s+1 \right] $$
 
 $-\frac{m}{Z_w}$ is a special parameter known as *pitch angle lead time constant* and is given the symbol $T_{\theta_2}$. Thus the numerator of the transfer function of the $\theta$ response is:
 
 $$ \frac{M_\delta}{T_{\theta_2}I_{yy}}(T_{\theta_2}s +1) $$
 
 $T_{\theta_2}$ is an important parameter and it is worth considering its physical significance.
 
 $$ T_{\theta_2} = -\frac{m}{Z_w} $$

Now, since $Z_ww \approx -\cos(\alpha)\left( \frac{1}{2}\rho V_f^2 SC_{L_\alpha}\alpha\right)$ ignoring the component of $C_D$ for small $\alpha$ and $V_f \cos(\alpha)=U$, then

$$ Z_w = -\frac{(\frac{1}{2}\rho V_fSC_{L_\alpha}\alpha)U}{w} = -\frac{1}{2}\rho V_fSC_{L_\alpha} $$

and thus: 

$$ T_{\theta_2}=\frac{m}{(C_{L_\alpha}\frac{1}{2}\rho V_f S)} $$

Thus, for a given flight condition, $T_{\theta_2}$ is the wing loading ($\frac{m}{S}$) divided by the lift curve slope $(C_{L_\alpha})$. It is therefore a function of the aerodynamic design of the aircraft.

Returning to the transfer function for $\theta$ we have in terms of $T_{\theta_2}$:

$$ \frac{\theta(s)}{\delta(s)}= \frac{k_q}{s} \frac{[T_{\theta_2}s+1]}{\Delta} $$

where the pitch rate gain is given by

$$ k_q = \frac{M_\delta}{\omega_{sp}^2 I_{yy} T_{\theta_2}} $$

Differentiating this transfer function gives expressions for $q$ and $\dot{q}$:

$$\frac{q(s)}{\delta(s)} = k_q \frac{[T_{\theta_2}s+1]}{\Delta} \tag{5}$$

$$ \frac{\dot{q}(s)}{\delta(s)} = k_qs \frac{[T_{\theta_2}s+1]}{\Delta} \tag{6}$$

Similarly to find the transfer function of $w$ the numerator is given by:

$$ \begin{vmatrix} 0 & -U_0s \\ \frac{M_\delta}{I_{yy}} & s^2-\frac{M_qs}{I_{yy}} \end{vmatrix} = \frac{sM_\delta U_0}{I_{yy}}$$

$$ \therefore \frac{w(s)}{\delta(s)} = \frac{sM_\delta U_0}{I_{yy} \omega_{sp}^2s\Delta} = U_0k_q\frac{T_{\theta_2}}{\Delta} $$

This transfer function can now be used to find the transfer function of the normal acceleration at the c.g. due to the input $\delta$/ From [[Chapter 1 Revision Notes on Aircraft Equations of Motion | Chapter 1]] it can be seen that the inertial acceleration normal to the aircraft body x-axis is:

$$n_{z_{cg}} = -\frac{\dot{w}-U_0q}{g}$$

$$\therefore \frac{n_{z_{cg}}}{\delta}=-\left[ U_0k_q\frac{T_{\theta_2}s}{\Delta} - U_0k_q \frac{[T_{\theta_2}s+1]}{\Delta} \right] \frac{1}{g}$$

$$=\frac{U_0k_q}{g\Delta} = \frac{k_n}{\Delta}$$

where $k_n = \frac{U_0k_q}{g}$ is the normal acceleration gain.

Transfer functions for the flight path angle, $\gamma$, and the angle of incidence, $\alpha$, are also useful. To find the expression for the flight path angle consider an aircraft in an instantaneous circular path: 

![[Pasted image 20210208171708.png]]

The forward velocity is $V_f$, angular velocity $\dot{\gamma}$ anf the flight path radius $R$.

$$\therefore n_{z_{cg}} = \dot{\gamma}^2R$$

but $$V_f = \dot{\gamma}R$$

$$\therefore n_{z_{cg}}g = \dot{\gamma}V_f$$

and

$$V_f = \frac{U_0}{\cos(\alpha)} \approx U_0$$

so that an expression for $\gamma$ can be written as

$$\gamma U_0 = \frac{n_{z_{cg}}g}{s}$$

$$\therefore \frac{\gamma}{\delta} = \frac{n_{z_{cg}}}{s\delta} \frac{g}{U_0} = \frac{k_q}{s}\frac{1}{\Delta}$$

and since $\alpha = \theta - \gamma$:

$$\frac{\alpha}{\delta} = \frac{k_q T_{\theta_2}}{\Delta}$$

## 2.4 Summary of Equations

### 2.4.1 Transfer Functions

$$\frac{\theta(s)}{\delta(s)} = \frac{k_q}{s} \frac{[T_{\theta_2}s+1]}{\Delta}$$
 
 $$\frac{q(s)}{\delta(s)} = k_q \frac{[T_{\theta_2}s+1]}{\Delta}$$
 
 $$\frac{\dot{q}(s)}{\delta(s)} = k_qs \frac{[T_{\theta_2}s+1]}{\Delta}$$
 
 $$\frac{\gamma(s)}{\delta(s)} = \frac{k_q}{s} \frac{1}{\Delta}$$
 
 $$\frac{\alpha(s)}{\delta(s)} = \frac{k_q T_{\theta_2}}{\Delta}$$
 
 $$\frac{n_{z_{cg}}(s)}{\delta(s)} = k_n\frac{1}{\Delta}$$
 
 ### 2.4.2 Parameter Definitions
 
 $$\Delta = \frac{s^2}{\omega_{sp}^2} + \frac{2\zeta_{sp}s}{\omega_{sp}} + 1$$
 
 $$\omega_{sp} \space \space \space \text{ short period natural frequency}$$
 
 $$\zeta_{sp} \space \space \space \text{ short period damping ratio}$$
 
 $$T_{\theta_2} \approx -\frac{m}{Z_w} \space \space \space \text{pitch angle lead time constant}$$
 
 $$k_q \approx \frac{M_\delta}{\omega_{sp}^2 I_{yy} T_{\theta_2}} \space \space \space  \text{ pitch rate gain}$$
 
 $$k_n = \frac{U_0}{g} k_q \space \space \space \text{ normal acceleration gain}$$
 
 ## 2.5 Numerical Example 

The equations for the Paris aircraft which used to be operated by Cranfield are given by:

$$\begin{bmatrix} \dot{u} \\ \dot{w} \\ \dot{q} \\ \dot{\theta} \end{bmatrix} = \begin{bmatrix} -0.0246 & 0.0265 & 0.0 & -0.0629 \\ -0.126 & -2.562 & 0.998 & 0 \\ 0.1367 & -19.38 & -3.494 & 0 \\ 0 & 0 & 1 & 0 \end{bmatrix} \begin{bmatrix} u \\ w \\ q \\ \theta \end{bmatrix} + \begin{bmatrix} 0.0 \\ -0.1926 \\ 45.21 \\ 0 \end{bmatrix} \eta$$

For the short period approximation the row and columns in the state $u$ can be deleted. Rearraging this reduced set of equations into the same form as equation (1) gives

$$\begin{bmatrix} s+2.562 & -0.998 & 0 \\ 19.38 & s+3.494 & 0 \\ 0 & -1 & s \end{bmatrix} \begin{bmatrix} w \\ q \\ \theta \end{bmatrix} = \begin{bmatrix} -0.1926 \\ 45.21 \\ 0 \end{bmatrix} \eta$$

To get the $q$ response to $\eta$, first find the denominator of the transfer function which is the determinant of the left-hand side matrix, i.e.

$$ s \left\{ (s+2.562)(s+3.494)-(-0.998)(19.38) \right\}$$

$$= s(s^2 + 6.056s + 28.29)$$

This is in the standard form required so it can easily be seen that $\omega_{sp}^2 = 28.29$, therefore $\omega_{sp} = 5.31$ rad s$^{-1}$ or 0.85 Hz. Also $2\zeta_{sp}\omega_{sp} = 6.056$, i.e. $\zeta_{sp}=0.57$

Now to obtain the numerator, replace the column which corresponds to $q$ by the input vector and find the determinant of the resulting matrix i.e.

$$s\left\{ (s+2.562)(45.21) - (-0.1926)(19.38) \right\}$$

$$= 25.21s^2 + 119.6s$$

$$= s(1+0.3781s)(119.6)$$

Again this is in the standard form: gain $\times s(1+T_{\theta_2}s).$ So the transfer function for the $q$ response can now be written in the standard form:

$$\frac{q}{\eta} = +k_q \frac{(1+T_{\theta_2}s)}{\frac{s^2}{\omega_{sp}^2} + \frac{2\zeta_{sp}s}{\omega_{sp}}+1} = k_q \frac{1+T_{\theta_2}s}{\Delta}$$

Where the values of the parameters can be deduced from the equations above.

Excersise: sketch the short period time response of this aircraft to an elevator unit step input.