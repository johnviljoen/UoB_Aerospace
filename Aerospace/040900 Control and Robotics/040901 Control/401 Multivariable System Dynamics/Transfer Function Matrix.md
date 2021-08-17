Links: [[401 Multivariable System Dynamics]]
# Transfer Function Matrix

- Summary

    Problem: Given {$\dot{x}=Ax+Bu; y=Cx$}, determine the relationship between *y(s)* and *u(s)* when all initial conditions are zero.

    Solution: 

    $sx(s) - x(0) = Ax(s) + Bu(s); y(s) = Cx(s)$

    $\Rightarrow sx(s)-Ax(s)=Bu(s)$

    $\Rightarrow (sI-A)x(s)=Bu(s)$

    $\Rightarrow x(s)=(sI-A)^{-1}Bu(s)$

    $\Rightarrow y(s) = \underbrace{C(sI-A)^{-1}B}_{G(s)}u(s)$

    Therefore the general non-square transfer function matrix (TFM) is:

    $$\underset{pxm}{G(s)} = \underset{pxn}{C} \underset{nxn}{(sI-A)^{-1}} \underset{nxm}{B}$$

    For the controlled output as opposed to the measured output this changes to:

    $$\underset{pxm}{G(s)} = \underset{qxn}{E} \underset{nxn}{(sI-A)^{-1}} \underset{nxm}{B}$$

- Example

    ![Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_2.svg](Multivariable%20System%20Dynamics%2085cc541f37754c12a59bc9578b0d2cd1/MIMO_diagram_2.svg)

    Determine the measured output TFM. Assume that $x(t)=\begin{bmatrix} y \\ \dot{y} \end{bmatrix}$, the measured output is y, and the system is underdamped: $0≤ \zeta <1$. Hint: from the conventional SISO approach in year 2 $\Rightarrow G(s)=\frac{\lambda \omega_n^2}{s^2+2 \zeta \omega_n s + \omega_n^2}$, where $\omega_n = \sqrt{\frac{k}{m}}$; $\zeta=\frac{c}{2 \sqrt{km}}$; $\lambda = \frac{1}{k}$

    - Solution

        TFM: 

        $$⁍$$

        Newtons 2nd Law: with positive being upwards:

        $$m\ddot{y}(t) = u(t)-ky(t)-c\dot{y}$$

        so let $x_1 = y$, $x_2 = \dot{y}$

        $\Rightarrow \dot{x_1} = x_2$

        $\Rightarrow \dot{x_2} = \ddot{y} = -\frac{c}{m}x_2 - \frac{k}{m}x_1 + \frac{1}{m}u = -2\zeta\omega_nx_2-\omega_n^2x_1+\lambda\omega_n^2u$

        $\Rightarrow \begin{bmatrix} \dot{x_1} \\ \dot{x_2} \end{bmatrix} = \underbrace{\begin{bmatrix} 0 & 1 \\ -\omega_n^2 & -2\zeta\omega_n \end{bmatrix}}_{A} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} + \underbrace{\begin{bmatrix} 0 \\ \lambda\omega_n^2 \end{bmatrix}}_{B}u$

         $\Rightarrow y = \underbrace{\begin{bmatrix} 1 & 0 \end{bmatrix}}_{C} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}$

        $$⁍$$

        $\Rightarrow \underbrace{\begin{bmatrix} 1 & 0 \end{bmatrix}}_{C} \underbrace{\frac{1}{s(s+2\zeta\omega_n) + \omega_n^2}}_{|sI-A|} \begin{bmatrix} s+2\zeta\omega_n & 1 \\ -\omega_n^2 & s \end{bmatrix} \begin{bmatrix} 0 \\ \lambda\omega_n^2 \end{bmatrix}$

        $\Rightarrow \frac{1}{s^2 + s\zeta\omega_ns+\omega_n^2} \begin{bmatrix} s+2\zeta\omega_n & 1 \end{bmatrix} \begin{bmatrix} 0 \\ \lambda\omega_n^2\end{bmatrix}$

        $$G(s) = \frac{\lambda\omega_n^2}{s^2 + 2\zeta\omega_ns+\omega_n^2}$$