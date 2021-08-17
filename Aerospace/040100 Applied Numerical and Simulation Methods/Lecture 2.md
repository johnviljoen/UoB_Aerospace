# Lecture 2

> Links [[040100 Applied Numerical and Simulation Methods]]

> Contents

## Computational Tools used in Aerodynamics: Eulerian Methods

| Methods in order of increasing complexity                         | Requirements   |
| ----------------------------------------------------------------- | -------------- |
| Ideal Flow: Joukowski. ($u, v, P$)                                | Surface meshes |
| Panel Methods, VLM $\rightarrow$ Coupled panel/VLM-boundary layer | Surface meshes |
| Potential methods $\rightarrow$ Coupled potential-boundary layer  | Volume meshes  |
| Euler methods $\rightarrow$ Coupled Euler-boundary layer          |                |
| RANS methods (laminar)                                            |                |
| RANS methods including turbulence models                          |                |
| LES and DNS methods                                               |                |

(notes that RANS with turbulence models all eddies and DNS resolves all eddies)

## Panel Methods

- Ideal fluid. Potential flow. (Images from PABLO code, 2014)

![[Pasted image 20210209131640.png]]

- Correct for compressibility using Prandtl-Glauert
- Good for basic flows and used for validating low speed CFD codes
- Ideal for considering basic design, for example loading distributions, and induced drag.
- No viscous effects, and incorrect for strongly compressible flows
- Similar origins for vortex lattice methods (VLM) and doublet lattice methods (DLM)
- Important issue is the 'roll-up' of vortex wake, as this contains some subtleties
	- $\Rightarrow$ Some codes are iterative: loading (circulation) distribution $\rightarrow$ wake $\rightarrow$ effect on vorticity distribution $\rightarrow$ wake roll-up, etc.
- **AVL** and **Tornado** are well-known tools in this area
- Unsteady flows not straightforward. Influence matrix is 'global', but we know from basic physics that real influence is not global.

## Methods for Rotating Bodies

- Much interest in design of rotor blades, propeller blades and wind turbine blades.
- Major issue is the vortical wake, and the induced velocities at the blades due to wake.
- This can be modelled correctly in methods such as Blade Element Methods (BEM) and Free Wake Methods - modified versions of vortex lattice approach. (Images from Tonio Sant, 2007.)

![[Pasted image 20210209132142.png]]

![[Pasted image 20210209132211.png]]

- Volume mesh-based CFD codes require huge meshes to compute and capture vortical wake distribution, so these surface-based methods are very efficient. 
- No viscous drag (torque).

## Viscous-Inviscid Coupled Methods

- Theoretical 'surface' methods are very useful for preliminary planform loading design $\Rightarrow$ often used for inverse design to target $C_L$ distribution.
- Weakness is lack of drag data. 
- Can couple the inviscid surface velocity and pressure field with an integral boundary layer method, solving momentum integral method. This is ideal for forces only.

![[Pasted image 20210209132409.png]]

Surface flow data used to source solution of integral equtions $\Rightarrow \delta^*$ distribution $\Rightarrow$ surface transpiration velocity added to 'change' surface shape. Iterate to convergence.

- **XFOIL** is a 2-D surface-type coupled code.
	- Uses a panel method coupled with an integral boundary layer.
	- Often used for lift-drag polars
	- Can't model separation. Not good for estimating extreme flows, for example $C_{L_{max}}$.
- **VGK** is a 2-D mesh-based coupled code
	- It uses a potential flow solver coupled with an integral boundary layer
	- Accurate for mildly compressible flows (weak shocks) and well-behaved flows 
	- Can't model separation. Not good for estimating extreme flows, for example $C_{L_{max}}$.
- **MSES** is a 2-D mesh-based coupled code
	- It uses an Euler flow solver coupled with an integral boundary layer.
	- Accurate for compressible flows and well-behaved flows.
	- Can't model separation. Not good for estimating extreme flows, for example $C_{L_{max}}$

All the limitations of these codes are due to weaknesses of the boundary layer modelling. This area is called **viscous-inviscid interaction** (VII), and is a particularly challenging area.

- **XFLR** is a (pseudo) 3-D coupled code (surface-type)
	- A vortex lattice method, coupled to **XFOIL** at every wing section, to obtain polars, i.e. $C_L$ and $C_D$ against $\alpha$
	- Local lift, and hence the vorticity distribution is evaluated across the span $\Rightarrow$ source for the vortex lattice method $\Rightarrow$ induced downwash at each section $\Rightarrow$ effective incidence of each section $\Rightarrow$ updated the vorticity distribution. Repeated until convergence. (Images: XFLR Userguide, XFLR Tutorial, 2010.)
	- This is ideal for initial sizing calculations, computation of induced drag, etc...

![[Pasted image 20210209193537.png]]

## Finite-Volume and Finite-Element Methods

Why are F-E methods rarely applied to fluids?
Why are F-V methods rarely applied to structures?

### Navier Stokes Equations:

$$\frac{\partial \pmb{\underline{U}}}{\partial t} + \nabla \dot{} \pmb{\overline{\underline{F}}}_I(\pmb{\underline{U}}) = \nabla \dot{} \pmb{\overline{\underline{F}}}_V (\nabla \pmb{\underline{u}})  $$

where $\pmb{\underline{U}} = [\rho, \rho u, \rho v, \rho w, E]^T$

### Structural Equations:

$$\pmb{M}\pmb{\underline{\ddot{x}}} + C\pmb{\underline{\dot{x}}} + K \pmb{\underline{x}} = 0$$

$$\Rightarrow \rho \frac{\partial^2 \pmb{\underline{x}}}{\partial t^2} + c \frac{\partial \underline{x}}{\partial t} - \nabla \underline{\sigma} = 0$$

where $\underline{\sigma} = \frac{1}{J}(\nabla \pmb{\underline{x}} + \pmb{I}) \sum_2(\nabla \pmb{\underline{x}} + \pmb{I})^T$, and $\pmb{\underline{x}}$ is the displacement vector $= \pmb{\underline{x}} -  \pmb{\underline{x}}_0$.

Conventional finite-volume schemes assume one value of solution variables across each cell, i.e. constant. For fluid equations, the convective terms determine the flow, and involve first spatial derivatives, so this is fine. 

For structural equations, the stress terms determine the ‘flow’, and these involve second spatial derivatives, and so we need first derivatives at each point/cell. Hence, we need higher order variation across the cell.

F-E methods assume shape functions for the variation of properties across each cell, and so are commonly used in structures.

BUT: these higher-order functions make the schemes expensive to solve.

- F-E methods are applied to fluids, and recent interest in Discontinuous Galerkin methods (D-G).
	- Very high order, but expensive. Also, high order polynomials, so not applicable for steep gradients, for example shockwaves.

## Lagrangian Methods

When more gross flow features are required, rather than high fidelity local distributions, Lagrangian methods are often used.

Also, in Eulerian methods only the flow within the meshed region can be analysed: there is no mechanism to allow the flow to go outside the domain.
- How would you analyse, for example, the flow of water out of a ruptured tank ? It is not possible to know where the water would go a priori, and so a huge domain would have to be meshed just in case.
- Lagrangian methods are not restricted by a mesh. In general they are less accurate in terms of high resolution features.

### Vortex Particle (VP) Methods

Example where gross flow features are sufficient is civil engineering.

- Tacoma Narrows bridge collapse; to compute this using a mesh-based CFD code would need a huge mesh and unsteady simulation.

Alternatively, we could use vortex particles to only compute the vorticity field, and only put the particles where we need them. Each particle has a **position** vector, a **vortex strength** and **vortex size**.

![[Pasted image 20210209200853.png]]

A vorticity **propagation/evolution equation** is solved to update the strength of each vortex. 
- Summation is used over all the particles to compute the **induced flow at each particle.**
- Each particle then propagates with the local flow vector and the induced velocity vector.

### Smoothed Particle Hydrodynamics (SPH) Methods

Eulerian methods assume the flow is a continuum. Hence, flows with an interface between two fluids are difficult.

Of particular difficulty are free-surface flows, for example modelling ocean waves breaking on a shore. SPH is often used here. 
- In this case general flow trends, for example how far up the beach the flow goes, is more important than drag values to numerous decimal places. 
- They are also used in **CGI for fluid animations**. High accuracy is less important than visual impression here.

A number of particles are defined and, like VP methods, each has a position vector, size, but also a density. Each particle hence represents a mass.
- The interaction between each particle can be computed and superimposed on the bulk local flow velocity.

The value of any variable at any point in space is then a ‘smoothed’ summation over all particles within a mixing length ($h$) of a kernel function.

Internal and external flow examples. Wavetank and coastal flow.

![[Pasted image 20210209201133.png]]

(Images courtesy SPHERIC and B. Rodgers, 2014.)

Swinging water tank, including damping model:

![[Pasted image 20210209201220.png]]

![[Pasted image 20210209201233.png]] [^1]

## Coupled Eulerian Methods

Clearly volume mesh methods, i.e. Euler and RANS CFD codes, are significantly more expensive than lower fidelity surface mesh methods.

But what does each available model give us, and what do we need?
- If we require drag from skin friction we need a high resolution RANS calculation.
- If we want more general flow properties, for example the induced velocities due to wake effects, we can use a VLM.

$\Rightarrow$ **Consider these as the ** $\underbrace{\pmb{\text{nearfield problem}}}_{\text{Boundary Layer}}$ and the $\underbrace{\pmb{\text{farfield problem}}}_{\text{Induced Velocities}}$.

Consider a helicopter fuselage and rotor in forward flight.
- To simulate blade loads using a RANS code, we would need to capture the vortical wake for tens of rotor diameters behind the blade ⇒ huge meshes AND relative motion of multiple bodies.
- Chimera overlapping meshes often used for this.

![[Pasted image 20210209201938.png]]

Alternatively, consider only meshing and solving RANS on small surface-attached meshes, and using a free-wake model or VLM to convect the wake downstream.

⇒ The blade-attached mesh gives high resolution flow field so forces and moments,
⇒ The boundary of this blade-attached mesh gives the vorticity field for the wake method, 
⇒ The induced velocity at every cell on the boundary of the blade-attached meshes is

computed from the wake model, and these are applied as the boundary conditions. This is iterated on until convergence.

MUCH cheaper than RANS everywhere !

RANS solver plus free wake model including wake roll-up.

![[Pasted image 20210209202120.png]]

## Coupled Eulerian Lagrangian Methods

Example: F-V flow-solver, coupled to structural model, and SPH model for fuel tank flow. Aeroelastic stability calculation.

![[Pasted image 20210209202352.png]] [^2]

## Summary

- Huge range of simulation tools available. (Not all covered here) 
- Lagrangian and Eulerian methods used. In general Lagrangian methods used when high accuracy is less important, and when flow contains a free surface or unknown domain , i.e. mesh is removed. 
- Common methods range from theoretical methods that require fractions of a second to compute, to high fidelity RANS methods that an require months of CPU time. 
- Important to choose the method to match the requirements. 
- Many ‘coupled’ methods (coupled in space/domain) that use appropriate methods to model the relevant physics: 
⇒ Split the problem into a nearfield problem and a farfield problem.

NOTE: Qualitative content will be examined by qualitative questions. General concepts, not specific details, required here.

[^1]: More information in Hall, Rendall, Allen, Peel, Journal of Fluid and Structures, Vol. 56, 2015.
[^2]: More information in Hall, Rendall, Allen, Peel, Journal of Fluids and Structures, Vol. 56, 2015. Hall, Rendall, Allen, Structural and Multidisciplinary Optimisation, Vol. 56, 2017.

