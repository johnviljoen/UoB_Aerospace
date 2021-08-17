# Science Missions

> Links [[040700 Advanced Space Systems]]

> Contents

## Introduction and Learning Objectives

- Background to, and details of, scientific space missions
- Focus on:
	- Engineering
	- Recent Examples
- Afterwards you should be able to
	- Understand te big scientific questions that drive these missions
	- List the types of scientific space mission
	- Define how mission requirements follow from scientific questions
	- Discuss how engineering and science work together in scientific space missions
	- Explain some of the factors affecting selection
- We will **not** cover
	- Earth observation (too much material)

## The big motivating questions

1. What are the origins of the Universe?
2. Are we alone in the Universe?
3. How are planetary systems formed, and how do stars interact with them?
4. How do we know our underlying scientific theories are correct?

**We will link these questions to specific space missions and their requirements**

![[Pasted image 20210227121649.png]]

## Scientific space missions: four types

1. Astronomy (telescopes in space)
	- Deep Space
	- Exoplanets
2. Solar System
	- Planets
	- Comets
	- Asteroids
3. Heliospheric Environment
	- The Sun
	- Space Weather
4. Fundamental Physics
	- Testing Theories

### 1. Origins of the Universe

- "**Big Bang**" **theory**: The universe was formed in an event 14 billion years ago
- Important evidence for the Big Bang theory:

1. **The Universe is still expanding**, as described by Hubble's law

$$v = H_0d$$

$v$: relative velocity of an object
$d$: distance away from us
$H_0$: Hubble's constant (70 km/s/Mpc)

![[Pasted image 20210227122035.png]]
	
2. "Left over" radiaion from the big bang can be detected as the **cosmic microwave background**
	- Wein's law states the peak emission wavelength o an object is related to its temperature, so cold objects emit at a long wavelength
$$\lambda_{\text{peak}} = \frac{2.898 \times 10^{-3}}{T}m.K$$
	- There is a (fairly) uniform microwave signal at 1mm, first detected in the 1960's
	- This is consistent with the remnants of the early expansion of the universe

![[Pasted image 20210227122521.png]]

## Looking back to the Early Universe

- "Redshift", caused by the Doppler effect, means light from objects moving away from us is shifted towards the red part of the electromagnetic spectrum
	- This redshift can be used to measure velocity (assuming Hubble's constant)
- The further away we look, the further back in time we see
- Astronomy missions often observe in the infra-red and microwave wavelengths
- Requirements:
	- Distant (early Universe) objects are faint -> sensitive detectors needed
	- Measuring velocity through small changes in wavelengths -> high resolution detectors needed
	- Compromises between sensitivity and resolution (sensors and signals 3 remember) (ofc u dont lmao)

## Orbits for astronomy missions

preferred spot for aastronomy mission is L2

![[Pasted image 20210227123009.png]]

Relatively close to Earth and light from sun blocked by Earth. Still need thermal shields but yes. 

Simlarly L1 is good to look at Sun!

## James Webb Space Telescope (JWST)

- Successor to Hubble
- Mainly infra-red instruments, to study when the Universe first 'lit up'
- L2 orbit
- Technically ambitious
	- Biggest sunshield ever, to keep payload cool
	- Biggest mirror in space, to provide sensitive measurements
	- 10 new technologies needed
- Problems
	- Uniquely complex, estimates of cost and time incorrect
	- Testing: too much slack in cables, incorrec materials used etc
- Risk mitigatiion through launch delays: Current plan is 31/10/21

---

## 2. Are we Alone in The Universe?

- Exoplanets are planets outside our Solar System, first detected in 1992
- 4100 confirmed - Feb 2020
- 4241 Feb 2021
- Many current and planned space missions are searching for exoplanets
- **Could and exoplanets be like Earth or have life?**

### Habitability - where could life be supported

- Astrobiology - life elsewhere in the universe
- Assume life needs liquid water
- A 'habitable zone' is the region where liquid water could be present - planets have to be just the right distance from their host star
- Habitable zone depends on the temperature of the host star -> exoplanet missions

Star must also be right size, not too small then tidally locked in habitable zone, not too big then star lives too short for life to evolve probably.

- Habitability isnt constant -> look for past as well as present life

### Life within our solar system

- Landers and orbiters on Mars have:
	- Shown that liquid water existed in its warmer past
	- Hinted that there might once have been life
- Sub-Surface oceans at some planetary moons may also be habitable - potentially support microbial life
	- Europa (moon of Jupiter) - ocean which may be heated by hydrotherma vents (deduced from magnetism observations)
	- Enceladus (moon of Saturn) - geophysically active with plumes, and a sub surface ocean deduced from its gravity field and libration (wobbles) in its orbit
- Missions searching for life typically look for:
	- Chemical signatures (in situ or remote sensing)
	- Geological signatures (usually in situ (fossils))

### Astrobiology-motivated mission: ExoMars

- Joint European/Russian mission searching for signs of past or present life on Mars:
	1. Orbiter and lander (2016)
	2. Rover and static surface platform (2022)
- Trace Gas Orbiter (2016)
	- main aim to remote sense chemical signals of life, particular methane
	- Launched 14 March 2016 by a Proton rocket from Baikonur, carrying
- Schiaparelli: Entry, Descent and Landing Demonstrator
	- Instrumentation
		- To measure performance during descent
		- Atmospheric science e.g. trace gasse, electric fields
	- Landing attempted on 19 October 2016
		- Failure due to spinning after parachute deployment saturating sensors and giving incorrect altitude reading, causing engines to switch on and off too soon
		- Crashed at terminal velocity, site later imaged

### Exomars 2022

- Rover (Rosalind Franklin) and surface platform
	- Launch 2022 in a carrier module from a proton rocket, with a descent module (DM) for landing via parachute
	- Orbiter is communiation relay
	- Carries drill for rock sampling plus Russian/European scientific payload
		- Cameras (including inside drill)
		- Instruments to determine chemical composition of rock samples
	- Landing site selection driven by a combination of constraints
		- Scientific constraints: Must be geologically diverse, and once have been habitable
		- Engineering constraints: Needs enough atmosphere to effectively slow down its descent, so must be in a low-lying area. Must not contain features that could endanger the landing, such as many craters, steep slopes, and large rocks
		- Landing controlled by radar and rockets

## How are Planetary Systems Formed?

- The Solar System formed from a planetary nebula around 4.5 billion years ago
- Because Earth has changed a lot in that time, we need to turn to other solar system objects to understand its origins 
- The moon is one such object – a lot can be learnt from its craters 
- Some asteroids and comets are also “primordial” objects, with ancient composition from the early solar system 
- These objects were formed a long way away from the Sun and haven’t got hot, or been in collisions, so their composition is a record from the formation of the solar system 
- Motivates comets and asteroid missions

### Understanding Comets and Asteroids

- Scientists want to understand the detailed compositions of these objects, and link it ack to the formation of the solar system
	- Remote sensing - analysis of the light emitted/reflected from their surfaces, called **spectroscopy** (infra-red or visible)
	- Landers - in situ instrumentation: cameras, spectroscopy and material analysis
- Materials made up of different isotopes ("version of the same element with different masses") give clues to the origin of the object.
- Scientists want to measure these **isotopic ratios**, requiring very sensitive **mass spectrometry**

### Mission to a Comet (Rosetta)

- Example: Rosetta mission to Comet 67P/Churyumov-Gerasimenko
	- Orbiter and lander (Philae) shared payload of 21 instruments
	- Launch 2004: instruments hibernated for 10 years
	- 2014 approach needed to be careful because of fast moving comet: reduce relative velocities to walking pace
		- Mapping orbit (30km) slowly moving to a rendezvous orbit (10km)
		- During this time a landing site was chosen
	- Lander had harpoons, ice screws to secure it and a thruster to push against recoil as it was secured.
	- Surface was too hard for ice screws, thruster failed and harpoons didnt deploy
	- Bounced to non-ideal site with limited life, but much valuable data still gathered.

### Sample Return Missions

- Riskiness of landing on an object, and analysis required, justify sample return missions. These allow much more detailed study than a spacecraft instrument
- Missions so far:
	- Japanese Hayabusa (2203) returned 1500 grains (<1mg) from Itokawa
	- Hayabusa-2 (2014) returned samples from Ryugu 10/12/20
	- OSIRIS-Rex (2016) on its way to Bennu
- Hayabusa-2 mission concept
	- Fired an impactor into the asteroid to make a crater and enable sub-surface sample return
- Sample mechanisms
	- Particles 'wafted' into the collector by gas or collision
	- Only 'Touch and go' used so far

## Understanding Our Host Star -> Sun and Space Weather Missions

### Why Study the Sun and Space Weather?

- Earth sits in the Heliosphere - the region of influence of the Sun
- The Suns magnetic field protects the Solar System from cosmic rays. (Earth has its own magnetic field which protects us too)
- Why study the Sun and the inner Heliosphere?
	- Space Weather (rapid fluctuations in material emitted by the Sun) can affect space and ground-based communications and power systems
		- March 13 1989: 12 hour power cut in Quebec from a solar storm
	- Understanding the suns slower variations, such as its 11-year cycle, may help explain variations in weather and climate on Earth
	- The Sun is our nearest star, which can observe relatively easily
	- The Sun is a 'real life' plasma physics lab demonstrating many processes that are difficult to investigate on Earth

### Solar mission: Parker Solar Probe

- NASA mission launched 12 August 2018
- Highly elliptical orbit: 7 Venus flybys used to get closer to the Sun
- Thermal Engineering:
	- Heat shield will get to 1500 C: 115mm thick composite. Cool side 30 C
	- Electronics: sapphire crystal tubes with niobium wires
	- Solar panel protection: main solar panels retracted
	- Coolant System: pressurised deionised water to cope with 10-125 C range
	- Autonomous Control: Sunlight sensors on cool side
	- New tests devised with particle accelerators, solar furnace etc
- Where is PSP Right now?
	- Check out the site: parkersolarprobe.jhuapl.edu
- Similar mission European Solar Orbiter, Launched 10 Feb 2020

### Monitoring Space Weather

- Problems with solar storms
	- Large solar flares can change th Earths ionosphere, blocking high-frequency radio transmissions on the sunlit side of the Earth
	- Some large flares are accompanied by strong radio bursts that cause interference problems for satellite communication and GPS
	- The solar wind can push the edge of earths magnetic field inside geosynchronous orbit. Can be important for spacecraft operations
- The Geostationary Operational Environment Network (GOES) officially started in 1975 (precursors in 1960s) principally for earth observation, but also including space weather
- Now a sophisticated real-time space weather data system, monitoring energetic particles and magnetic fields with storm alerts issued automatically
- See e.g. spaceweatherlive.com

## How do We know Physics is Right?

- Fundamental physics missions aim to test theories underpinning our understanding of the universe
- Example: the **equivalence principle**
	- Way to think about the mass of an object
	1. Acceleration due to gravity $F = \frac{GMm}{r^2}$
	2. Inertia i.e. resistance to pushing $F=ma$
- The equivalence principle is the assumption that $m$ is the same in these equations
- its important - general relativity is built upon this principle. We need to keep testing it.
- What are the limitations to testing the equivalence principle on Earth?
	- Moon Lander video

### Equivalence principle missions

- Use a 'test mass' made of different materials in 'free fall'. Equivalence principle predicts that there should be no difference in their acceleration
- Test masses must be totally protected from other forces
	- cryogenic dewar with superconducting shielding and ultra-high vacuum
	- **"drag free" satellite**, i.e. proportional cold-gas (helium) thrusters, using the test masses as reference, compensate for drag, magnetic field and solar radiation pressure
	- no moving parts, except thrusters, to keep errors to a minimum
- Sun-synchronous orbit minimzes the temperature variations and eclipse periods
- French Microscoper mission launched 2016
	- first results published Dec 2017
	- so far the equivalence principle is correct
	- Passive de-orbit Octorber 2018

### Factors controlling development of scientific space missions

- Technical Factors:
	- Scientific questions
	- Engineering possibilites
- Non-technical factors:
	- Political Drive / national ambitions (usually linked to funding)
	- Perception of Novelty versus TRL
	- Well-argued case

## Summary

- Many space missions, and all interplanetary missions so far, are designed around scientific objectives linked to **big questions**
	- non-technical factors also significant
- Big questions have always troubled humans:
	- Origins of humans
	- Are we alone?
	- Solar system origins and interactions with host star
	- Trust in underlying physics theories
- Science questions drive selection of missions destinations and payload, defining engineering issues such as mass limits and orbits
- Iterative interactions between scientists and engineers required throughout wholle lifecycle.

