# Velocity, Jacobians, Singularities

# Velocities and Accelerations

 Trajectory:

Transformation matrix expressing the position and orientation of the end effector of ta robot w.r.t. its base at each moment t:

$$T_{0E}(t)=\begin{bmatrix} R_{0E}(t) & p_{0E} \\ 0_{1\times 3} & 1 \end{bmatrix}$$

Study of derivatives of the trajectory yields the Velocity and Acceleration

Velocities: : linear and angular

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/velocities_diagram.svg](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/velocities_diagram.svg)

Fixed length link, pivoted at one end

Accelerations: 

Acceleration is a time rate of change (derivative) of velocity:

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled.png](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled.png)

Veclotity propagation:

Chain of links- at any instant a link has a linear and/or angular velocity component

Propagation of velocities from the frame $\{O_0\}$ to the end effector

For most manipulators we will want to find the angular velocity of one frame due to the rotations of multiple frames. Consider two frames $O_1, O_2$ with rotation matrix $^1R_2(t)$

Their angular velocities are related as:

$$^1\omega_2=\space ^1\omega_1+ \space ^1R_2\dot{\theta}_2 \vec{z}_2$$

**Angular velocities can be added once they are projected into the same coordinate frame**

This can be extended to caluclate the angular velocity for an n-link manipulator:

- suppose we have an n-link manipulator whose coordinate frames are related as follows:

$$^0R_n= \space ^0R_1\space^1R_2 \cdots \space ^{n-1}R_n$$

- We can define the angular velocity of the tool frame (n) in the base frame (0):

$$^0\omega_n= \space ^0\omega_1 + \space ^0R_1 \space^1\omega_2 + \space ^0R_2 \space^2\omega_3 + \space ^0R_3 \space ^3\omega_4 + \cdots + \space ^0R_{n-1}\space ^{n-1}\omega_n$$

Where $\omega_n$ is the angular velocity of point attached to the frame n (on link n) due to the rotation of frame {n-1} (also expressed in frame {n-1})

Linear velocities:

The linear velocities of the end effector can be due to the motion of revolute and/or prismatic joints.

The linear velocity of any point on a rigid body is the sum of the linear velocity of the rigid body and the velocity of the particle due to rotation of the rigid body.

First, the position of a point p attached to a rigid body is:

$$^Ap = \space ^AR_B \space ^BP + \space ^AP_{Borg}$$

To find the velocity, take the derivative as follows

$$^A\dot{P} = \space ^A\omega_B \times \space ^AR_B \space ^BP + \space ^A\dot{P}_{Borg}$$

Linear velocity of links (scalar calculation)

Diagram

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%201.png](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%201.png)

- Frames are attached to each joint
- Frame 1 does not translate with respect to 0 frame. Because **link 1** rotates, frame {1} has a linear velocity with respect to the reference frame {0}

$$^1v_1= \space ^1\omega_1 \space \cdot \space L_1$$

- Linear velocity of **link 2** due to rotation of **link 2** around reference frame {1}:

$$^1v_2= \space ^1v_1 + \space ^1\omega_2 \space\cdot\space L_2$$

Where $^1\omega_2$ angular velocity due to rotation of $L_2$ expressed in frame {1}

Linear velocity of links (vector calculation)

In general for revolute joints:

$$^{i+1}\omega_{i+1}=\space^{i+1}R_i \space ^i\omega_i + \dot{\theta}_{i+1}$$

$$^{i+1}v_{i+1}= \space ^{i+1}R_i( \space ^iv_i+ \space ^i\omega_i \times \space ^iP_{i+1})$$

Velocities have to be expressed in relation to the same frame so we can add them up.

# The Jacobian

Differential motion:

Forward kinematics

$$⁍$$

Differential motion

$$q+\delta q \rightarrow X+\delta X$$

Which is a link between velocities

$$\dot{q} \rightarrow \dot{X}$$

A relationship described by the **Jacobian matrix**

$$\underbrace{\dot{X}}_{\text{End position velocity}}= J(q) \underbrace{\dot{q}}_{\text{Joint velocity}}$$

Instantaneous transformation between a vector in $R^n$ representing joint velocities to a vector in $R^6$ representing the linear and angular velocities of the end-effector, ie condenses all information from the joints into a 6dof translation and rotation.

$$\dot{X}=J(q)\dot{q}$$

The Jacobian is mapping velocities from Joint space to Cartesian space.

$$\bold{m \times n} \space \text{ dimension}$$

Where 

**m**: number of EE position and orientation parameters

**n**: number of DoFs

Jacobians are time-varying linear transformations.

Represents the **partial derivatives** of each EE position and orientation parameter to each joint parameter

$$J_{ij}=\frac{\partial f_i}{\partial q_j}$$

If the end-effector position and orientation are given by:

$$X=f(q)$$

Then the Jacobian $J(q)$ is defined as:

$$\begin{matrix} \delta X_1 = \frac{\partial f_1}{\partial q_1}\delta q_1 + \cdots +  \frac{\partial f_1}{\partial q_n}\delta q_n \\ \vdots \\ \delta X_m = \frac{\partial f_m}{\partial q_1}\delta q_1+ \cdots + \frac{\partial f_m}{\partial q_n}\delta q_n \end{matrix} \Rightarrow \delta X=\begin{bmatrix} \frac{\partial f_1}{\partial q_1} & \cdots & \frac{\partial f_1}{\partial q_n} \\ \vdots & \ddots & \vdots \\ \frac{\partial f_m}{\partial q_1} & \cdots & \frac{\partial f_m}{\partial q_n} \end{bmatrix}\delta q\Rightarrow \delta X=J(q)\delta q$$

Example: — 2DoF RR

Diagram

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%202.png](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%202.png)

$$x=l_1c_1+l_2c_{12} \\ y=l_1s_1+l_2s_{12}$$

$$\delta x = -(l_1s_1 + l_2s_{12})\delta\theta_1-l_2s_{12}\delta\theta_2 \\ \delta y = (l_1c_1+l_2c_{12})\delta \theta_1+l_2c_{12}\delta \theta_2$$

$$\delta X = \begin{bmatrix} \delta x \\ \delta y \end{bmatrix} = \begin{bmatrix} -y & -l_2s_{12} \\ x & l_2c_{12} \end{bmatrix} \begin{bmatrix} \delta \theta_1 \\ \delta\theta_2 \end{bmatrix}$$

$$\dot{X} = J(q) \dot{q} \Rightarrow \begin{bmatrix} \delta x \\ \delta y \end{bmatrix} = \begin{bmatrix} -y & -l_2s_{12} \\ x & l_2c_{12} \end{bmatrix} \begin{bmatrix} \delta \theta_1 \\ \delta\theta_2 \end{bmatrix}$$

$$J(q) = \begin{bmatrix} -y & -l_2s_{12} \\ x & l_2c_{12} \end{bmatrix} $$

The Inverse Jacobian :

$$\begin{matrix} \text{Inverse kinematics} & X \rightarrow q \\ \text{Differential form} & X+\delta X \rightarrow q + \delta q \\ \text{Which a link between velocities} & \dot{X} \rightarrow \dot{q} \end{matrix} $$

Which can be expressed by the inverse of the Jacobian $J^{-1}$

$$\dot{q}=J(q)^{-1}\dot{X}$$

For systems that do not have exactly 6DoF, we cannot directly invert the Jacobian because J dimensions are $6 \times n$, where $n \neq 6$

Thus there is a solution to finding the joint velocities if X and J have the same rank

OR

Use the pseudo inverse (our FAVOURITE from the control side of the course)

Singularities:

- Singularities are points in the configurations space where infinitesimal motion in a certain direction is not possible and the manipulator loses one or more degrees of freedom.
- When operating in a singular point small end effector velocities may correspond to large joint velocities
- Singularities are often found on the extents of the workspace
- Mathematicall, singularities exist where the Jacobian inverse does not exist (det(J) = 0)

Example

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%203.png](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%203.png)

Types

- Boundary singularities — manipulator outstretched or retracted. These singularities do not represent a true drawback, since they can be avoided on condition that the manipulator is not driven to the boundaries of its reachable workspace.
- Internal singularities — caused by a lining up of two or more joint axes. They are more serious and happen within the workspace under certain conditions.

Analysis

Check where the Jacobian is singular, i.e. check the jacobian determinant det(J)

Since J is a function of q this should give the values of q that will make the jacobian zero.

These values of q are known as the singularitiy points

Example 2DoF RR:

FK:

$$x=L_1 \cos(\theta_1)+L_2 \cos(\theta_1+\theta_2) \\ y= L_1 \sin(\theta_1) + L_2 \sin (\theta_1 + \theta_2)$$

The Jacobian is:

$$J=\begin{bmatrix} -L_1\sin(\theta_1)-L_2\sin(\theta_1+\theta_2) & -L_2\sin(\theta_1+\theta_2) \\ L_1\cos(\theta_1)+L_2\cos(\theta_1+\theta_2) & L_2 \cos(\theta_1+\theta_2) \end{bmatrix}$$

Its determinant is... lengthy to work out but the final result is:

$$det(J) = L_1L_2 \sin(\theta_2)$$

This determinant is equal to zero when $\theta_2=0$ or $180 \degree$. At these angles, the manipulator is fully stretched or retracted. (boundary singularities)

Example 3DoF RRR:

![Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%204.png](Velocity,%20Jacobians,%20Singularities%20ce8be1a44a384f3e84341da5727732ce/Untitled%204.png)

Force/torque relationship

We can express the relationship between the joint torques and the forces and moments at the end effector

Important for dynamics and force control

There is a relationship that relates $F \rightarrow \tau$

Which can be derived using the transpose of the Jacobian at q:

$$\tau = J^T(q)F$$

where F is the vector of forces and moments required at the end effector at a joint configuration q:

$$F = \begin{bmatrix} F_x & F_y & F_z & n_x & n_y & n_z \end{bmatrix}$$

$\tau$ is the desired joint torques (for revolute or force for prismatic)

Beware of the Jacobian dimensions...