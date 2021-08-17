# Patched Conics 4

> Links [[040700 Advanced Space Systems]]

> Contents

## Learning Objectives

- Define and use concept of **'Sphere of Influence'**
- Be able to use **method of patched conics** to calculate the $\Delta$Vs from the orbit of one planet to another
- Be able to describe the differences between patched conics from **inner to outer planets** and vice versa

## Patched Conics Process - A (The KSP Method)

A resonably accurate way of caluclating interplanetary $\Delta$V requirements

![[Pasted image 20210224181612.png]]

The process itself is straightforward:

1. Spacecraft - Earth
	- Circular or Elliptical low-Earth orbit
	- Hypberbolic escape
	- Geo-centric, equatorial coordinate system
2. Spacecraft - Sun
	- Elliptical Transfer orbit
	- Helio-centric, ecliptic coordinate system
3. Spacecraft - Target
	- Hyperbolic arrival
	- Circular or Elliptical orbit
	- Target-centric, equatorial coordinate system

### Sphere of Influence

$$R_{SOI} = a \left( \frac{m_P}{m_S} \right)^{\frac{2}{5}}$$

Where:
- $R_{SOI}$: radius of sphere of influence
- $a$: semimajor axis of planets motion around larger body
- $m_P$: Mass of planet
- $m_S$: Mass of Sun

## Patched Conics - B

3 Parts of patched conics process:
1. Geo-centric Hyperbolic escape
2. Helio-centric Elliptical transfer
3. Target-centric Hyperbolic arrival

### Parking Orbit $\rightarrow$ Departure from planet 1

| Step | To Calculate   | Description                                                |
| ---- | -------------- | ---------------------------------------------------------- |
| 1    | $V_1$          | velocity of the first planet around the sun                |
| 2    | $a_{trans}$    | semi major axis of transfer ellipse                        |
| 3    | $V_D$          | spacecraft velocity w.r.t. the Sun departing from planet 1 |
| 4    | $V_{\infty 1}$ | hyperbolic departure velocity from planet 1                |
| 5    | $V_{c 1}$      | velocity of spacecraft in planet 1 parking orbit           |
| 6    | $V_{f 1}$      | velocity of Earth escape hyperbola                         |
| 7    | $\Delta V_1$   | $\Delta$V from parking orbit to escape hyperbola                                                           |

### Arrival at planet 2 $\rightarrow$ parking orbit

| Step | To Calculate     | Description                                             |
| ---- | ---------------- | ------------------------------------------------------- |
| 1    | $V_2$            | the velocity of the second planet around the Sun        |
| 2    | $a_{trans}$      | semi major axis of transfer ellipse                     |
| 3    | $V_A$            | spacecraft velocity w.r.t. the Sun arriving at planet 2 |
| 4    | $V_{\infty 2}$   | hyperbolic arrival velocity at planet 2                 |
| 5    | $V_{f2}$         | velocity of planet 2 approach hyperbola                 |
| 6    | $V_{c2}$         | velocity of spacecraft in planet 2 parking orbit        |
| 7    | $\Delta V_2$     | $\Delta$V from approach hyperbola to parking orbit      |
| 8    | $\Delta V_{tot}$ | total $\Delta$V                                                        |

## Example: Venus Mission

Earth Orbit (1000km) to Venus Orbit (1000km)

Ingredients:
- $\mu_{sun} = 1.33 \times 10^{20}m^3s^{-2}$
- $\mu_{earth} = 3.986 \times 10 ^{14} m^3 s^{-2}$
- $\mu_{venus} = 3.24859 \times 10^{14} m^3 s^{-2}$
- Radius of Earth = 6378170m
- Radius of Venus = 6051800m
- Earth orbit semi-major axis = $1.496 \times 10^{11}$m
- Venus orbit semi-major axis = $1.0821 \times 10^{11}$m

![[Pasted image 20210224183815.png]]

1. $V_1 = \sqrt{\frac{\mu_{sun}}{r_{earth}}} = 29817$ m/s
2. $a_{transfer} = \frac{r_{earth} + r_{venus}}{2} = 1.289 \times 10^{11}$ m, $e_{transfer} = \frac{r_a - r_p}{r_a + r_p} = 0.1605$
3. $V_D = V_{apoapsis} = \sqrt{\left(\frac{2\mu_{sun}}{r_{earth}}\right) - \frac{\mu_{sun}}{a_{transfer}}} = 27318$ m/s
4. $V_{\infty 1} = V_D - V_1 = -2.498 \times 10^3$ m/s (negative as outer to inner planet)
5. $V_{c1} = \sqrt{\left(\frac{2 \mu_{earth}}{r_p}\right) - \frac{\mu_{earth}}{a}} = 7350 m/s$
6. $V_{f1}^2 = V_\infty^2+V_{esc}^2 = \sqrt{V_\infty^2 + \left( \frac{2 \mu_{earth}}{r_{park}} \right)} = 10691$ m/s
7.   $\Delta V = V_{f1} - V_{c1} = 3341$ m/s

Then we do the inverse for the arrival at venus! :)

