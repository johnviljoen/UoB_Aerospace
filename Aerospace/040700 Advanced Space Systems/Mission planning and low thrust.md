# Mission Planning and Low Thrust

> Links [[040700 Advanced Space Systems]]

> Contents

## Learning Objectives

- Be familiar with launch/**departure** parameters
- Be aware of factors which reduce choice of departure asymptotes
- Define 'C3'
- Explain how **gravity assists** work
- Describe and use **B plane targeting**

### Reminder: Planetary departure

![[Pasted image 20210227104552.png]]

In order to escape the gravitational pull of a planet, the spacecraft must travel a hyperbolic trajectory relative to the planet arriving at the sphere of influence (r=∞) with a relative velocity v∞ (hyperbolic excess velocity).

## Launch Parameters

- RLA: Right ascension of Launch Asymptote
- DLA: Declination of Launch Asymptote

![[Pasted image 20210227104711.png]]

Right Ascension is measured from the Vernal Equinox (defined as the X direction). It is the angle in the X,Y plane. The declination is the angle in the Z direction

### Possible departure trajectories

![[Pasted image 20210227104833.png]]

One requirement on orientation of plane of departure hyperbola: contains center of mass of the planet as well as the relative velocity vector $V_\infty$. Thus hyperbola can be rotated about a line A-A which passes through the planets center og mass and is parallel to $V_\infty$. This sweeps out a surface of revolution on which all possible departure hyperbolas lie. The periapsis of the hyperbola traces out a circle which is the locus of all possible points of injection into the departure trajectory.

### Launch Site Restrictions

![[Pasted image 20210227105226.png]]

This shows the drastic reduction of available departure asymptotes caused by a direct launch into the transfer, from a specific launch site. You can see for Kennedy in Florida that the launch window starts at 35deg azimuth and closes at 120deg azimuth (measured from north).

### Reduction in departure possibilities due to launch site

![[Pasted image 20210227105316.png]]

Let’s see the impact of the launch azimuth restrictions for a launch site at the red latitude. The launch site rotates around at launch site latitude passing through 1 and 2 anticlockwise. The locus of possible injection points forms a circle. The launch window opens at 1 (for kennedy 35deg) and closes at 2 (120deg). The green departure trajectory ‘a’ departs at the beginning of the launch window 1, the blue departure trajectory ‘b’ departs at the end of the launch window 2.

### Venus arrival plane changes

![[Pasted image 20210227105400.png]]

If we are travelling to Venus, rather than travelling to the ecliptic plane ‘a’, followed by a further inclination change on reaching the line of nodes of Venus along arc ‘b’ (yellow highlight), we take advantage of the energy economy of combining the plane change with injection. So the transfer plane includes Earth at launch, and Venus at arrival, arc ‘c’ (pink highlight).

## Mission Planning - 5B

### C3: Launch Energy

- C3 is a concept used in NASA missions to describe launch energy
- Measured in $km^2/s^2$
- C3 = Hyperbolic excess velocity squared

> $$C3 = v_{\infty}^2$$

![[Pasted image 20210227105617.png]]

If we depart from the unique Hohmann trajectory, by advancing or delaying our departure time, we pay a penalty in launch energy, shown here in the form of C3, the V infinity squared. If we hold July 26 arrival date fixed, then varying launch date yields a series of patched conic solutions with different times of flight and C3 values.

### Porkchop Plots

![[Pasted image 20210227105657.png]]

We can calculate a large number of trajectories to get contours of C3 for a range of launch and arrival dates. The diagram produced is called a ”pork-chop plot”. The upper region contains Type II (>π) missions and the lower Type I missions (<π) missions. Launch date selected is a compromise between launch energy C3 , time of flight and arrival conditions.

### Resulting Trajectories

![[Pasted image 20210227105739.png]]

Here you can see that the type I transers travel less than the Hohmann 180 degrees and the type II travel more than the Hohmann 180 degrees.

### Terminology

- C3: Launch Energy ($km^2/s^2$) = $(V_\infty^{\text{out}})^2$
- $V_\infty$: Hyperbolic excess velocity ($km/s$), it is the velocity you have arriving/departing a planets spher of influence w.r.t. *the planet*
	$$V_{\infty 1} = V_D - V_1 \space \text{ or } \space V_\infty^{\text{out}}=V_{s/c}-V_{\text{planet}}$$
- $V_\infty^{\text{in}}$: The excess velicity when arriving at a planet
- $V_\infty^{\text{out}}$: The excess velocity when departing from a planet

## Gravitational Slingshot

- With massive body, strong gravitational interaction which significantly perturbs the s/c orbit.
- Used for gaining/losing speed

It doesnt violate energy/momentum conservation as energy/momentum is stolen/thrust upon the planet being used for gravity assist.

![[Pasted image 20210227111147.png]]

If we have a stationary planet, then the velocity out will be the same as the velocity in due to conservation of momentum. BUT if the planet is moving then the velocity out can be greater or less than the velocity in. It is the motion of the planet relative to the Sun that provides the boost (or decrease) in spacecraft velocity relative to the Sun, which is what matters for interplanetary travel. It is important to note that the spacecraft’s velocity **relative to the planet** does not change in magnitude, only direction.

![[Pasted image 20210227112135.png]]

If we want to add speed then the spacecraft needs to travel behind the planet in its orbit, whereas if we want to drop speed we need to travel in front of the planet in its orbit. As an example, the Messenger mission used gravity assist maneuvering to slow the spacecraft on its way to Mercury since, as Mercury has almost no atmosphere, aerobraking could not be used for insertion into orbit around it.

![[Pasted image 20210227112241.png]]

What would the RH diagram look like for the lower scenario? When do we use braking? To be captured by a planet. When do we use gaining speed? To get to another planet.

## Mission Planning - 5C

### B-Plane Targeting

![[Pasted image 20210227112408.png]]

We target the spacecraft at point on the B plane. The B plane is a plane which slices through the centre of mass of the target planet and is normal to the **asymptote** of the approach trajectory (NOT the approach trajectory itself). T is a vector lying along the reference plane. The reference plane could be the target equatorial plane or ecliptic. R is perpendicular to T. The B plane goes through the CoM of the planet and is defined by B.T and B.R.

![[Pasted image 20210227112451.png]]

- $F_B$ is the trajectory plane
- **B** is the vector which locates target
- **B.R** is the component of vector in R direction
- **B.T** is the component of vector in T direction
- red X is target point

The B-Plane is defined to contain the focus of an idealized two-body trajectory, assumed to be a hyperbola. The B-Plane passes through the central body and is perpendicular to the incoming asymptote of this hyperbola (i.e., perpendicular to V∞, in). The target vector B in the B-Plane is often described by two components, B·T and B·R. The radius of periapse is also important to ensure that the spacecraft does not pass too closely to the surface of the flyby body.

![[Pasted image 20210227112626.png]]

Interplanetary missions necessarily have large errors associated with the early stages. These can be reduced by successive course corrections, as the true trajectory and the target system geometry become clearer. The diagram shows successive error estimates projected onto the target B-plane e.g.: for this Magellan spacecraft to Venus example, the first error estimate (tolerance) is 10000km, then 100km then 10km.

We did this exact thing in the GMAT lab excersise when we aimed to 'Achieve BdotT' and 'Acheive BdotR'!

![[Pasted image 20210227112736.png]]

In this example of B plane targeting (a mission to Mars) in GMAT which you will look at during the labs, you can see the B.T and B.R vectors are defined as the constraints in order that we can target finding out the TCM.V, N and Bs to find out the delta V. Picture 1 is hyperbolic departure leaving the Earth, 2 is the elliptical transfer in the heliocentric reference system, 3 is the hyperbolic arrival, 4 is the Mars capture manoeuvre.

### Complex Orbital Trajectories

![[Pasted image 20210227112821.png]]

In order to save fuel, we can use multiple flybys/gravity assists to achieve a mission, but it takes longer! The spacecraft Galileo used flybys of Venus and Earth to get to Jupiter, and then multiple flybys of Jupiter’s Moons to maximise encounters. The spacecraft Cassini did multiple flybys of Venus, Earth, Jupiter to get to Saturn, it made for a very long journey time of 7 years.

## Summary

- 2 terms to describe departure direction: Right Ascension of launch asymptote and Declination of launch asymptote.
- Launch asymptotes limited by launch site latitude, population density, possibilities to recover equipment.
- C3 = $V_\infty^2$
- A porkchop plot shows contours of C3 for a range of launch and arrival dates.
- The B plane is a plane which slices through the centre of mass of the target planet and is normal to the **asymptote** of the approach trajectory