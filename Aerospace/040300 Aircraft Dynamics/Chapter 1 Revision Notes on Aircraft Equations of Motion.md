
# Revision Notes on Aircraft Equations of Motion
> Links
> [[040300 Aircraft Dynamics]]

> Contents
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 1 Axis Convention and Notation]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 2 Euler Angles]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 3 Equations of Motion]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 3 1 Inertial Accelerations]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 3 2 Linearisation of Equations]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 3 3 Derivatives and Non-Dimensional Forms]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 4 The Matrix Form of the Equations of Motion]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 5 Response Modes]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 5 1 Longitudinal Motions]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 5 2 Lateral Motions]]
> [[Chapter 1 Revision Notes on Aircraft Equations of Motion#1 6 Approximate Equations of Motion]]

## 1.1 Axis Convention and Notation

![[Pasted image 20210201105500.png]]

| Primary Terms          | Meanings                                                                             |
| ---------------------- |:------------------------------------------------------------------------------------ |
| X,Y,Z                  | Force components along x, y, and z axes                                              |
| L,M,N                  | Moment components about the x, y, z axes                                             |
| U,V,W                  | Translational velocity components; total velocity $V_f = \sqrt{U^2 + V^2 + W^2}$     |
| x,y,z                  | small perturbation displacements along x, y and z axes                               |
| u,v,w                  | small perturbation velocities along x, y and z axes                                  |
| $\psi$,$\theta$,$\phi$ | angular displacements (Earth-to-body axes order of rotation: $\psi$,$\theta$,$\phi$) |
| p,q,r                  | angular velocity components about x, y and z axes                                    |

| Airflow Terms | Meanings                                            |
| ------------- |:--------------------------------------------------- |
| $\alpha$      | incidence angle = arctan($\frac{W}{U}$)             |
| $\beta$       | sideslip angle = arctan($\frac{V}{\sqrt{U^2+W^2}}$) |
| $\gamma$      | flight path angle = $\theta - \alpha$               |

| Control Surface Terms | Meanings                                             |
| --------------------- |:---------------------------------------------------- |
| $\eta$                | elevator angle, positive trailing edge down          |
| $\delta_p$            | pilot's command                                      |
| $\delta_f$            | flap angle, positive trailing edge down              |
| $\xi$                 | aileron angle, positive starboard trailing edge down |
| $\zeta$               | rudder angle, positive trailing edge to port         |

| Inertia Terms                | Meanings                                                  |
| ---------------------------- |:--------------------------------------------------------- |
| m                            | Mass                                                      |
| $I_{xx}$, $I_{yy}$, $I_{zz}$ | 2nd moment of inertia about x, y, z body axes             |
| $I_{xy}$, $I_{zx}$, $I_{yz}$ | cross moment (products) of inertias about x, y, etc. axes |

**Note** that the Americans use $\delta_x$ for all their control surfaces and not sometimes $\eta, \xi$ and $\zeta$. Terms also differ in mainland Europe.

The most common axis system used in the UK is the **body axis** system where the origin and orientation of the axes are fixed relative to the aircraft. The xz plane lies in the plane of symmetry. This system will be used throughout this course.

****

Other axis systems are:
- **Wind axes** ($x_w, y_w, z_w$): the $x_w$ axis is directed along the total velocity vector $V_f$ of the vehicle relative to the atmosphere. Boeing tend to use this system which results in the longitudinal equations being terms of $V_f, \gamma,$ and $q$.
- **Stability axes** ($x_s, y_s, z_s$): the $x_s$ axis is chosen to lie along the projection of the velocity vector $V_f$ in the plane of symmetry at the initial conditions and the $xz$ plane lies in the plane of symmetry. Note that the $x_s$ axis moves with the aircraft during any motion.
- **Principal axes**: this is the axis system about which the cross moments of inertia are zero
- **Inertia frame**: this is a reference axis frame about a point in the universe which is stationary. In parctice it is not defined, but Newton's laws of motion apply only in such a stationary frame, so that the relative motion of the chosen frame with respect to the inertial frame must be considered when formulating equations of motion
- **Earth axes** ($x_e, y_e, z_e$): this is an axis frame fixed at some point in the Earth. It is often used in aircraft work in place of the inertia frame.

> In some cases $\alpha$ $\left( = \arctan(\frac{W}{U}) \right)$ is used in place of $W$, and 
> $\beta$ $\left( = \arctan \left( \frac{V}{\sqrt{U^2 + W^2}} \right) \right)$ may be used in place of $V$.

## 1.2 Euler Angles

The orientation of the body axis reference frame is given by three angles which express three consecutive rotations relative to the Earth axes. These are the Euler angles $\psi, \theta$ and $\phi$, which give rotations about $z_e$, $y'$ and $x''$ respectively[^1]. It is important to note that the three Euler angles cannot uniquely represent the orientation of the body axes unless the order of rotation is defined. Since the rotational rates, $p, q,$ and $r$ are defined about the body axes, they cannot normally be integrated to form the Euler angles which represent the orientation of the aircraft body axes relative to the Earth axes. The Euler angle rtes can be related to $p, q,$ and $r$ by the transformation:

$$ \begin{bmatrix} \dot{\phi} \\ \dot{\theta} \\ \dot{\psi} \end{bmatrix} = \begin{bmatrix} 1 & \sin(\phi) \tan(\theta) & \cos(\phi) \tan(\theta) \\ 0 & \cos(\phi) & -\sin(\phi) \\ 0 & \sin(\phi)\sec(\theta) & cos(\phi)\sec(\theta) \end{bmatrix} \begin{bmatrix} p \\ q \\ r \end{bmatrix} $$

This can be used in simulations to convert from the aircraft equations of motion in body axes to the Euler angles. Unfortunately these equations are transcendental and as such do not have exact analytical solutions except in special cases. A simple example of this is that if $\theta$ reaches $90$ degrees then $\tan(\theta)$ is infinite and the equations cannot be solved. This can be overcome by using an alternative to the Euler angles known as quaternions, which is beyond the scope of this course.

An example of the use of these equations which arises in this course is that a gyro positioned in an aircraft to sense pitch rate will sense the pitching in the inertial axes, namely:

$$\frac{\dot{\theta}}{\cos(\phi)}$$

From the second equation in the transformation the pitch rate in body axes - which is the quantity which is to be measured - is:

$$q = \frac{\dot{\theta}}{\cos(\phi)} + r \frac{\sin(\phi)}{cos(\phi)}$$

$$\therefore q = \text{gyro reading} + r \tan(\phi)$$

## 1.3 Equations of Motion

The equations of motion are usually derived from Newtons laws of motion for a rigid body, namely:

$$\text{External forces} = \frac{d}{dt}(\text{momentum}) = \frac{d}{dt}(\text{m} \times \text{velocity})_{cg}$$

$$\text{External moments} = \frac{d}{dt}(\text{angular momentum}) = \frac{d}{dt}(\text{moment of inertia} \times \text{angular velocity})_{cg}$$

### 1.3.1 Inertial Accelerations

Since these equations apply in the inertia frame (i.e. a reference frame fixed in space) and the equations are usually formatted in an axis system fixed to the aircraft, it is necessary to determine the inertial accelerations in terms of body axis quantities. This results in extra terms in the equations.

The full non-linear 6-DoF equations of motion for a rigid body in atmospheric flight, assuming an inertial reference frame fixed at a point on non-rotating Earth, are:-

Translational: $\begin{cases} m(\dot{U} - Vr + Wq) = X \\ m(\dot{V} - Wp + Ur) = Y \\ m(\dot{W} - Uq + Vp) = Z \end{cases}$

Rotational: $\begin{cases} I_{xx} \dot{p} - I_{yz}(q^2-r^2) - I_{zx}(\dot{r}+pq) - I_{xy}(\dot{q}-rp) - (I_{yy} - I_{zz})qr = L \\ I_{yy}\dot{q} - I_{zx}(r^2-p^2) - I_{xy}(\dot{p} + qr) - I_{yz}(\dot{r}-pq) - (I_{zz} - I_{xx})rp = M \\ I_{zz}\dot{r} - I_{xy}(p^2-q^2) - I_{yz}(\dot{q}+rp) - I_{zx}(\dot{p}-qr) - (I_{xx} - I_{yy})pq = N \end{cases}$

Normally $I_{xy} = I_{yz} = 0$ because symmetry with respect to the $xz$ plane is assumed and the rotational equations reduce to:

$$I_{xx}\dot{p} - I_{zx}(\dot{r}+pq) - (I_{yy}-I_{zz})qr = L$$

$$I_{yy}\dot{q} - I_{zx}(r^2-p^2) - (I_{zz} - I_{xx})rp = M$$

$$I_{zz}\dot{r} - I_{zx}(\dot{p}-qr) - (I_{xx} - I_{yy})pq = N$$

Terms like the product $Wq$ in the first equation can be thought of as the inertial acceleration due to the aircraft rotation, i.e. a centripetal acceleration.

The above equations also assume that the origin of the axis system is fixed at the c.g. of the aircraft. If this is not the case then extra terms appear in the equations. BAE Systems at Warton often use the aerodynamic reference point for the origin of the axis system rather than the c.g.

One use of these equations which arises in this unit is to obtain the equation for the normal inertial acceleration at the c.g. of the aircraft.

$$ \text{Normal inertial acceleration} = (\dot{W} - Uq + Vp)$$

Which then in the case of longitudinal only motions, makes $p$ to be zero and

$$\text{Normal inertial acceleration (longitudinal only)} = (\dot{W} - Uq)$$

Thus the normal inertial acceleration at the c.g. in g's positive up is:

$$n_{z_{cg}} = -\frac{(\dot{W} - Uq)}{g}$$

### 1.3.2 Linearisation of Equations

As shown above the equations may be non-linear, in which case the external forces and moments will be functions of many parameters such as forward speed, incidence, control surface angles, etc. It is useful to linearise the equations and this is done by applying a small perturbation to the equations about a steady state condition. The example below is for the z-axis translational equation only; linearisation of the other equations is similar.

Restating the nonlinear form but with the gravitational force seperated from the aerodynamic force Z we have:

$$m(\dot{W}-Uq+Vp)=Z+mg\cos(\theta)\cos(\phi) \tag{1}$$

Perturbating this equation by a small amount so that $W=W_0+w$, etc. gives:

$$m([\dot{W}_0+\dot{w}] - [U_0+u][q_0+q] + [V_0+v][p_0+p]) = Z+0 + Z + mg\cos(\theta_0 + \theta)\cos(\phi_0 + \phi)$$

Where the subscript $_0$ denotes the original steady state value prior to the perturbation.

Expanding this, and neglecting second order perturbation terms as they are deemed small, we have:

$$\underline{m(\dot{W}_0-U_0q_0+V_0p_0)} + m(\dot{w}-U_0q-uq_0+V_0p+vp_0) = \underline{Z_0+mg\cos(\theta_0)\cos(\phi_0)} + Z$$

Since from (1) the underlined terms of the left and right hand sides are equal they can be cancelled. In addition initial angular veloities are usually taken to be zero so we have

$$ m(\dot{w}-U_0q+V_0p)=Z$$

and it only remains to find Z, the small perturbation in the external forces. This can be determined approximately by considering the Taylor series expansion of $Z_0+Z$ about $Z_0$ i.e.

$$ Z_0+Z = Z_0 + \frac{\partial Z}{\partial u}u + \frac{\partial Z}{\partial w}w +\frac{\partial Z}{\partial q}q +\frac{\partial Z}{\partial \eta}\eta + \cdots$$

Once again the 1st terms on each side cancel to give an expression for $Z$ as required. Implicit in this is that 2nd order terms are small and can be neglected, that is the relationships between $Z$ and $u$, etc. are linear. The terms $\frac{\partial Z}{\partial u}, \frac{\partial Z}{\partial w}, \text{ and }\frac{\partial Z}{\partial q}$ are called the *stability derivatives*, and $\frac{\partial Z}{\partial \eta}$ is called the *control derivative*

### 1.3.3 Derivatives and Non-Dimensional Forms

By convention the nomenclature for the derivatives is the force or moment symbol with a subscript denoting the quantity with respect to which the partial derivative is taken. For example:

$$ \frac{\partial Z}{\partial w} \text{ is denoted as } Z_w $$

The derivatives are often expressed in non-dimensional form and by convention these non-dimensional derivatives are given the symbols $C$ with the subscript of the derivative, e.g.

$$ Z_w \text{ is denoted } C_{z_w} \text{ in non-dimensional form }$$

To obtain a consistent set of equtions in the non-dimensional form all quantities including the masses, inertias and velocities, etc. are non-dimensionalised. For example:

$$ m(\dot{w}-U_0q)=Z_uu+Z_{\dot{w}}\dot{w} + Z_ww + Z_qq +Z_\eta\eta $$

is the dimensional longitudinal z axis equation for an aircraft with only an elevator input. To non-dimensionalise this we divide through by $\frac{1}{2} \rho l^2V_f^2$, where $l$ is some length parameter. $l^2$ is usually taken as the wing area $S$, whereas $l$ on its own is usually taken to be the mean chord $\bar{c}$ for longitudinal parameters, or the wing span $b$ for lateral parameters, or sometimes distance from the main wing to the tail; $V_f$ is the freestream velocity.

$\frac{1}{2} \rho l^2V_f^2$ has units of force so that it will non-dimensionalise each of the terms in the equation. However, it is easy to see that to non-dimensionalise $Z_u$ only requires a division by $\frac{1}{2} \rho l^2V_f$, so that dividing $Z_uu$ by $\frac{1}{2} \rho l^2V_f^2$ gives $C_{z_u} \left( \frac{u}{V_f} \right)$. The term $\left( \frac{u}{V_f} \right)$ is thus the non-dimensional velocity $u'$.

Similarly: shown below is how to achieve other dimensionless terms from their dimensioned counterparts being multiplied by their respective non-dimensionalising factor, with the simplified calculation on the RHS.

| dimensionless term | dimensioned term $\times$ non-dimensionalising factor |                Result                |
|:------------------:|:-----------------------------------------------------:|:------------------------------------:|
|        $m'$        |       $m \times \frac{1}{\frac{1}{2}\rho l^3}$        | $\frac{m}{\frac{1}{2}\rho S\bar{c}}$ |
|     $\dot{w}'$     |           $\dot{w} \times \frac{l}{V_f^2}$            |   $\frac{\dot{w} \bar{c}}{V_f^2}$    |
|        $w'$        |                    $\frac{w}{V_f}$                    |                                      |
|       $U_0'$       |                   $\frac{U_0}{V_f}$                   | $\approx$ 1 for small perturbations  |
|        $q'$        |                $q\times\frac{l}{2V_f}$                |       $\frac{q\bar{c}}{2V_f}$        |
|       $\eta$       | Already dimensionless                                                      |                                      |


So that the non-dimensional equation becomes

$$ m'(\dot{w}'-q') = C_{z_u}u'+C_{z_{\dot{w}}} \dot{w}' + C_{z_w}w' + C_{z_q}q' + C_{z_\eta}\eta $$

A summary of the non-dimensionalising denominators for the derivatives is given below.

|                       |                 | X, Y, Z Forces                                           | L, N Moments              | M Moments                       |
| --------------------- | --------------- | -------------------------------------------------------- | ------------------------- | ------------------------------- |
| Controls:             | $\eta$, etc.    | $\frac{1}{2}\rho SV_f^2$                                 | $\frac{1}{2}\rho SbV_f^2$ | $\frac{1}{2}\rho S\bar{c}V_f^2$ |
| Linear Velocities:    | $u, v, w$       | $\frac{1}{2}\rho SV_f$                                   | $\frac{1}{2}\rho SbV_f$   | $\frac{1}{2}\rho S\bar{c}V_f$   |
| Angular Velocities    | $p, q, r$       | $\frac{1}{2}\rho \bar{c}SV_f$ or $\frac{1}{2}\rho SbV_f$ | $\frac{1}{2}\rho Sb^2V_f$ | $\frac{1}{2}\rho S\bar{c}^2V_f$ |
| Linear accelerations: | $\dot{w}$, etc. | $\frac{1}{2}\rho S\bar{c}$                               | $\frac{1}{2}\rho Sb^2$    | $\frac{1}{2}\rho S\bar{c}^2$                                 |

To obtain the non-dimensional derivative, divide the dimensional derivative by the appropriate quantity. e.g.

$$ C_{z_w} = \frac{Z_w}{\frac{1}{2}\rho SV_f } $$

Many of the signs of derivatives can be deduced from physical reasoning, for example $M_\eta$ must be such that a negative pitching moment is produced for a positive elevator deflection. This reasoning is summarised for a conventional stable aircraft in the table below

$$ \begin{array}{c|cccccccccc} & u & v & \dot{w} & w & p & q & r & \eta & \xi & \zeta \\ \hline X & - & 0 & 0 & - & 0 & - & 0 & - & 0 & 0 \\ Y & 0 & - & 0 & 0 & 0 & 0 & + & 0 & 0 & + \\ Z & - & 0 & - & - & 0 & - & 0 & - & 0 & 0 \\ L & 0 & - & 0 & 0 & - & 0 & + & 0 & - & + \\ M & + & 0 & - & - & 0 & - & 0 & - & 0 & 0 \\ N & 0 & + & 0 & 0 & + & 0 & - & 0 & + & - \end{array} $$

## 1.4 The Matrix Form of the Equations of Motion

It is common to express the equations of motion in matrix form. One matrix equation is used to express the motions in the longitudinal directions and another in the lateral. This seperation of longitudinal and lateral motions is possible because under normal circumstances they are approximately decoupled. Taking the previous equations with the aerodynamic terms and setting the initial angular velocities to zero gives for the longitudinal equations:

$$ \begin{bmatrix} ms-X_u & -X_w & mg-(X_q+mW_0)s \\ -Z_u & ms-Z_w & -(Z_q + mU_0)s \\ -M_u & -(M_w + M_\dot{w}s) & I_{yy}s^2-M_qs \end{bmatrix} \begin{bmatrix} u \\ w \\ \theta \end{bmatrix} = \begin{bmatrix} X_\delta \\ Z_\delta \\ M_\delta \end{bmatrix}\delta $$

where $\delta$ represents the sum of control surface effects. Similarly for the lateral equations:

$$ \begin{bmatrix} ms-Y_v & -mg-Y_ps & mU_0-Y_r \\ -L_v & I_{xx}s^2-L_ps & -I_{zx}s-L_r \\ -N_v & -I_{zx}s^2-N_ps & I_{zz}s-N_r \end{bmatrix} \begin{bmatrix} v \\ \phi \\ r \end{bmatrix} = \begin{bmatrix} Y_\xi & Y_\zeta \\ L_\xi & L_\zeta \\ N_\xi & N_\zeta \end{bmatrix} \begin{bmatrix} \xi \\ \zeta \end{bmatrix} $$

## 1.5 Response Modes
Once the equations of motion have been formed it is evident that solutions exist which define the transient response of the aircraft. Normally these are considered decoupled between longitudinal and lateral equations. The modes are summarised here.

### 1.5.1 Longitudinal Motions
- **Short Period Mode**. This is the mode that defines the initial response of the aircraft to a pitch control input. It’s frequency is usually a little less than 1Hz for a high performance aircraft. The motion is dominated by pitch and heave responses, and in a conventional aircraft should have good damping to provide reasonable controllability.
- **Phugoid Mode**. This is a long period oscillatory motion dominated by excursions in forward speed and pitch angle. The incidence or heave velocity does not change much. Because of this it can be excited by a change in thrust, for example. In conventional aircraft the phugoid could have low damping but this may be acceptable since the period is very long and the pilot, or a simple autopilot, can control it.

### 1.5.2 Lateral Motions
- **Dutch Roll Mode**. This is an oscillatory mode dominated by sideslip and yawing. In many aircraft low damping of the Dutch roll needs to be modified by the addition of a yaw damper system.
- **Pure Roll Mode**. This is a non-oscillatory mode which follows the application of an aileron input. The result of the input is an exponential rise to a constant roll rate.
- **Spiral Mode**. This is a non-oscillatory mode in which all lateral motions are present. In some cases it may be unstable but with a long time constant.

## 1.6 Approximate Equations of Motion
In the cases of the short period and Dutch roll modes the motion is dominant in certain degrees of freedom. This allows them to be considered in an approximate set of equations in which the responses in the other freedoms are considered to be zero. These approximate equations are often used when the other modes are not considered relevant to the analysis being undertaken.

For the short period mode an approximate set of equations can be derived by setting the forward speed ($u$) terms to zero in the longitudinal equations. Effectively this means that the first column and row of equation (2) can be deleted. The resulting $2 \times 2$ set of equations can be manipulated relatively simply to obtain approximate roots.

$$ \begin{bmatrix} ms-Z_w & -(Z_q+mU_0)s \\ -(M_w+M_\dot{w}s) & I_{yy}s^2-M_qs  \end{bmatrix} \begin{bmatrix} w \\ \theta \end{bmatrix} = \begin{bmatrix} Z_\delta \\ M_\delta \end{bmatrix} \delta $$

where $\delta$ represents the sum of control surface effects.

For the Dutch roll mode an approximate set of equations can be derived by setting the roll terms, $p$ and $\phi$, to zero in the lateral equations. This eliminates the second column and row in equation (3). Again this results in a $2 \times 2$ set of equations that can be manipulated more easily.

$$ \begin{bmatrix} ms-Y_v & mU_0-Y_r \\ -N_v & I_{zz}s-N_r \end{bmatrix}\begin{bmatrix} v \\ r \end{bmatrix} = \begin{bmatrix} Y_\xi & Y_\zeta \\ N_\xi & N_\zeta \end{bmatrix} \begin{bmatrix} \xi \\ \zeta \end{bmatrix} $$

Other approximations are sometimes used for the other roots – see second year notes.

[^1]: Here, $y'$ is the $y_e$ axis rotated through $\psi$ and $x''$ is the $x'$ axis rotated through $\theta$