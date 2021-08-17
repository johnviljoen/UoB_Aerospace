# Hyperbolic Trajectories/Orbits

> Links [[040700 Advanced Space Systems]]

> Contents
> - [[Hyperbolic Trajectories#Hyperbolic Trajectories -3A]]
> - [[Hyperbolic Trajectories#Hyperbolic Orbits -3B]]
> - [[Hyperbolic Trajectories#Hyperboilc Orbits -3C]]



## Learning Objectives

- Revise Vis Viva and Hohmann transfers
- List properties for parabolae and hyperbolae
- Derive and be able to manipulate: $\theta_\infty, \beta, \delta, \Delta$
- Be able to calculate hyperbolic excess velocity
- Be able to calculate time from position and position from time for hyperbolic trajectories

## Hyperbolic Trajectories -3A

![[Pasted image 20210218121025.png]]

Remeber that an orbit can take the form of either an ellipse (circle being a special case) or a hyperbola (parabolar being a special case)

![[Pasted image 20210218121108.png]]

These are both different forms of the vis-viva. I find the second one more useful practically. But if you were asked in an interview or exam you could write either.

![[Pasted image 20210218121139.png]]

Here is what we already know about parabolic orbits. The general orbit equation still applies to all conics. The escape velocity is measured at pericentre.

![[Pasted image 20210218121202.png]]

The spacecraft comes in on hyperbolic path I. The asymptotes intersect at C making an acute angle ‘beta’ with the apse line. The angle δ between the asymptotes is called the ‘turn angle’. This is the angle through which the velocity vector is rotated as it rounds the body at F and heads back towards the asymptote. The distance Δ is called the ‘aiming radius’. The true anomaly of the asymptote is called "𝜃∞“. Let’s work out how to find all of these…

![[Pasted image 20210218121232.png]]

Remember that theta is the orbital element : ‘true anomaly’. We can try to find the true anomaly at infinity, this is called the ‘true anomaly of the asymptote’. Note that it is not the same as the true anomaly which we can find from equation 3-10.

![[Pasted image 20210218121303.png]]

![[Pasted image 20210218121315.png]]

Note that the turn angle, delta, is different from angle beta but related to it.

![[Pasted image 20210218121332.png]]

Remember that distance from focus to centre is -ae and rp=a(1-e). Prove this one for yourself!

![[Pasted image 20210218121357.png]]

Note that as soon as you seen that e>1, you know that we are dealing with a hyperbolic orbit and you should be expecting a negative semi major axis value.

## Hyperbolic Orbits -3B

![[Pasted image 20210218121626.png]]

![[Pasted image 20210218121641.png]]

Remember that the parabola is the demarcation between negative and positive energy orbits. The RHS is positive as we have already said that the specific energy is positive for a hyperbola. Vinfinity is called the ‘hyperbolic excess speed’.

![[Pasted image 20210218121701.png]]

We don’t always know the e of the hyperbola, whereas we might know the aiming radius and hyperbolic excess velocity.

![[Pasted image 20210218121723.png]]

Equally if we don’t know the aiming radius but do know the pericentre radius, we can use this to work out e.

![[Pasted image 20210218121744.png]]

So hyperbolic excess velocity, Vinfinity, represents the excess velocity over that which is required to escape from the centre of attraction.

![[Pasted image 20210218121811.png]]

![[Pasted image 20210218121823.png]]

## Hyperboilc Orbits -3C

![[Pasted image 20210218121907.png]]

![[Pasted image 20210218121921.png]]

You do not need to learn these for the exam, they will be quoted. Remember M is mean anomaly, E was eccentric anomaly and F is hyperbolic anomaly (sometimes E and F are used interchangeably). Please note: F is NOT an angle but a dimensionless parameter.

![[Pasted image 20210218121938.png]]

You do NOT need to know these for the exam, they are for reference.

![[Pasted image 20210218122000.png]]

Remember a hyperbolic orbit will always have a negative semi major axis (this is just how it is defined) and an e>1.

![[Pasted image 20210218122022.png]]

![[Pasted image 20210218122036.png]]

We cannot find F from step 3 without using numerical analysis of some sort eg: Newton Raphson.

![[Pasted image 20210218122055.png]]

MUST USE RADIANS! The Newton Raphson method is a method of solving equations numerically. It is an iterative root finding method. It homes in on a root with devasting efficiency.

![[Pasted image 20210218122115.png]]

These are the key equations for hyperbolic orbits, most others can be derived from them if you remember the conditions for e and r.

![[Pasted image 20210218122144.png]]

Beta is the angle between asymptote and apsides Delta is the turn angle

![[Pasted image 20210218122204.png]]