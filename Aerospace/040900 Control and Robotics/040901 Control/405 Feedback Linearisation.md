Links: [[400 Control]]
# Feedback Linearisation

Question: why is this not a successful control strategy?

![Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/feedbacklinearisationdiagram.svg](Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/feedbacklinearisationdiagram.svg)

i.e. if we know the plant dynamics $G_p(s)$, why not simply make the controller:

$$G_c(s)=G_P^{-1}(s) \text{ ?}$$

Then:

$$Y(s)=R(s)G_P^{-1}(s)G(s) = R(s)$$

in other words — perfect control.

Answer: There are theoretical and practical difficulties:

- $G_p(s)$ may not be invertible
- $G_p(s)$ may not be sufficiently accuractely known
- There may be external disturbances.

However, the idea of cancelling/removing nonlinear components of the dynamics is appealing.

This leads to the concept of feedback linearisation. The idea is that known nonlinearities/offsets can be removed by suitable rewriting of the control signal or states. This is different to the Lyapunov linearisation method in that it does not ignore nonlinearities.

- Example

    Proportional plus Derivative control of the inverted pendulum — again

    ![Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/Untitled.png](Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/Untitled.png)

    Control torque $u$ is applied to the base of the pendulum, so the equation of motion is:

    $$ml^2\ddot{\phi}+c\dot{\phi}-mgl\sin(\phi)=u$$

    or

    $$ml^2\ddot{\phi}+c\dot{\phi}-mgl\sin(\phi)-u=0$$

    $$\therefore \ddot{\phi}-\frac{g}{l}\sin(\phi)+\frac{c}{ml^2}\dot{\phi}-\frac{u}{ml^2}=0$$

    Assume for now that the reference $r(t)=0$ for all time $t$.

    If we first make the controller torque $u=-k_p\phi-k_d\dot{\phi}$, then the equation of motion is:

    $$\ddot{\phi}-\frac{g}{l}\sin(\phi)+\frac{c}{ml^2}\dot{\phi}+\frac{k_p}{ml^2}\phi+\frac{k_d}{ml^2}\dot{\phi}=0$$

    $$\ddot{\phi}+\left( \frac{c+k_d}{ml^2} \right)\dot{\phi}+\frac{k_p}{ml^2}\phi-\frac{g}{l}\sin(\phi)=0$$

    We would like this to be in the form:

    $$\ddot{\phi}+2\zeta \omega_n\dot{\phi}+\omega_n^2\phi=0$$

    From which we could specify desirable values of closed loop $\zeta$ and $\omega_n$, but the gravity term prevents this.

    For small values of $\phi$ it might be reasonable to linearise, i.e. assume $\sin\phi=\phi$, or ignore it completely.

    E.g. if we assume $\sin\phi=\phi$, then the equation of motion is

    $$\ddot{\phi}+ \left( \frac{c+k_d}{ml^2} \right)\dot{\phi} + \left(\frac{k_p}{ml^2}-\frac{g}{l} \right)\phi=0=\ddot{\phi}+2\zeta \omega_n\dot{\phi}+\omega_n^2\phi$$

    Hence $k_d = 2\zeta \omega_n ml^2 -c$ and $k_p=\omega_n^2 ml^2 + mgl$

    Feedback linearisation offers a different approach, whereby the 'irritating' terms are directly added to the control signal, and the control signal may additionally be scaled or otherwise transformed.

    To achieve this, we change $u$ to be

    $$u=-mgl\sin(\phi)+c\dot{\phi}-k_dml^2\dot{\phi}-k_pml^2\phi$$

    i.e. we have incorporated the gravity and damper terms and scaled by $ml^2$.

    The equation of motion then becomes:

    $$ml^2\ddot{\phi}+c\dot{\phi}-mgl\sin(\phi)-u=ml^2\ddot{\phi}+c\dot{\phi}-mgl\sin(\phi)-(-mgl\sin(\phi)+c\dot{\phi}-k_dml^2\dot{\phi}-k_pml^2\phi)$$

    $$=ml^2\ddot{\phi}+k_dml^2\dot{\phi}+k_pml^2\phi=0$$

    Hence:

    $$\ddot{\phi}+k_d\dot{\phi}+k_p\phi=0$$

    Which is in the form that we sought i.e. $\ddot{\phi}+2\zeta \omega_n\dot{\phi}+\omega_n^2\phi=0$

    So if e.g. we wanted the CLP system to be critically damped and to have a settling time $t_s$ seconds, then we know that $\zeta=1$ and $\omega_n \approx \frac{5.7}{t_s}$.

    Hence we can set $k_p = \omega_n^2 \approx \left( \frac{5.7}{t_s} \right)^2$ and $k_d=2\zeta \omega_n \approx \frac{11.4}{t_s}$

    We can extend this to handle non-zero values of reference signal $r(t)$ and its time derivatives by adding more terms:

    $$u=-mgl\sin(\phi)+c\dot{\phi}+ml^2\ddot{r}-k_dml^2(\dot{\phi}-\dot{r})-k_pml^2(\phi-r)$$

    This leads to

    $$(\ddot{\phi}-\ddot{r})+k_d(\dot{\phi}-\dot{r})+k_p(\phi-r)=0=\ddot{e}+k_d\dot{e}+k_pe$$

    As per the previous case, we set $k_p = \omega_n^2$ and $k_d=2\zeta \omega_n$

    So we can achieve further improved control — comparative results shown below:

    - Results

        ![Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/Untitled%201.png](Feedback%20Linearisation%209d6f1eb07ff64eaab4e64a56e582d4db/Untitled%201.png)

- Notes

    For feedback linearisation to work, we need to know (reasonably accurately) physical values $g,l,m$ and the states of the system $\phi$ and $\dot{\phi}$.

    Feedback linearisation can be extended to MIMO systems.