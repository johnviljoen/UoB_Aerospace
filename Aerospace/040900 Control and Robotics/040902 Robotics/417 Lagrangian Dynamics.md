# Lagrangian Dynamics

### The Lagrangian

Lagrangian ($L$) is the scalar function that connects Kinetic energy $K_e$ with potential energy $P$

$$L=K_e-P$$

The Kinetic energy depends on position and velocity while the potential energy on position only

$$L(\theta, \dot{\theta}) = K_e(\theta,\dot{\theta}) - P(\theta)$$

### Euler - Lagrange equation

Non-conservative generalised force performing work on $q_i$

$$\psi_i=\frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}_i} \right)- \frac{\partial L}{\partial q_i} \space \space i=1 \cdots n$$

In robotics:

$$\psi_i=\tau_i+J^TFc-d_i\dot{q}_i$$

Where:

$$\tau_i \space \space \space \text{ Joint actuator torque} \\ J^TFc \space \space \space \text{ Term due to external forces} \\ d_i \dot{q}_i \space \space \space \text{ Joint friction torque}$$

### Kinetic and Potential Energy

$$L(\theta, \dot{\theta}) = K(\theta, \dot{\theta}) - P(\theta)$$

It is easy to calculate from the geometric properties of the manipulator:

$$K = \sum^n_{i=1}{K_i} \space \space \space P=\sum^n_{i=1}{P_i}$$

Where $n$ is the number of links

### Kinetic Energy

The kinetic energy of a manipulator can be determined for each link from:

- The link mass $m$
- The inertia matrix $I$ computed from a frame fixed to the centre of mass in which it has a constant expression
- The linear velocity of the centre of mass $v$ and the rotational velocity $\omega$ of the link both expressed in respect to the base frame
- The rotation matrix $R$ between the frame fixed to the link and the base frame.

$$K_i = \frac{1}{2}m_iv_{ci}^Tv_{ci} + \frac{1}{2} \omega_{ci}^TI_i\omega_{ci} \\ \text{ where } \space \space \space I= \begin{bmatrix} I_{xx} & I_{xy} & I_{xz} \\ I_{yx} & I_{yy} & I_{yz} \\ I_{zx} & I_{zy} & I_{zz} \end{bmatrix}$$

Which are connected to $\theta, \dot{\theta}$ and thus kinetic energy can be:

$$K(\theta, \dot{\theta}) = \frac{1}{2} \dot{\theta}^TM(\theta)\dot{\theta}$$

### Potential Energy

Rigid bodies, only have potential energy due to gravity:

$$P_i=\int_{L_i}{g^T p}dm = g^T\int_{L_i}pdm = g^Tp_{Ci}m_i$$

Depends on the joint angle $\theta$:

$$P(\theta) = g^Tp_{Ci}(\theta)m_i+P_{ref}$$

Where $P_{ref}$ is the potential energy reference

### Dynamic model

- From Euler-lagrange equation:

    $$\psi_i=\frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}_i} \right)- \frac{\partial L}{\partial q_i}$$

- Substituting $L$ with $K$ and $P$ will give us:

$$\psi_i = \frac{d}{dt}\frac{\partial K}{\partial \dot{\theta}} - \frac{\partial K}{\partial \theta}+\frac{\partial P}{\partial \theta}$$

- Which leads us to the state space equation:

$$\tau+J^TF_C=M(\theta)\ddot{\theta} + V(\theta, \dot{\theta}) + G(\theta)$$

### Example: simple pendulum

Literally what I did for M4 lol

![Lagrangian%20Dynamics%201238954932114d3792c6fd8f10e283f7/Untitled.png](Lagrangian%20Dynamics%201238954932114d3792c6fd8f10e283f7/Untitled.png)

![Lagrangian%20Dynamics%201238954932114d3792c6fd8f10e283f7/Untitled%201.png](Lagrangian%20Dynamics%201238954932114d3792c6fd8f10e283f7/Untitled%201.png)