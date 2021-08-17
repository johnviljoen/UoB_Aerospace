Links: [[406 Gain Scheduling]]
# Generation of Scheduled Gains

- Summary

    Determination of gains can be divided into two types: **Discrete** or **Interpolated**

    - Discrete

        The gains can be tabulated, and a schedule for $k_e$ created from the resulting simple rules. based on the regions shown in the figure of the example above:

        ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%203.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%203.png)

        The advantage of this simple approach is its relative simpllicity: the performance and stability of the system can be assessed for each of the 5 sets of gains, usually via a combination of theory, simulation and physical experimentation.

    - Interpolated

        Interpolated: the 5 $k_e$ values in the above Figure are significantly different, which suggests that:

        1. gain scheduling is likely to yield a marked improvement in performance compared to a single fixed-gain controller.
        2. It may be beneficial to interpolate between the 5 values, so that the actual value of $k_e$ depends on the proximity of the current scheduling variable values to the 5 given sets. This will avoid 'bumps' in the control signal as the aircraft passes from one dashed-line zone to another, and should mean that the instantaneous value of $k_e$ is well-suited to the state of the aircraft. For example, if aircraft motion starts at location 2 and moves to location 5 (by accelerating and reducing its angle of attack), then the abrupt change in $k_e$ from 25.1 to 13.6 as the mach number reaches 0.47 could be avoided by linear interpolation of $k_e$.

        Diagram of interpolation:

        ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%204.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%204.png)

        So when operating at the point $W$ shown, at proportion $p$ of the distance between points 2 and 5, the appropriate value of $k_e (W)$ might be found via linear interpolation as:

        $$k_e(W)=25.1\times (1-p)+13.6p=25.1-11.5p$$

- Examples

    Gain scheduling for PID control of position of a mass, spring damper system, subject to slowly varying reference position. The system is sketched below.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/mass_spring_damper.svg](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/mass_spring_damper.svg)

    In the most general case the mass, spring and damper terms might vary in a known manner with time and displacement, such that:

    Spring force $=f_k(y,t)$ N/m

    Damper force $=f_c(y,t)$ Ns/m

    Mass $=m(y,t)$ kg

    Initially however, we assume that the plant is linear, with mass $=m$ kg, damper rate $=c$ Ns/m and spring rate $=k$ N/m. We also assume that these values are constant. From this we can deign a fixed-gain controller:

    The equation of motion is then

    $$ ⁍$$

    The plant transfer function is 

    $$G_p(s) = \frac{Y(s)}{u(s} = \frac{1}{ms^2+cs+k} = \frac{1}{m\left( s^2 + \frac{c}{m}s + \frac{k}{m} \right)}$$

    For a PID controller

    $$G_c(s)=k_ds+k_p+\frac{k_i}{s}=\frac{k_d}{s}\left( s^2+\frac{k_p}{k_d}s+\frac{k_i}{k_d} \right)$$

    The CLCE is 

    $$1+G_c(s)G_p(s)=0$$

    $$\therefore 1+\frac{1}{s} \frac{k_d}{m} \frac{s^2+\frac{k_p}{k_d}s+\frac{k_i}{k_d}}{s^2+\frac{c}{m}s+\frac{k}{m}}=0$$

    One controller design strategy is to use pole-zero cancellation (dangerous remember), leading to:

    $$\frac{k_p}{k_d}=\frac{c}{m}, \frac{k_i}{k_d}=\frac{k}{m}$$

    $$\therefore 1+\frac{1}{s}\frac{k_d}{m}=0$$

    $$\therefore s + \frac{k_d}{m}=0=s+\frac{1}{t_{cl}}$$

    say, where the closed loop time constant $t_{cl} = \frac{t_s}{4}$, with $t_s$ being the desired settling time of the controlled plant.

    The gains are then calculable:

    $$k_d=\frac{m}{t_{cl}}, k_p=k_d \frac{c}{m}=\frac{c}{t_{cl}}, k_i = k_d\frac{k}{m}=\frac{k}{t_{cl}}$$

    Taking as physical values $m=2$ kg, $c=1$ Ns/m, $k=4$ N/m and $t_s=4s$ hence $t_{cl}$=1s gives:

    $$k_d=2, k_p=1, k_i=4$$

    A sine wave of amplitude 2 and period 200x is chosen as the test reference signal:

    $$r=2\sin(0.01 \pi t)$$

    The resulting closed-loop performance is shown below: reasonable control is evident, as expected for a linear system.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%205.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%205.png)

    **nonlinear spring**

    If we no assume that the spring is nonlinear, such that the spring force is:

    $$f_k=k_1y+k_3y^3$$

    Where $k_1=k=4$N/m and $k_3=5$ N/ $m^3$, then the fixed-gain response is degraded significantly:

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%206.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%206.png)

    The integral of absolute error — taken as a performance metric — is approximately 5x worse than for the linear case.

    We now investigate the use of **discrete gain scheduling**, limited to 3 regimes:

    1. $y≤-1$
    2. $-1<y<1$
    3. $y≥1$

    The local spring stiffness is the rate of change of spring force with $y$, at a given $y$:

    $$k(y_{sch})=\frac{df_k(y)}{dy}\bigg|_{y=y_{sch}}=k_1+3k_3y_{sch}^2$$

    As previously, we can then schedule $k_i = \frac{k}{t_{cl}}$ (since $t_{cl} = 1$ in this case), for 3 values of scheduling variable $y_{sch} = -1, 0, +1$.

    This is evaluated at 3 values of y, sketched below.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%207.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%207.png)

    The response of this discrete-valued gain schedule strategy is shown below:

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%208.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%208.png)

    Control is significantly better than for the fixed-gain case, but lacks smoothness at the transition between scheduled gain values.

    This could be improved by adding more rows to the scheduling table, e.g. at $y_{sch} = \pm 0.5$, $y_{sch} = \pm 1.5$

    Finally, a continuously varying gain schedule is implemented, such that:

    $$k_i(y)=\frac{k(y)}{t_{cl}}=k_1+3k_3y^2$$

    In this implementation, $k_i$ is calculated at each time step. Results are given below: excellent control is evident.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%209.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%209.png)

    The integrals of the absolute errors for each of the 3 control strategies are shown below for comparison.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2010.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2010.png)

    Note that an alternative controller design strategy is to multiply out the CLCE and find gains that deliver coincident roots at $\frac{-1}{t_{cl}}$

    $$\therefore 1+\frac{1}{s} \frac{k_d}{m} \frac{s^2+\frac{k_p}{k_d}s+\frac{k_i}{k_d}}{s^2+\frac{c}{m}s+\frac{k}{m}}=0$$

    $$\therefore s(ms^2+cs+k)+k_ds^2+k_ps+k_i=0$$

    $$\therefore ms^3 + (c+k_d)s^2 + (k+k_p)s+k_i=0$$

    $$\therefore s^3+\frac{c+k_d}{m}s^2+\frac{k+k_p}{m}s+\frac{k_i}{m}=0$$

    We can rewrite this in the form $\left( s+\frac{1}{t_{cl}} \right)^3=0=s^3+\frac{3s^2}{t_{cl}}+\frac{3s}{t_{cl}^2}+\frac{1}{t_{cl}^3}$

    Matching coefficients in $s^2, s^1$ and $s^0$ yields the gains:

    $$k_d=\frac{3m}{t_{cl}}-c, k_p=\frac{3m}{t_{cl}^2}-k, k_i=\frac{m}{t_{cl}^3}$$

    **Nonlinear Damping**

    We now assume that the spring is linear, but the damping force is simple coulomb friction:

    $$f_c(y)=c_c \text{sgn}(\dot{y})$$

    where $c_c$ is the coulomb coefficient

    The equation of motion is then

    $$ ⁍$$

    This may be rewritten as

    $$m\ddot{y}+\frac{c_c}{|\dot{y}|}\dot{y}+ky=u$$

    We can then generate an equivalent value for linear damping:

    $$c = \frac{c_c}{|\dot{y}|}$$

    Which allows us to express the equations of motion in the previous form:

    $$m\ddot{y}+c\dot{y}+ky=u$$

    If the plants velocity is known to vary slowly, we can treat $c$ as a 'temporary constant', such that the plant transfer function is again

    $$G_p(s)=\frac{Y(s)}{u(s)}=\frac{1}{ms^2+cs+k}=\frac{1}{m\left( s^2+\frac{c}{m}s+\frac{k}{m} \right)}$$

    Proceeding as for the linear case above, the gains are then given by:

    $$k_d = \frac{m}{t_{cl}}, k_i=\frac{k}{t_{cl}} \text{ and }k_p=\frac{c}{t_{cl}}=\frac{\frac{c_c}{|\dot{y}|} }{t_{cl}}$$

    Assume also physical values are $m=1$kg, $c_c=40$N, $k=100$N/m and $t_s=1$s hence $t_{cl}=0.25$s.

    To design a simple linear fixed gain controller, we need to choose a typical value of $|\dot{y}|$. We will again use a sinusoidal reference signal $r=1.0 \times \sin(0.2 \pi t)$. The average absolute value of $\dot{r}$ is thus 0.4m/s, and so we pick $|\dot{y}|=0.4$m/s as an appropriate value.

    Hence our fixed gains are:

    $$k_d=\frac{m}{t_{cl}}=4, k_i=\frac{k}{t_{cl}}=400 \text{ and } k_p=\frac{\frac{c_c}{0.4}}{t_{cl}}=400$$

    The response for a slow sinusoidal reference signal is shown below:

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2011.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2011.png)

    As an alternative, we now schedule a continuously varying value of $k_p$, i.e. calculate $k_p=\frac{\frac{c_c}{|\dot{y}|+\delta}}{t_{cl}}$ at each timestep. The value of $\delta=0.02$ m/s is included to prevent $k_p$ from becoming excessibe when the mass is (close to) stationary.

    Results are shown below, and seen to be a slight improvement on the fixed gain case. In particular, the output signal is smoother, and the control signal switches rapidly and more stable—y when the plant changes its direction of motion.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2012.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%2012.png)

- Notes

    Gain scheduling requires a reasonably accurat model of the plant in order to be effective.

    When using 2 or more scheduling variables, more sophisticated interpolations may be envisaged, e.g. based on the plant's relative proximity to more than 2 points.

    A drawback of using interpolated gains is that this will yield an infinite number of possible gain values, which may make global asymptotic stability more difficult to achieve and to prove.

    Gains may be scheduled based on the reference signal value(s) rather than the plant value(s). This may improve stability.

    There is a trade-off between the number of scheduling variables and simplicity of implementation of the controller. Control might be improved by increasing the number of scheduling variables (e.g. adding aircraft roll angle and payload as scheduling variables in the first example), but the resulting scheduling process would become more complex.