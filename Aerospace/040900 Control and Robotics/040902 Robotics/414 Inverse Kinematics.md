# Inverse Kinematics

Goal of Inverse Kinematics:

Given the location and orientation of the end effector, find the joint variables.

$$\begin{bmatrix} q_1 \\ q_2 \\ \vdots \\ q_n \end{bmatrix} = f(x,y,z,r,p,y)$$

Where $x,y,z$ are the Cartesian coordinates and $r,p,y$ the orientation of the end-effector w.r.t. its base

IK - 3 DoF example of the process:

$$^0T_3 = \underbrace{ \begin{bmatrix} c_1c_{23} & -c_1s_{23} & s_1 & L_1c_1+L_2c_1c_2 \\ s_1c_{23} & s_1s_{23} & -c_1 & L_1s_1 + L_2s_1c_2 \\ s_{23} & c_{23} & 0 & L_2s_2 \\ 0 & 0 & 0 & 1 \end{bmatrix}}_{\text{FK model}} = \underbrace{\begin{bmatrix} r_{11} & r_{12} & r_{13} & p_x \\ r_{21} & r_{22} & r_{23} & p_y \\ r_{31} & r_{32} & r_{33} & p_z \\ 0 & 0 & 0 & 1 \end{bmatrix}}_{\text{Desired position, orientation}}$$

Generally, this gives up to 12 equations with n unknowns. There are six independent equations, which can be solved if $n \leq 6$.

IK solutions

A solution is defined as a set o joint values which satisfy the desired position and orientation of the end effetor.

May have more than one solution or none at all

- When does it not have a solution?

A solution to the IK exists if the target belongs to the workspace

- More than one solution?

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled.png)

A manipulator is **solvable** if the joint variables can be determined.

$$\text{Solutions} \begin{cases} \text{Closed form (analytical) solutions} \begin{cases} \text{Algebraic approach} \\ \text{Geometric approach} \end{cases}\\ \text{Numerical solutions} \end{cases}$$

Iterative Solutions:

Numerical iteration towards a desired goal position

Slower than the closed form methods — could be applied to large size serial chains

Use of Jacobian matrix to **links small changes** in joints' parameters to **small changes** in the end effector's position.

# Iterative Methods

Most prominent:

Jacobian-based solution

Optimisation-based solution

Iterative solution using the pseudo-inverse Jacobian

1. Calcualte the difference between the goal position and the actual position of the end effector
2. Calculate the JAcobian using the current joint angles
3. Calculate the pseudo inverse of the JAcobian
4. Determine the error
5. If error > e then $dX = \frac{dX}{2}$and restart step 4
6. Calculate the updated values for the joint orientations and use these as the new current values
7. Using forward kinematics determine whether the new joint orientations position the end-effector close enough to the desired absolute location. If the solution is adequate then terminate the algorithm otherwise go back to step 1.

Optimisation-based solution

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%201.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%201.png)

Optimisation example

$$x=l_1c\theta_1 + l_2c\theta_2 + l_3c\theta_3 \\ y =l_1s\theta_1 + l_2s\theta_2 + l_3s\theta_3$$

Goal potential function 

$$G(\theta) = (x_g - x)^2 + (y_g - y)^2=(x_g-l_1c\theta_1-l_2c\theta_2-l_3c\theta_3)^2+(y_g-l_1s\theta_1-l_2s\theta_2-l_3s\theta_3)^2$$

Problem: minimise $G(\theta)$

Solution: neural networks, nonlinear programming etc

Optimisation performance

- Will G(q) be always zero?

    No: unreachable workspace

- Will the solution always be found?

    No: local minima/singular configuration

- Will the solution be always unique?

    No: Redundancy

# Inverse Kinematics Analytical Methods

Closed form IK solutions:

- Potentially faster than an iterative solution
- A unique solution to all manipulator positions can be determined a priori.
    - Can guarantee "safe" joint configurations where the manipulator does not collide with the body
- **All systems with revolute and prismatic joints having a total of six degrees of freedom in a single series chain are solvable**
- Geometric and Algebraic approach

Simple IK example — RP planar

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%202.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%202.png)

given: $x,y$

find: $\theta,S$

Finding $\theta$:

$\theta = atan(\frac{y}{x})$

Finding $S$:

$S=\sqrt{x^2+y^2}$

IK example — RR planar

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%203.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%203.png)

Given: $I_1, I_2, x, y$

Find: $\theta_1, \theta_2$

Redundancy: A single solution to this problem does not exists. Notice that, using the 'given' parameters, two solutions are possible.

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%204.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%204.png)

Algebraic approach:

FK:

$$x=l_1c_1+l_2c_{12} \\ y=l_1s_1+l_2s_{12}$$

Squaring $x$ and $y$ and adding them:

$$x^2 + y^2 = l_1^2+l_2^2+2l_1l_2c_2$$

And solving for $c_2$ we get:

$$c_2 = \frac{x^2 + y^2 - l_1^2 - l_2^2}{2l_1l_2}$$

$$c_2=\frac{x^2+y^2-l_1^2-l_2^2}{2l_1l_2}$$

For $s_2$ stands:

$$s_2 = \pm \sqrt{1-c_2^2}$$

And for $\theta_2$ there are two solutions given by:

$$\theta_2=atan2(s_2,c_2)$$

Going back to FK and rewriting $x$ and $y$ as:

$$x=k_1c_1-k_2s_2 \\ y=k_1s_1+k_2c_1$$

Where $k_1 = L_1 + L_2c_2$ and $k_2=L_2s_2$.

Let:

$$r \sqrt{k_1^2+k_2^2} \\ \gamma = atan2(k_2,k_1)$$

Then:

$$k_1=r\cos(\gamma) \\ k_2 = r \sin(\gamma)$$

Substituting the last expressions of $k_1$ and $k_2$ into the FK equation

$$\frac{x}{r}=\cos(\gamma)c_1+ \sin(\gamma)s_1 = \cos(\gamma + \theta_1) \\ \frac{y}{r} = \cos(\gamma)s_1 + \sin(\gamma)c_1 = \sin(\gamma + \theta_1)$$

And because $atan2(y,x) = atan2(\frac{y}{n}, \frac{x}{n}) \space n \in \mathbb{R}|n >0$  we get:

$$\gamma+\theta_1 = atan2(y,x) \Rightarrow \\ \theta_1 = atan2(y,x) - atan2(k_2,k_1)$$

Inspecting angles we get:

$$\theta_1 = a+b$$

Where:

$$a = atan2(y_e,x_e) \\ b=atan2(l_2s_2,l_1+l_2c_2)$$

Then using geometry we arrive at the solution.

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%205.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%205.png)

6 DoF — IK

Given: desired transform,

$$T_{eff}=\begin{bmatrix} R_{eff} & d_{eff} \\ 0 & 1 \end{bmatrix}$$

Find: 

$$q = (\begin{matrix} q_1 & q_2 &  q_3 & q_4 & \cdots & q_n \end{matrix})$$

Diagram:

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%206.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%206.png)

- For this manipulator, the problem can be decomposed into a position component (the first three joints) and an orientation component (the last three joints)
- The first three joints tell you what the position of the spherical wrist is

First, work out the orientation of the spherical wrist:

Since its a spherical wrist, the last three joints can be thought of as rotating about a point

- A constant transform exists that goes from the last wrist joint out to the end effector (sometimes this is called the tool transform): $^3T_6$

    This is a rotation matrix that gives the orientation of the end-effector

- The position of the wrist is: $^0T_3 = \space ^0T_6 \space ^3T_6^{-1}$

Next, solve for the first three joints

Step 1 - solve for $q_1$ (look down from above)

$$q_1=Atan2(y_g, x_g) \\ \text{or} \\ q_1 = Atan2(y_g, x_g)+\pi$$

Example: 

$$Atan2(1,-1)=135 \degree \\ Atan2(-1,1)=-45 \degree$$

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%207.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%207.png)

Next, solve for the other two joints

Step 2, solve for $q_3$. (look at the manipulator orthogonal to the plane of the first two links)

$$c^2=a^2+b^2-2ab \cos(\theta_c) \\ \cos(\theta_c) = -\frac{r_w^2+(z_w-h)^2-l_1^2-l_2^2}{2l_1l_2}=D$$

Where

$$r_w^2=x_w^2+y_w^2$$

and $h$ is the height of the first link

$$q_3 = atan2(\pm \sqrt{1-D^2},-D)$$

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%208.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%208.png)

Step 3, solve for $q_2$. (continue to look at the manipulator orthogonal to the plane of the first two links)

$$tan(\theta)=\frac{z_w-h}{\sqrt{x_w^2+y_w^2}}$$

$$tan(\alpha)=\frac{l_2s_3}{l_1+l_2c_3}$$

$$q_2=\theta + \alpha$$

![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%209.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%209.png)

Final step, you have to deine the last three joints that completely specify the orientation of the end effector.

- Note that the last three joints look just like ZYZ Euler angles

    Determination of the joint angles can be done by calculating the ZYZ Euler angles corresponding to the desired orientation.

IK for a humanoid arm

You can follow a similar method for a humanoid (7-DoF) arm.

- Since this is a redundant arm, there is a manifold of solutions...

    ![Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%2010.png](Inverse%20Kinematics%206d1c100ef1a84229aaaf0118d3f0182c/Untitled%2010.png)

General strategy:

1. Solve for elbow angle
2. Solve for a set of shoulder angles that places the wrist in the right position (note that you have to choose an elbow orbit angle)
3. Solve for the wrist angles