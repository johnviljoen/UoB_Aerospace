# Lecture 3

> Links [[040100 Applied Numerical and Simulation Methods]]

> Contents
> - Formulation of mainstream CFD methods (including tensor notation)
> - In particular incompressible and compressible approaches
> - NEXT LECTURE: Consider modelling of viscous terms

## 3D Navier-Stokes Equations in Fixed Axis System

Velocity vector: $\pmb{\underline{u}} = (u, v, w)^T$
Body force vector: $\pmb{\underline{f}} = (f_x, f_y, f_z)^T$

### Continuity Equations: (1)

$$\frac{\partial \rho}{\partial t} + \nabla \dot{} (\rho \pmb{\underline{u}}) = 0$$

### Momentum Equations: (3)

$$\frac{\partial (\rho \pmb{\underline{u}})}{\partial t} + \nabla \dot{}(\rho \pmb{\underline{u}} \pmb{\underline{u}}) = - \nabla P + \rho \pmb{\underline{f}} + \frac{4}{3} \nabla(\mu\nabla \dot{} \pmb{\underline{u}}) + \nabla(\pmb{\underline{u}} \dot{} \nabla \mu) - \pmb{\underline{u}}\nabla^2\mu + \nabla \mu \times (\nabla \times \pmb{\underline{u}}) - (\nabla \dot{} \pmb{\underline{u}})\nabla \mu - \nabla \times (\nabla \times \mu \pmb{\underline{u}}) $$

Newtonian Fluid with Constant viscosity, momentum equation reduces to:

$$\frac{\partial (\rho \pmb{\underline{u}})}{\partial t} + \nabla \dot{} (\rho \pmb{\underline{u}} \pmb{\underline{u}}) = -\nabla P + \rho \pmb{\underline{f}} + \frac{1}{3} \mu\nabla (\nabla \dot{} \pmb{\underline{u}}) + \mu \nabla^2 \pmb{\underline{u}}$$

### Energy Equation: (1)

$$\rho \frac{\partial e}{\partial t} + \rho \pmb{\underline{u}} \dot{} \nabla e + P\nabla \dot{} \pmb{\underline{u}} = \nabla \dot{} (K\nabla T) + \Phi$$

### Navier-Stokes Equations in Tensor Form

$$\begin{split} \frac{\partial \rho}{\partial t} + \frac{\partial \rho u}{\partial x} + \frac{\partial \rho v}{\partial y} + \frac{\partial\rho w}{\partial z} & = 0 \\ 
\frac{\partial \rho u}{\partial t} + \frac{\partial \rho u^2}{\partial x} + \frac{\partial \rho u v}{\partial y} + \frac{\partial\rho u w}{\partial z} & = -\frac{\partial P}{\partial x} + \frac{\partial \tau_{xx}}{\partial x} + \frac{\partial \tau_{yx}}{\partial y} + \frac{\partial \tau_{zx}}{\partial z} + \rho f_x \\ \frac{\partial \rho v}{\partial t} + \frac{\partial \rho u v}{\partial x} + \frac{\partial \rho v^2}{\partial y} + \frac{\partial\rho w v}{\partial z} & = -\frac{\partial P}{\partial y} + \frac{\partial \tau_{xy}}{\partial x} + \frac{\partial \tau_{yy}}{\partial y} + \frac{\partial \tau_{zy}}{\partial z} + \rho f_y \\ \frac{\partial \rho w}{\partial t} + \frac{\partial \rho u w}{\partial x} + \frac{\partial \rho v w}{\partial y} + \frac{\partial\rho w^2}{\partial z} &  = -\frac{\partial P}{\partial z} + \frac{\partial \tau_{xz}}{\partial x} + \frac{\partial \tau_{yz}}{\partial y} + \frac{\partial \tau_{zz}}{\partial z} + \rho f_z \\ \frac{\partial E}{\partial t} + \frac{\partial u (E + P)}{\partial x} + \frac{\partial v(E+P)}{\partial y} + \frac{\partial w (E+P)}{\partial z} & = \frac{\partial}{\partial x} (u\tau_{xx} + v\tau_{xy}+w\tau_{xz}) \\ + \frac{\partial}{\partial y}(u\tau_{yx} + v\tau_{yy} + w\tau_{yz}) & + \frac{\partial}{\partial z}(u\tau_{zx} + v\tau_{zy} + w\tau_{zz}) \\ & - \frac{\partial q_x}{\partial x} - \frac{\partial q_y}{\partial y} - \frac{\partial q_z}{\partial z}  \end{split}$$

Where the first equation relates to the mass, the second, third and fourth to the momentum in 3 dimensions, inside of which all partial $\tau$ terms relate to viscosity (shear stress). Finally the fifth equations relates  to the energy.

Shear stresses, written fully, are given by (symmetric, so only six values):

$$\begin{split} \tau_{xx} & = 2\mu \frac{\partial u}{\partial x} - \frac{2}{3}\mu \left( \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} + \frac{\partial w}{\partial z} \right) \\ \tau_{xy} & = \mu \left( \frac{\partial u}{\partial y} + \frac{\partial v}{\partial x} \right)  \\ \tau_{xz} & = \mu\left( \frac{\partial u}{\partial z} + \frac{\partial w}{\partial x} \right) \\ \tau_{yy} & = 2\mu \frac{\partial v}{\partial y} - \frac{2}{3} \mu \left( \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} + \frac{\partial w}{\partial z} \right) \\ \tau_{yz} & = \mu\left( \frac{\partial v}{\partial z} + \frac{\partial w}{\partial y} \right) \\ \tau_{zz} & = 2 \mu \frac{\partial w}{\partial z} - \frac{2}{3}\mu \left( \frac{\partial u}{\partial x} + \frac{\partial u}{\partial x} + \frac{\partial w}{\partial z} \right) \end{split}$$

Where the $\tau_{xx,yy,zz}$ terms represent pure tensile and compressive forces as represented below:

![[Pasted image 20210212174522.png]]

and the $\tau_{xy, xz, yz}$ terms represent the pure shear forces as shown below:

![[Pasted image 20210212174608.png]]

Write the system in tensor form as this is the standard notation (and shortest method to write): subscripts $i, j$ and $k$ mean summations over dimensions:

$$\begin{split} \frac{\partial \rho}{\partial t} + \underbrace{\frac{\partial \rho u_i}{\partial x_i}}_{\frac{\partial \rho u}{\partial x} + \frac{\partial \rho v}{\partial y} + \frac{\partial \rho w}{\partial z}} & = 0 \\ \frac{\partial \rho u_i}{\partial t} + \frac{\partial \rho u_i u_j}{\partial x_j} & = -\frac{\partial P}{\partial x_i} + \underbrace{\frac{\partial \tau_{ji}}{\partial x_j}}_{\frac{\partial \tau_{xx}}{\partial_x}+ \frac{\partial \tau_{yx}}{\partial y} + \frac{\partial \tau_{zx}}{\partial z}} + \rho f_i \\ \frac{\partial E}{\partial t} + \frac{\partial \rho u_j(E+P)}{\partial x_j} & = \frac{\partial u_i \tau_{ji}}{\partial x_j} - \frac{\partial q_j}{\partial x_j}  \end{split}$$

Where $q$ is the heat flux, and the stress terms are given by

$$\tau_{ij} = 2\mu s_{ij} - \frac{2}{3} \mu \frac{\partial u_k}{\partial x_k}\delta_{ij}$$

and where the stress rate tensor is given by:

$$s_{ij} = \frac{1}{2} \left( \frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i} \right)$$

and $\delta_{ij}$ is the Kronecker delta: $\delta_{ij}=1$ if $i = j$, $=0$ otherwise. So its basically the elements of an identity matrix.

## Euler and Navier-Stokes Solvers

- Two commong approaches for Eulerian solvers:
	- 'Density-based' solvers for **compressible flows**
	- 'Pressure-based' solvers for **incompressible flows** (const. density)
	- $\Rightarrow$ Different solution methods for each
- Common Opensource F-V codes:
	- SU2. Stanford University unstructured compressible solver
	- OpenFOAM. Unstructures incompressible solver
	- $\Rightarrow$ Due to cost of commercial tools, OpenFOAM becoming commonplace in industry
	- $\Rightarrow$ Both codes often used  in academia, as extra functionality can be developed
	
## Compressible and Incompressible

- Compressible N-S (ignore body forces and heat fluxes from here):

$$\begin{split} \frac{\partial \rho}{\partial t} + \frac{\partial \rho u_i}{\partial x_i} & = 0 \\ \frac{\partial \rho u_i}{\partial t} + \frac{\partial \rho u_i u_j}{\partial x_j} & = -\frac{\partial P}{\partial x_i} + \frac{\partial \tau_{ji}}{\partial x_j} \\ \frac{\partial E}{\partial t} + \frac{\partial \rho u_j (E+P)}{\partial x_j} & = \frac{\partial u_i \tau_{ji}}{\partial x_j} \end{split}$$

- Mass conservation is a transport equation for density:
	- 5 equations for 6 unknowns;
	- Pressure evaluated from thermodynamic relationship;
		- $P = (1-\gamma)(E - \frac{\rho}{2}\pmb{\underline{u}}^2)$

## Density-Based Approach

- Compressible N-S. Standard 'time-marching' approach

Assume first-order approximation to temporal gradient $\left( \frac{\partial ?}{\partial t} \sim \frac{?^{n+1}-?^n}{\Delta t} \right)$:

$$\begin{split} \rho^{n+1} & = \rho^n - \Delta t\left( \frac{\partial \rho u_i}{\partial x_i} \right) \\ (\rho u_i)^{n+1} & = (\rho u_i)^n - \Delta t\left( \frac{\partial \rho u_i u_j}{\partial x_j} + \frac{\partial P}{\partial x_i} - \frac{\partial \tau_{ji}}{\partial x_j} \right) \\ E^{n+1} & = E^n - \Delta t \left( \frac{\partial \rho u_j (E+P)}{\partial x_j} - \frac{\partial u_i \tau_{ji}}{\partial x_j} \right) \\ \text{Followed by:} & \\ P^{n+1} & = (1-\gamma)\left(E^{n+1} - \frac{\rho^{n+1}}{2}(\pmb{\underline{u}}^{n+1})^2 \right) \end{split}$$

Forms majority of solvers

- Incompressible N-S (constant density)

$$\begin{split} \frac{\partial u_i}{\partial x_i} & = 0 \\ \frac{\partial u_i}{\partial t} + \frac{\partial u_i u_j}{\partial x_j} & = - \frac{1}{\rho} \frac{\partial P}{\partial x_i} + \frac{1}{\rho} \frac{\partial \tau_{ji}}{\partial x_j} \end{split}$$

There is no temporal derivative $\rightarrow$ constraint

- Now pressure variation is NOT linked to the density. Mass conservation is now a velocity field constrain: $\nabla \dot{} \pmb{\underline{u}} = 0$;
	- 3 equations for 4 unknowns + constraint equation;
	- Can use standard 'time-marching' approach for velocity field;
	- Use momentum equation to update velocity vector with current pressure field.

$\Rightarrow$ Need to derive an equation for pressure

## Pressure-Based Approach

- Update $u_i$ by solving either:

$$\begin{split} \frac{\partial u_i}{\partial t} + \frac{\partial u_i u_j}{\partial x_j} & = -\frac{1}{\rho} \frac{\partial P}{\partial x_i} + \frac{1}{\rho} \frac{\partial \tau_{ji}}{\partial x_j} \\ \text{OR} & \\ \frac{\partial u_i u_j}{\partial x_j} & = -\frac{1}{\rho} \frac{\partial P}{\partial x_i} + \frac{1}{\rho}\frac{\partial \tau_{ji}}{\partial x_j} \end{split}$$

- For pressure. Produce a 'different' euation for pressure, by taking divergence of (steady) momentum equation.

$$\frac{\partial}{\partial x_i} \left\{ \frac{\partial u_i u_j}{\partial x_j} + \frac{1}{\rho} \frac{\partial P}{\partial x_i} -\frac{1}{\rho}\frac{\partial \tau_{ji}}{\partial x_j} = 0 \right\}$$

$\Rightarrow$ $\nabla^2 P = f(\pmb{\underline{u}})$ Poisson equation

$\Rightarrow$ This is an elliptical equation and helps to stabilise the solution.

MANY ways to solve this!

## Implications

- Incompressible solvers:
	- No scope for application to higher speed slows (transonic).
	- Compressibility  correction can be used for moderate speeds, say M < 0.5, but flow physics not always correct.
- Compressible solvers:
	- Not suitable for low speed
	- Very slow convergence
	- Inaccurate pressure field
	- Can use preconditioning or artificial compressiblity

$\Rightarrow$ **If only develop one solver, better to develop a density-based one and incorporate some form of incompressible 'fix'.**





