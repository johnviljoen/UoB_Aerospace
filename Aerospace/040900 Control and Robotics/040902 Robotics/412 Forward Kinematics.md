# Forward Kinematics

# Denavit Hartenberg method

## Proximal (modified)

$Z_n$ axis of $n^{th}$ joint

$X_n$ along perpendicular from $Z_n$ to $Z_{n+1}$

**If** $\bold{a_{n}=0}$: $X_n$ is normal to both $Z_n$ and $Z_{n+1}$

- steps
    1. $a_n$: distance along $X_n, Z_n \rightarrow Z_{n+1}$
    2. $\alpha_n$: rotation about $X_n, Z_n \rightarrow Z_{n+1}$
    3. $d_n$: distance along $Z_n, X_{n-1} \rightarrow X_n$
    4. $\theta_n$: rotation about $Z_n, X_{n-1} \rightarrow X_n$

$$\begin{array}{c|c|c|c|c} n& a_{n-1} & \alpha_{n-1} & d_n & \theta_n \\ \hline 1 \end{array}$$

$$⁍$$

## Distal (standard)

$Z_n$ axis of $n+1^{th}$ joint

$X_n$ is along perpendicular from $Z_{n-1}$ and $Z_{n}$

**If** $\bold{a_{n}=0}$: $X_n$ is normal to both $Z_{n-1}$ and $Z_n$.

- steps
    1. $a_n$: distance along $X_n, Z_{n-1} \rightarrow Z_{n}$
    2. $\alpha_n$: rotation about $X_n, Z_{n-1} \rightarrow Z_{n}$
    3. $d_n$: distance along $Z_{n-1}, X_{n-1} \rightarrow X_n$
    4. $\theta_n$: rotation about $Z_{n-1}, X_{n-1} \rightarrow X_n$

$$\begin{array}{c|c|c|c|c} n& a_{n-1} & \alpha_{n-1} & d_n & \theta_n \\ \hline 1 \end{array}$$

$$^{n-1}_nT=\begin{bmatrix} c\theta_n & -c\alpha_ns\theta_n & s\alpha_ns\theta_n & a_nc\theta_n \\ s\theta_n & c\alpha_nc\theta_n & -s\alpha_nc\theta_n & a_ns\theta_n \\ 0 & s\alpha_n & c\alpha_n & d_n \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

## Example

![Forward%20Kinematics%20cc05ba6ec0fe4b66aa2a14e7312e5143/3_joint_robot_diagram.svg](Forward%20Kinematics%20cc05ba6ec0fe4b66aa2a14e7312e5143/3_joint_robot_diagram.svg)

Above is a 3D Space RRR

- Distal (standard)

    ![Forward%20Kinematics%20cc05ba6ec0fe4b66aa2a14e7312e5143/3_joint_robot_diagram_rotated.svg](Forward%20Kinematics%20cc05ba6ec0fe4b66aa2a14e7312e5143/3_joint_robot_diagram_rotated.svg)

    Observe that frame {n} moves with link n

    $\alpha= 90 \degree$(rotate by $90 \degree$ around $x_1$ to alighn $Z_0$ and $Z_1$)

    1. $a_n$: distance along $X_n$$,Z_{n-1} \rightarrow Z_n$
    2. $\alpha_n$: rotation about $X_n, Z_{n-1} \rightarrow Z_n$ 
    3. $d_n$: distance alonh $Z_{n-1}, X_{n-1} \rightarrow X_n$
    4. $\theta_n$: rotation about $Z_{n-1}, X_{n-1} \rightarrow X_n$

    $$\begin{array}{c|c|c|c|c} n & a_n & \alpha_n & d_n & \theta_n \\ \hline 1 & R & 90 \degree & 0 & \theta_1 \\ 2 & L_1 & 0 & 0 & \theta_2 \\ 3 & L_2 & 0 & 0 & \theta_3 \end{array}$$

    **Homogenous Transformations**

    $X_1$ axis expressed with respect to {0}, $Y_1$ axis expressed with respect to {0}. $Z_1$ axis expressed with respect to {0}, Origin of {1} with respect to {0}

    $$^0_1T=\begin{bmatrix} c\theta_1 & 0 & s\theta_1 & Rc\theta_1 \\ s\theta_1 & 0 & -c\theta_1 & Rs\theta_1 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

    $X_2$ axis expressed with respect to {0}, $Y_2$ axis expressed with respect to {0}. $Z_2$ axis expressed with respect to {0}, Origin of {2} with respect to {1}

    $$^1_2T=\begin{bmatrix} c\theta_2 & -s\theta_2 & 0 & L_1c\theta_2 \\ s \theta_2 & c\theta_2 & 0 & L_1s\theta_2 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

    $X_3$ axis expressed with respect to {0}, $Y_3$ axis expressed with respect to {0}. $Z_3$ axis expressed with respect to {0}, Origin of {3} with respect to {2}

    $$^2_3T=\begin{bmatrix} c\theta_3 & -s\theta_3 & 0 & L_2c\theta_3 \\ s \theta_3 & c\theta_3 & 0 & L_2s\theta_3 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

    **Compound Transformation**

    $$^0_3T= ^0_1T \space ^1_2T \space ^2_3T$$

    $$^0_3T=\begin{bmatrix} c\theta_1c\theta_{23} & -c\theta_1s\theta_{23} & s\theta_1 & c\theta_1(L_2c\theta_{23} + L_1c\theta_2+R) \\ s\theta_1c\theta_{23} & -s\theta_1s\theta_{23} & -c\theta_1 & s\theta_1(L_2c\theta_{23}+L_1c\theta_2+R) \\ s\theta_{23} & c\theta_{23} & 0 & L_2s\theta_{23} + L_1s\theta_2 \\ 0 & 0 & 0 & 1\end{bmatrix}$$

    $$\begin{array}{cc} \text{where} & \begin{matrix} c\theta_i=\cos(\theta_i)\\s\theta_i=\sin(\theta_i)\\c\theta_{23}=\cos(\theta_2+\theta_3) \\ s\theta_{23}=\sin(\theta_2+\theta_3) \end{matrix} \end{array}$$

    **HT to FK**

    $$^0_3T= \left[ \begin{array}{c|c} \begin{matrix} c\theta_1c\theta_{23} & -c\theta_1s\theta_{23} & s\theta_1 & \\ s\theta_1c\theta_{23} & -s\theta_1s\theta_{23} & -c\theta_1 & \\ s\theta_{23} & c\theta_{23} & 0\end{matrix} & \begin{matrix}  c\theta_1(L_2c\theta_{23} + L_1c\theta_2+R) \\  s\theta_1(L_2c\theta_{23}+L_1c\theta_2+R) \\ L_2s\theta_{23} + L_1s\theta_2\end{matrix} \\ \hline 0 \space \space \space \space\space \space \space \space\space \space \space \space0 \space \space \space \space\space \space \space \space\space \space \space \space0 & 1\end{array} \right]$$

    $$T= \left[ \begin{array}{c|c} \text{Rotation} & \text{Translation} \\ \hline 0 \space \space \space \space 0 \space \space \space \space0 & 1\end{array} \right]$$

    Looking specifically at the Translation section, it provides cartesian coordinates 

    $$\begin{matrix} x_e=c\theta_1(L_2c\theta_{23}+L_1c\theta_2+R) \\ y_e=s\theta_1(L_2c\theta_{23}+L_1c\theta_2+R) \\ z_e=L_2s\theta_{23}+L_1s\theta_2 \end{matrix}$$

    Furthermore the Rotation section provides euler angles, we name this section $r$

    $$\begin{matrix} \beta=Atan2(-r_{31},\sqrt{r_{11}^2+r_{21}^2}) \\ \alpha =Atan2\left( \frac{r_{21}}{c\beta},\frac{r_{11}}{c\beta} \right) \\ \gamma=Atan2\left( \frac{r_{32}}{c\beta}, \frac{r_{33}}{c\beta} \right) \end{matrix}$$

    in the case of this example it can be found more intuitively however, through geometry:

    $$\begin{matrix} \beta = \theta_2+\theta_3 \\ \alpha=\theta_1 \\ \gamma=90\degree \end{matrix}$$

## Summary

- Rotation between frames representation using Rotation Matrices/Unit Vectors/Euler Angles
- Convert Euler angles into Rotation Matrices and vice versa
- Derive the FK of a manipulator using the Denavit Hartenberg (DH) convention
    - 2 approaches, Proximal and Distal
    - Fix frames and axes on each joint
    - Find DH parameters
    - Use formula to calculate each joint's $HT ^{i-1}T_i$
    - Multiply consecutive transformation matrices to derive $^0T_n$