# Patched Conics
> Links [[040700 Advanced Space Systems]]

> Contents
>  - [[Patched Conics#Patched Conics - 4A]]
>  - [[Patched Conics#Patched Conics - 4B]]
>  - [[Patched Conics#Patched Conics - 4C]]
>  - [[Patched Conics#Patched Conics - 4D]]

## Patched Conics - 4A

![[Pasted image 20210218122655.png]]

![[Pasted image 20210218122715.png]]

Effectively the space vehicle can climb out of the Earth's gravity well, as out of a steep hole, to find itself on a gentle slope down towards, or up away from, the Sun. After travelling on a two body orbit between planets, it eventually arrives at another steep hole, the gravity well of the destination planet. To get to Mars, Jupiter, etc. you have to add energy to get away from the pull of the Sun. To get to Venus and Mercury, you have to lose energy.

![[Pasted image 20210218122801.png]]

How do we calculate interplanetary missions analytically, as we cannot use 3 body motion? The solution is to break the mission into segments. During each segment we use two-body motion. We can use the ‘sphere of influence’ concept to define when we are going to switch segment. (Just like KSP!!)

![[Pasted image 20210218122857.png]]

It is necessary to match the velocity vectors on the asymptotes of the hyperbolic trajectories to the velocity vectors in the desired intermediate elliptical transfer orbit. This is the ‘patching’ of the conics.

![[Pasted image 20210218122922.png]]

The yellow dot in the middle is the planet, with the brown circle being the SOI. Within this, the orbit of a spacecraft is changed by the planet. The formula for the radius of the SOI was developed by Laplace when he was looking at comets passing close to Jupiter.

![[Pasted image 20210218123011.png]]

Because the definition of SOI relies on the presence of the Sun and a planet, the term is only applicable in a three-body or greater system and requires the mass of the primary body to be much greater than the mass of the secondary body.

![[Pasted image 20210218123032.png]]

Check these figures yourself. 150E6 is the distance from Earth to the SUN in km. The distance from Earth to Moon is smaller than the Earth’s SOI, so this means the Moon is within the Earth SOI and we cannot properly use patched conics for calculating trajectories to the Moon.

![[Pasted image 20210218123050.png]]

These are the stages of a classic interplanetary mission. Often a spacecraft will be launched directly into its escape trajectory, as this can then be combined with a plane change to save fuel

![[Pasted image 20210218123109.png]]

## Patched Conics - 4B

![[Pasted image 20210218123156.png]]

![[Pasted image 20210218123206.png]]

The key to patched conics is to treat each stage of the mission as if it were in a separate gravitational "sphere of influence“. In each stage we switch on and off the relevant gravities.

![[Pasted image 20210218123237.png]]

I have put in this table all the stages of the calculation if going from a circular parking orbit to departure from planet 1 (usually Earth). The yellow velocities are heliocentric frame of reference (weirdly, we start with the sun frame first when we are calculating). The green velocities are within the Planet 1 frame of reference.

![[Pasted image 20210218123313.png]]

This is the equivalent table for the arrival at Planet 2 and then transferring into a parking orbit around Planet 2 (circular or elliptical). The yellow velocities are heliocentric and the blue ones are Planet 2 frame of reference.

![[Pasted image 20210218123331.png]]

So excess velocity vinfinity represents the excess velocity over that which is required to escape from the centre of attraction.

![[Pasted image 20210218123350.png]]

Let’s take an example and work it through. Let’s travel from a circular orbit of 1000km of Earth to a Venus circular orbit at 1000km. This involves Earth SOI, transfer ellipse, then Venus SOI. This mission is from an outer planet (Earth) to an inner planet (Venus).

![[Pasted image 20210218123412.png]]

Here are some data we are going to need. Note the difference between the radii of the planets and the semimajor axes.

![[Pasted image 20210218123429.png]]

\[Heliocentric view\] Note that we are travelling in to Venus, so V1=Velocity of Earth wrt Sun, VD=Velocity of spacecraft wrt Sun in vicinity of Earth. V1>VD. At arrival VA=Velocity of spacecraft wrt Sun at Venus. V2 is velocity of Venus wrt Sun. VA>V2.

![[Pasted image 20210218123512.png]]

We can start by calculating the velocity of Planet 1 (the Earth) in its orbit around the Sun: V1. Where r is the distance of the Earth from the centre of the Sun. This is the formula for velocity in a circular orbit (assuming earth’s orbit about the Sun is circular, which is approximately true).

![[Pasted image 20210218123528.png]]

Now we calculate the transfer ellipse semi major axis

![[Pasted image 20210218123542.png]]

Next we calculate the semimajor axis of transfer ellipse (we always start with this for Hohmann transfers). a= (radius of periapse + radius of apoapse)/2. We can also calculate e.

![[Pasted image 20210218123615.png]]

![[Pasted image 20210218123627.png]]

![[Pasted image 20210218123638.png]]

![[Pasted image 20210218123647.png]]

## Patched Conics - 4C

![[Pasted image 20210218123719.png]]

![[Pasted image 20210218123731.png]]

I have put in this table all the stages of the calculation if going from a circular parking orbit to departure from planet 1 (usually Earth). The yellow velocities are heliocentric frame of reference. The green velocities are within the Planet 1 frame of reference.

![[Pasted image 20210218123748.png]]

Now we are in the frame of reference of the planet, so let’s first work out the velocity in the circular orbit we have chosen ‘Vc1’. It could also be an elliptical orbit (which is why I have used the vis-viva instead of the circular formula). 1000km is just an example of an orbital altitude.

![[Pasted image 20210218130019.png]]

\[Planet-centric view\] In order to escape gravity of planet, the spacecraft must travel a hyperbolic trajectory arriving at its sphere of influence with a relative velocity V∞. Although the planet moves with velocity V1, the spacecraft needs to depart in the opposite direction in order to lose velocity to drop into the lower-energy transfer ellipse. Equally the velocity will need to be reduced again at point A to arrive in the lower-energy circular orbit of planet 2.

![[Pasted image 20210218130047.png]]

How do we achieve the initial apogee departure velocity VD? This velocity is in the Heliocentric frame. We need to find the velocity at the beginning of the ascent hyperbola Vf. We have already calculated V∞, so we can use this to calculate Vf. This is the patching together of the ellipse and hyperbola.

![[Pasted image 20210218130108.png]]

![[Pasted image 20210218130119.png]]

We are always interested in the delta V as it will determine our propellant budgets. So here we start in circular orbit and then do a burn of ∆𝑉 to get on to the escape hyperbola. When the spacecraft reaches the edge of the SOI it will be travelling at V∞.

![[Pasted image 20210218130138.png]]

We can do exactly the same thing for the arrival hyperbola at the target planet (in this case Venus). These are the values I have calculated for the second part of the mission. Check them by doing the calculations for yourself, check especially the signs.

## Patched Conics - 4D

![[Pasted image 20210218130218.png]]

We can do exactly the same thing for the arrival hyperbola at the target planet (in this case Venus). These are the values I have calculated for the second part of the mission. Check them by doing the calculations for yourself, check especially the signs.

![[Pasted image 20210218130235.png]]

![[Pasted image 20210218130248.png]]

We can do exactly the same thing for the arrival hyperbola at the target planet (in this case Venus). These are the values I have calculated for the second part of the mission. Check them by doing the calculations for yourself, check especially the signs. I have assumed always putting the destination velocity before the initial velocity eg: Vc2-Vf2. Remember that the delta Vs will be magnitudes anyway for the calculation of the fuel needed.

![[Pasted image 20210218130307.png]]

This is going from an inner planet eg: Earth to an outer planet eg: Mars. How is this different to the one from Earth to Venus? The V∞ is going in the same direction as the planet’s velocity, V1, as we want to increase the overall energy of the spacecraft.

![[Pasted image 20210218130323.png]]

Hohmann transfer from an Inner Planet 1 to an Outer Planet 2. You note that the departure velocity VD=Vs/c wrt sun at earth > V1 (the velocity of the Earth wrt Sun) and the velocity of Mars wrt Sun V2> VA (The arrival velocity of the spacecraft at Mars wrt Sun).

![[Pasted image 20210218130339.png]]

This version of the method of patched conics, we have not even considered the transfer geometry ie: the different planes and angles involved (we will see this next lecture). Nor have we looked at the timing, which all has to be calculated so that the spacecraft arrives at the planet. This is done with a porkchop plot which we will see next lecture. The unknown orbital elements refers to the fact that we might not know e and a for the trajectory we are planning.

![[Pasted image 20210218130356.png]]

![[Pasted image 20210218130409.png]]


