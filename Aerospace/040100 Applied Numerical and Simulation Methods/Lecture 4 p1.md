# Lecture 4 p1

> links [[040100 Applied Numerical and Simulation Methods]]

> Contents

- Objective is to understand capabilities of various numerical methods to solve Navier-Stokes eqns, and complementary tools required to apply them in design. 
- Considered different modelling approaches, in terms of mesh-based and meshless approaches, Eulerian and Lagrangian, and advantages/disadvantages of each. 
- Considered coupling different methods in nearfield and farfield.
- Euler, RANS, LES solvers, i.e. Eulerian volume mesh-based approaches, are now standard, and form the tools considered primarily in the course. 
- Considered pressure-based and density-based solvers.

**Today**

- Formulation of mainstream CFD methods continued
- All 'challenging' cases are viscous-dominated
- Consider modelling of viscous terms

## Design Challenges

![[Pasted image 20210213172407.png]]

## Example: Viscous Modelling (RANS)

![[Pasted image 20210213172453.png]]

## Consideration of Viscous Terms

The Navier-Stokes equations are capable of predicting every detail of any aerodynamic flow that we wish to compute - including the **birth, growth, and decay of every turbulent eddy** in the flow. But, of course this cannot be done analytically, so must be done numerically (DNS). However, to solve the equations numerically down to the **smallest length and time scale** required would need computers three or four orders of magnitude faster than currently available, plus would need Exabytes of memory.

But we are usually only concerned with the **gross features** of any **essentially steady flow**. The real, say x-direction, velocity variation at a point in the mesh may look like

![[Pasted image 20210213172742.png]]

We can say $u(t) = \bar{u} + u'(t)$, i.e. average plus a perturbation.

Normally only $\bar{u}$ is of interest, i.e. the time-averaged value at each point

$$\bar{u}(\pmb{\underline{x}}) = \frac{1}{T} \int_t^{t+T}u(\pmb{\underline{x}},t)dt$$

**Question**: The Navier-Stokes equations tell us how $u(=\bar{u}+u')$ and $v(=\bar{v}+v')$ etc. vary. Can we modify the equations to tell us how $\bar{u}, \bar{v}$ and $\bar{w}$ vary in $\pmb{\underline{x}}$ directly?

**Answer**: Yes, by the process known as "**Reynolds Averaging**" (after Osborne Reynolds).

The trick is to substitute $\bar{u} + u'$ for $u$ and $\bar{v} + v'$ for $v$, etc. in the Navier-Stokes equations. (We will initially only consider velocity fluctuations, not density fluctuations, ie. incompressible flow. Reynolds averagin was first performed on this set of equations, and averaging of compressible flow is much more complex.)

Having made the substitutions we now **average the whole equation**, i.e consider the 2D incompressible continuity equation,

$$\frac{\partial \rho}{\partial t} + \frac{\partial \rho u}{\partial x} + \frac{\partial \rho v}{\partial y} \rightarrow \frac{\partial \rho}{\partial t} + \frac{\partial \rho(\bar{u} + u')}{\partial x} + \frac{\partial \rho (\bar{v} + v')}{\partial y}=0$$

$$\frac{\partial \rho(\bar{u} + u')}{\partial x} + \frac{\partial \rho (\bar{v} + v')}{\partial y}=0$$

$$\frac{\partial \rho \bar{u}}{\partial x} + \frac{\partial \rho \bar{v}}{\partial y} + \frac{\partial \rho u'}{\partial x} + \frac{\partial \rho v'}{\partial y} = 0$$

Time-averaging

$$\frac{1}{T} \int_t^{t+T} \frac{\partial \rho \bar{u}}{\partial x} + \frac{\partial \rho \bar{v}}{\partial y} + \frac{\partial \rho u'}{\partial x} + \frac{\partial \rho v'}{\partial y}dt = \frac{1}{T} \int_t^{t+T} 0 dt = 0$$

$$\frac{\partial \rho \bar{u}}{\partial x} + \frac{\partial \rho \bar{v}}{\partial y} + \frac{1}{T}\int_{t}^{t+T}  \frac{\partial \rho u'}{\partial x} + \frac{\partial \rho v'}{\partial y}dt = 0$$

Now,

$$\int \frac{\partial \rho u'}{\partial x} dt = \rho \frac{\partial}{\partial x}\int u' dt$$

as $u'$ is continuous, so

$$\frac{1}{T} \int_t^{t+T} \frac{\partial \rho u'}{\partial x} dt = \rho \frac{\partial}{\partial x} \frac{1}{T} \int_t^{t+T}u'dt = \rho \frac{\partial \bar{u'}}{\partial x}$$

But $\bar{u'}=0$ since 

$$\bar{u'} = \frac{1}{T}\int_t^{t+T} \underbrace{u-\bar{u}}_{u'} dt = \bar{u} - \bar{u} = 0$$

Similarly

$$\frac{1}{T} \int_t^{t+T} \frac{\partial \rho v'}{\partial y}dt = 0$$

So the averaged continuity equation is

$$\frac{\partial \rho \bar{u}}{\partial x} + \frac{\partial \rho \bar{v}}{\partial y} = 0$$

X-momentum equation (Euler, incopressible)

$$\frac{\partial \rho u}{\partial t} + \frac{\partial \rho u^2}{\partial x}+\frac{\partial \rho u v}{\partial y} = -\frac{\partial P}{\partial x}$$

Again write $\bar{u}+u' = u$, $\bar{v}+v'=v$, and $\bar{P} +P' = P$

![[Pasted image 20210218134403.png]]
This is still the exact equation $\rightarrow$ apply averagin to it

![[Pasted image 20210218134434.png]]

So the Reynolds average of $\frac{\partial \rho u^2}{\partial x}$ and $\frac{\partial \rho u v}{\partial y}$ are:

![[Pasted image 20210218134534.png]]

Also, Reynolds average of $\frac{\partial P}{\partial x}$

![[Pasted image 20210218134559.png]]

So the Reynolds averaged X-momentum equation is:

![[Pasted image 20210218134622.png]]

The last two **extra** terms on the RHS are known as "Reynolds Stresses". There is no physics-based method to obtain these terms

$\Rightarrow$ **Turbulence modelling involves modelling an effective viscosity that represents the effect of turbulent velocity fluctuations WITHOUT having to actually simulate them.**

## Favre Averaging

RANS equations are only valid for incompressible flows. In reality we need to solve compressible flows. A more complex time averaging, Favre averaging, is used in this case. Instead of standard time averaging we decompose variables into a mass- or density-averaged part and a fluctuating part. $\bar{\rho}$ and $\bar{P}$ are constructed from standard time-averaged values,

![[Pasted image 20210218134816.png]]

but all other values are obtained by a mass averaging:

![[Pasted image 20210218134836.png]]

Where now ![[Pasted image 20210218134848.png]]

$\phi''$ is used instead of $\phi'$ to make it clear this is a different fluctuating quantity. Favre averaging is a much longer process than Reynolds Averaging, and leads to many extra terms, particularly in the energy equation. However, under certain assumptions, the Favre Averaged equations can be written in the same form as the RANS equations.