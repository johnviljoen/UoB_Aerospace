# Eulerian vs Lagrangian Approaches to Simulation
> Links [[040100 Applied Numerical and Simulation Methods]]

> Contents

## 1.1 Steady and Unsteady Flow Types

There are severla flow 'types' when considering simulation:

1. Steady flow as a time-independent flow on a fixed mesh.
2. Unsteady flow due to unsteady fluid on a  fixed mesh, for example vortex shedding behind a cylinder.
3. Steady flow including a moving (rigid or deforming) surface, for example static aeroelastic simulation
4. Unsteady flow due to forced (rigid) moving surface, for example oscillating aerofoil, or rotor blades in cyclic pitch.
5. Unsteady flow due to moving (rigid and/or deforming) surface, for example dynamic aeroelastic simulation, aeroelastic simulation rotor blades in cycilic pitch.

### Requirements (Mesh-Based)

- 2, 4, 5 need time-accuract simulation. Time-stepping scheme chosen correctly
- 3, 4, 5 need a mesh deformation scheme. Surface mesh positions computed either via rigid (prescribed) motion or aeroelastic motion each time step or update.
- 3, 5 need a coupling scheme with a structural model (aeroelastic). At each time step or update, aerodynamic surface forces transferred to structural model $\leftrightarrow$ structural deformations transferred to aerodynamic surface. (more later)

![[Pasted image 20210209104133.png]]

## 1.2 Eulerian and Lagrangian Approaches

There are two approaches used in fluid simulation tools.

Eulerian approach invlolves defining/knowing/solving the flow quantities, such that we know:

$$\rho(\pmb{\underline{x}}, t), \space \space \space P(\pmb{\underline{x}}, t), \space \space \space \pmb{\underline{u}}(\pmb{\underline{x}}, t)$$

(NOTE: $\pmb{\underline{x}}= (x, y, z)^T$, and  $\pmb{\underline{u}}=(u,v,w)^T$)

**NOTATION:** $\pmb{\underline{v}}$ represents a vector, $\pmb{M}$ represents a matrix.

For steady flow, determine solution variations by solving relevant equations until:

$$\rho(\pmb{\underline{x}}), \space \space \space P(\pmb{\underline{x}}), \space \space \space \pmb{\underline{u}}(\pmb{\underline{x}})$$

Consider an aerofoil simulation, using a mesh-based CFD code. We store the flow solution in every cell (one shown below) and update each cell solution until it stops changing in time. This is the Eulerian approach, i.e. everything evaluated relative to a fixed axis position, and we consider the flow variation at fixed points (cells in CFD code) in space.

Mesh-based CFD codes ar Eulerian

![[Pasted image 20210209104846.png]]

NOTE: Unsteady flows clearly don't have $\frac{\partial ?}{\partial t} \rightarrow 0$, and these considered later.

In the Lagrangian approach flow variables are not considered at specific points in space, but we consider a **‘packet’ or ‘particle’ of fluid moving in time**. The packet or volume contains a fixed volume of fluid, and its shape may change in time.

Consider again the aerofoil simulation, using a mesh-based CFD code. Now consider a streamline, and the motion of a small volume of fluid in time.

Call the packet of fluid $p$. Now we know that its position is a function of time,

$$\pmb{\underline{x}_p}(t) = (x_p(t), y_p(t), z_p(t))^T$$

and solution:

$$\rho(\pmb{\underline{x}}(t), t), \space \space \space P(\pmb{\underline{x}}(t), t), \space \space \space \pmb{\underline{u}}(\pmb{\underline{x}}(t), t)$$

Then, even for a steady flow, the time variation does not disappear.

![[Pasted image 20210209105425.png]]

For ‘solvers’ this means we have a number of ‘particles’, and for each one we store the position vector and properties, see later. This means there are no meshes associated with Lagrangian methods, as we have no need of one.

### Governing Equations

These methods help to demonstrate the origin of fluid flow equations. These are based on conservation of mass, momentum and energy. Momentum equations use Newton’s second law, i.e. $\pmb{\underline{f}} = m\pmb{\underline{a}}$. Consider the acceleration of the fluid at any point in the flow.

If we consider the flow at an individual point in mesh, see earlier figure, we know at a fixed point:

$$\pmb{\underline{a}} = \frac{\partial \pmb{\underline{u}}}{\partial t}$$

For a steady flow, we know this is zero, but we also know there MUST be an acceleration field, as the velocity vector changes in space. In fact, this derivative is only the "local" derivative.

Now consider the Lagrangian approach. Now we have:

$$\pmb{\underline{u}}(\pmb{\underline{x}}(t),t) = \pmb{\underline{u}_p} = f(x_p(t), y_p(t), z_p(t), t)^T$$

and so

$$\pmb{\underline{a}_p} = \frac{\partial \pmb{\underline{u}_p}}{\partial t} + \frac{\partial \pmb{\underline{u}_p}}{\partial x_p} \frac{dx_p}{dt} +\frac{\partial \pmb{\underline{u}_p}}{\partial y_p} \frac{dy_p}{dt} +\frac{\partial \pmb{\underline{u}_p}}{\partial z_p} \frac{dz_p}{dt} = \frac{\partial \pmb{\underline{u}_p}}{\partial t} + \underbrace{u_p\frac{\partial \pmb{\underline{u}_p}}{\partial x_p} + v_p\frac{\partial \pmb{\underline{u}_p}}{\partial y_p} + w_p\frac{\partial \pmb{\underline{u}_p}}{\partial z_p}}_{\text{Convective}}$$

This must be the case at any position in space, and so:

$$\pmb{\underline{a}} = \frac{\partial \pmb{\underline{u}}}{\partial t} + u\frac{\partial \pmb{\underline{u}}}{\partial x} + v\frac{\partial \pmb{\underline{u}}}{\partial y} + w\frac{\partial \pmb{\underline{u}}}{\partial z} = \frac{D\pmb{\underline{u}}}{Dt}$$

This is the **"material"** derivative, and includes the **local** and convective derivatives.

Generally the material derivative of any property is:

$$\frac{D()}{Dt} = \frac{\partial ()}{\partial t} + u \frac{\partial ()}{\partial x} + v \frac{\partial ()}{\partial y} + w \frac{\partial ()}{\partial z} = \frac{\partial ()}{\partial t} + \pmb{\underline{u}} \dot{} \nabla() $$

So what types of flows require Euerlian and Lagrangian approaches?

Conider computation of viscous transonic aerofoil flow:
RAE2822, M = 0.74, α = 2.79 deg, Re = 6.5 × $10^6$

![[Pasted image 20210209111352.png]]

Need detailed flowfield variations here, as require surface skin friction for accurate drag computation, so need an Eulerian approach. Forces $\rightarrow$ Drag, Lift.

Need detailed flowfield variations here, as require surface skin friction for accurate drag computation, so need an Eulerian approach.

![[Pasted image 20210209111443.png]]

Eulerian (mesh-based) methods also assume flow is a continuum. How to simulate flows with free surfaces, for example waves breaking against a flood defense, fuel sloshing in a tank? Lagrangian methods used here, see later.

## Summary

- Objective is to understand capabilities of numerical methods to solve various forms of Navier-Stokes eqns, and complementary tools required to apply them in design.
- Considered (very briefly):
	- Different flow types and subsequent requirements.
	- Different modelling approaches; mesh-based and meshless approaches, Eulerian and Lagrangian

**NEXT:**

- Consider application of CFD methods



