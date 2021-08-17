>Links [[040700 Advanced Space Systems]]

# Non-sphericity of Earth

> **Learning Objectives:**
> - [[Non-sphericity of Earth#Keplerian Assumptions | List of assumptions of Keplerian orbits]]
> - [[Non-sphericity of Earth#Perturbations| List the different perturbations, their types and their effect on orbital elements]]
> - [[Non-sphericity of Earth#Restricted 3 body problem RTBP| Explain the restricted 3 body problem]]
> - [[Non-sphericity of Earth#RTBP Equations of Motion| Define the Lagrange points]]
> - [[Non-sphericity of Earth#Terms for Non-sphericity| Describe the difference between the shape of the Earth and a sphere]]
> - [[Non-sphericity of Earth#J2 Effects on Orbital Elements| Explain the effects of J2 on orbits]]

## Summary
- Keplerian orbits make certain assumptions. One is that Earth gravitation is the only force acting
- Other forces/perturbations include the effects of other bodies, the non-sphericity of the Earth, solar radiation pressure and drag
- The restricted three-body probkem assumes the mass m is so small that it has no effect on the motion of the primary bodies
- The Lagrange points are 5 quasi stable solutions to the equations of motion where the mass m would have zero velocity and zero acceleration
- Non-sphericity of Earth causes the $J_2$ effect

## Keplerian Assumptions
- We have assumed *point masses*
- In reality, nothing is eer in orbit about a point mass without any other perturbations - (even in an orbit about a black hole!)
- The two body relationship is typically the dominant orbital dynamic. Everything else is regarded as a small *perturbation*

## Perturbations
$$\left. \begin{matrix} \text{1. Three body solutions} \\ \text{2. Non Sphericity of the Earth} \\ \text{3. Luni-Solar Perturbations} \end{matrix} \right\} \text{ Gravitational}$$

$$\left. \begin{matrix} \text{4. Atmospheric Drag} \\ \text{5. Solar Radiation Pressure} \end{matrix} \right\} \text{ Non-Gravitational} $$

Which all lead to a $\Delta$v budget increase for station-keeping requirements, provided by the AOCS.

### Types of Perturbations
- Secular - Linear variation of an orbital element
- Short-period - vary with period < orbital period
- Long-period - vary with period > orbital period

Only RAAN and arg of perigee and mean anomaly experience secular variations due to moon and other forces.

### Effects of Perturbations (on orbital elements)

![[Pasted image 20210202103543.png]]

Previously we had the acceleration due to gravity as:

$$ \ddot{r} = - \frac{\mu}{r^3}\pmb{r} $$

Now we can write:

$$ \ddot{r} = - \frac{\mu}{r^3}\pmb{r} + \pmb{a}_p $$

$\pmb{a}_p$: sum of all accelerations due to perturbations
$\pmb{r}$: the position vector of the satellite
$\mu$: the gravitational constant

****

## Restricted 3 body problem (RTBP)

Solving for 3 bodies is very difficult, but something we can do is restrict them to make it solvable.

![[Pasted image 20210202104507.png]]

It has to have a certain set of conditions:
- m2 has to be orbiting about m1
- m must have negligible mass (eg spacecraft)
- We are interested in motion of m
- There is no (easy) close form solution, but we can set up equations of motion nd integrate

We say that m1 and m2 are orbiting each other around a barycentre *G*

non inertial co-moving frame of reference xyz (it moves with the rotation of m1 and m2). Therefore in this frame of reference m1 and m2 appear to remain at rest

Methods of solution are beyond the scope of this course:
- 'Special perturbation' - Encke or Cowell's methods
- 'General perturbation' - Force components partial derivatives

### RTBP: Equations of Motion

$$\ddot{x} - 2\Omega\dot{y}-\Omega^2x = -\frac{\mu_1}{r_1^3}(x+\pi_2r_{12}) - \frac{\mu_2}{r_2^3}(x-\pi_1r_{12}) \tag{1-3}$$

$$\ddot{y} + 2\Omega\dot{x}-\Omega^2y = -\frac{\mu_1}{r_1^3}y-\frac{\mu_2}{r_2^3}y \tag{1-4}$$

$$\ddot{z} = -\frac{\mu_1}{r_1^3}z - \frac{\mu_2}{r_2^3}z \tag{1-5}$$

Where:

angular velocity $\Omega = \sqrt{\frac{\mu}{r_{12}^3}}$
$\pi_1 = \frac{m_1}{m_1+m_2}$
$\pi_2 = \frac{m_2}{m_1+m_2}$

Although these equations have no closed form analaytical solution, we can use them to determine the location of the equilibrium points (Lagrange points).

Locations in space where:

$$\begin{matrix} \dot{x} = \dot{y} = \dot{z} = 0 \\ \ddot{x} = \ddot{y} = \ddot{z} = 0 \end{matrix} \tag{1-6}$$

are equilibrium points called '*Libration*' or '*Lagrange*' points.

There are 5 quasi-stable solutions: L1-L5, trajectories passing near these points will linger, and will require little station-keeping if a satellite is placed there. 3 co-linear solutions L1-L3, and are unstable to displacements in their line, and stable against transverse displacements. L4-L5 the equatorial 60 degree leading and lagging points are stable against displacements in all directions.

![[Pasted image 20210202110036.png]]

We have Lagrange points in most 2 body systems, like Sun-Earth, Earth-Moon, Sun-Jupiter...

### Objects at Lagrange Points

- *Sun-Earth L1*: solar observation missions eg: Int. Sun Earth Explorer, Solar Heliospheric observatory, Advanced Composition Explorer.
- *Sun-Earth L2*: Space based observatories, as same relative position to Sun and Earth (easy to have sun shield and not move it) eg: Herschel, Planck, Chang'e2, Gaia, James Webb Telescope.
- Saturn-Moon L4 L5: Saturn's moons Tethys and Dione have smaller moons at theur L4 and L5 points.

Most famous are these Jovian trojans, but there are also Martian, Neuptunian and terrestrial trojans as well.

### Interplanetary Superhighway Note

When different Lagrange points from different stable orbits come close to each other or overlap, it is possible for a spacecraft to 'ride the wave' and transition from one systems Lagrange point to another with almost no fuel. Therefore if you are willing to wait for the exact correct time, a so-called '*low energy transfer*' can be performed.

> Source: https://www.youtube.com/watch?v=1-6Str9V26g&ab_channel=SciShowSpace 

Sometimes it can take years or even millenia for Lagrange points to favourably overlap and so this is not always practical.

****

## Terms for Non-sphericity

![[Pasted image 20210202112345.png]]

- Newton's theories valid for spherical masses
- Earth rotates at a reasonable rate, this causes *equatorial bulge* or *oblateness* or *triaxiality* or *non-sphericity*
- Oblateness causes gravitational field to vary with latitude. This is called a 'zonal variation'

## The Gravity Field

The acceleration of a gravitational field is usually represented as the **gradient** of the **potential**. The potential 'U' is the potential energy/unit mass.

$$ U_{\text{point mass}} = -\frac{\mu}{r} $$

Remembering this comes from Newtons Law of gravitation: $\pmb{\ddot{r}} = \frac{GM}{r^2}\pmb{\hat{r}} = -\frac{\partial U}{\partial r} = -\nabla U$

A good approximation ofEarth's field is:

$$ U = U_{\text{point mass}} + R$$

Where $R$ represents non-spherical terms

## Earths Gravitaional Potential (non-examinable)

If we rewrite the Earths gravitation in terms of spherical harmonics we get:

$$ U = -\frac{\mu}{r}\left[ 1 - \underbrace{\sum_{n=1}^\infty \left( \frac{R_e}{r} \right)^n J_nP_n(\sin\phi) + \sum_{n=1}^\infty\sum_q^n \left( \frac{R_e}{r} \right)^n J_nP_n(\sin\lambda) \cos q(\Lambda-\Lambda_{nq})}_{\text{non-spherical terms}} \right] \tag{1-7}$$

This is a function of the following: (examinable)

$\phi$: longitude
$\Lambda-\Lambda_{nq}$: constant describing longitude minima
$\lambda$: latitude of satellite
$R_e$: Earth radius
$P$: Legendre-associated function
$J$: Constants but vary with each gravitational body

All the odd J terms represent north-south assymetry $J_3$, $J_5$ ...

## J terms

$J_n$ represent the deviations of the geo-potential from perfect sphericity. The values from $J_2$ to $J_5$ obtained for the Earth and the qualitatively sketched deformations resulting from them are as follows:

$$\begin{matrix} J_2=1083.9 \dot{} 10^{-6} & J_3 = -2.4 \dot{} 10^{-6} & J_4 = -1.3 \dot{} 10^{-6} & J_5 = -0.2 \dot{} 10^{-6}\end{matrix}$$

![[Pasted image 20210202114602.png]]

So the true shape of the geopotential is a linear weighted sum of those spherical harmonics, from the 1st order term (point mass term), to higher and higher harmonics, representing increasing spacial detail of the Earths mass distribution.

The $J_2$ term is the dominant one as you can see from the order of magnitude and they decrease and decrease, albeit in the same order of magnitude for $J_2$ and $J_3$.

## J2 Effects on Orbital Elements

$J_2$ affects $\Omega$ and $\omega$:

1. **Regression of RAAN ($\Omega$)**

$$\frac{d\Omega}{dt}=\frac{-10 \cos i}{(\frac{r}{R_E})^{\frac{7}{2}}(1-e^2)^2} \space \space \space \text{ (deg/day)} \tag{1-9}$$

$R_E$: Radius of Earth
$r$: Distance of satellite from the Earth (i assume center of earth, as it is not clarified)
$e$: eccentricity of the orbit
$i$: inclination of orbit

**Negative** for i < 90 degree, so we have regression of nodes (ie: movement westward)
**Positive** for 90 > i > 180 degree, movement eastwards

### Sun Synchronous Orbit

As you may remember from AVDASI 4 we are able to use this regression, by selecting a correct inclination and altitude to achieve a nodal regression rate of roughly a degree a day. This means that throughout the year the satellite will always pass over any given point on the surface at the same local solar time. This time can be referred to as the local time of the ascending node. This consistent lighting is useful characteristic for imaging.

2. **Drift of Argument of Perigee ($\omega$)**

$$ \frac{d\omega}{dt} = \frac{-5(5\cos^2i-1)}{(\frac{r}{R_E})^{\frac{7}{2}}(1-e^2)^2} \space \space \space \text{ (deg/day)} \tag{1-10}$$

When $(5\cos^2i-1) = 0$ we have zero drift of perigee, i = 63.4 degree, $\frac{d\omega}{dt}=0$. This means a satellite can hang out over a particular point on the Earth if it has this inclination


