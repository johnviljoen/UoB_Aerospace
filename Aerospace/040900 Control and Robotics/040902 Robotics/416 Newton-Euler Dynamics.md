# Newton-Euler Dynamics

# Introduction

Static vs Dynamic

![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled.png)

### Manipulator Dynamics

- Relationship between the forces/torques acting in the robits joiints and the resulting motion of the robots links — Forward dynamics (dynamic simulation)
    - Give torques $\rightarrow$ calculate resultant manipulator motions and force at the end effector
- As in kinematics, inverse problem of finding input torques to obtain desired output motion — inverse dynamics (robot control)
    - Desired joint positions, velocities, accelerations and end effector force $\rightarrow$ calculate joint torques
- Links/joint torques are controlled so that the end-effector can trace a desired trajectory. The controller compensates acceleration and deceleration by adding or reducing torque in joints. — torque control

### Torque control

Joint actuators balance torques from four sources:

- Dynamic Torques — arise from motion
    - Inertial (proportional to acceleration — N2L)
    - Centripetal (contrain body to rotate about the point, directed towards the centre, proportional to $\omega^2$)
    - Coriolis (result of interaction between 2 rotating links)
- Static torques — arise from external load
- Gravity torques — arise from links mass
- External forces/torques — arise from the task

### Dynamics formulations

**Newton Euler**

Forces and moments acting on the individual arm links, including coupling forces and moments between links. Equations also include constrain forces acting between adjacent links.

- Closed form
- Recursive form

**Lagrange**

Dynamic behaviour in terms of work done by the system and energy stored in the system. The robot is considered a black box that has energy balance.

Newton Euler 

Balance of forces and torques:

- Equations written for each link
- Inverse dynamics in real time
- Best suited for synthesis (implementation) of model based control

Lagrange

Energy-based approach

- Multi-body robot seen as a whole
- Internal reaction forces between links are eliminated
- Closed form equations are directly obtained
- Best suited for study of dynamics properties and analysis of control

### State-Space Equation

The equation of motion from both approaches can be described as:

$$\tau = \underbrace{M(\theta)\ddot{\theta}}_{\text{Mass matrix}}+\underbrace{V(\theta,\dot{\theta})}_{\text{Centripetal and Coriolis}}+ \underbrace{G(\theta)}_{\text{Gravity term}}$$

# Newton-Euler

### The Principles

Forces/torques relate to velocities, accelerations

- Translation — Rigid body, mass $m$, centre of mass accelerating at $a_c$. Force $F$ acting on its centre of mass causes this acceleration, given by N2L:

    $$F=ma_c$$

- Rotation — Rigid body rotating with angular velocity $\omega$ and with angular acceleration $\frac{d\omega}{dt}$. The moment  $N$ which must be acting on the body to cause this motion is given by Euler's Law:

    $$N= \space ^CI\dot{\omega} + \omega \times \space ^CI\omega$$

*Principle of action and reaction forces/torques remain the same:*

***F/T applied by body i to body i+1 = -F/T applied by body i+1 to body i***

### Closed Form vs Recursive Method

- The process of calculating joint torques from manipulator motion can be performed using the  **Recursive** Newton-Euler method.
    - Substituting numeric values at each step
    - Computational complexity of each step remains constant
    - Grows in a linear fashion with the number of joints
- Force and torque to be applied to a joint by an actuator as a function of all other forces and torques acting on that joint — **Closed form** equations
    - Substituting expressions in a recursive way
    - Closed form dynamical model is obtained, which is identical to the one obtained using Euler-Lagrange (or any other) method

    *Difficult to solve numerically, require a lot of computation time.*

### Recursive method

- enables real-time forward and inverse dynamics
- Recursive algorithm to compute from one link to another:
    1. Forward: velocity and accelerations
    2. Backward: forces and torques
- As with kinematics, we attach frames to the joints and links
- When one link moves all other links move $\Rightarrow$ motion of link $n$ in respect to the base is a sum of motions of all links from the base to $n$
- Velocities and accelerations have to be transferred from frame to frame using rotation matrices

### Summary of notation

All linear and angular velocities and accelerations are measured relative to a fixed frame but can be expressed in any frame like any other vector

- Linear accelerations/forces: where $Q$ represents a linear quantity, $^jQ_k$ is that quantity for link k expressed in the frame $\{j\}$ coordinate system. A further subscript (x or y) indicates a particular scalar component of $^jQ_k$ (e.g. $^jQ_{k,x}$)
- Angular velocities/accelerations/torques: where $Q$ represents an angular quantity, $Q_k$ is that quantity for link k.
- Links are defined by their dimensions (length $L_i$ and centroid position $c_i$) and inertial properties (mass $m_i$, and mass moment of inertia $I_i$)
- Matrices $^jR_k$ are rotation matrices as defined previously, except that only 2x2 matrices are required in the planar case.

### Link Balance Equations — Newton

![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%201.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%201.png)

![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%202.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%202.png)

### Outward and Inward Recursions

![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%203.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%203.png)

### External forces

RNE can also be used to calculate joint torques where external forces act on the manipulator, including gravity:

- External forces or moments exerted by the manipulator at/around a point or a link can simply be added to the force or moment equations during the inward recursions. A particularly common case is end-effector force and torque, which are represented by $^nf_{n+1}$ and $\tau_{n+1} \space ^if_{i+1}$ and $\tau_{i+1}$ would be defined as the force/torque exerted by the manipulator, not on the manipulator
- There is an easy way to include gravity: say that link 0 accelerating vertically upwards at 1g. Thus assuming $y_0$ points vertically up, the following should be used:

    ![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%204.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%204.png)

![Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%205.png](Newton-Euler%20Dynamics%206458fc309e1a435184c104af1eab9f11/Untitled%205.png)