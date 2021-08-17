# Access to Space - Expendable Launchers

---

> Links [[040700 Advanced Space Systems]]

> Contents

---

## Learning Objectives

- Basic launch terminology and the value chain
- Be aware of some history lessons from launchers: UK and Foreign
- See how launch to orbit is currently carried out by Europe (ESA)
- Distinguish the 'small satellite' payload and its launch requirements

### Definitions: Orbital vs Suborbital

![[Pasted image 20210301111803.png]]

Where launch fits in

"Value Chain"

### History

Move on very iterativey

![[Pasted image 20210301112014.png]]

![[Pasted image 20210301112058.png]]

![[Pasted image 20210301112232.png]]

Reusability

![[Pasted image 20210301112434.png]]

![[Pasted image 20210301112736.png]]

Keep requirements as simple as possible ^ unlike space shuttle did with competing govt. agencies.

![[Pasted image 20210301112929.png]]

![[Pasted image 20210301112959.png]]

![[Pasted image 20210301113111.png]]

![[Pasted image 20210301113128.png]]

---

## Learning Objectives

- Be familiar with the core elements of a launcher
- Appreciate some of the technical challenges of staging and other key launch technologies
- Understand launch hazards, air launch and launch sites

### What is a Launch Vehicle Required to do?

- Place the payload in the desired orbit
	- Altitude
	- Inclination
	- ORbital Velocity
	- some other parameters

- Deliver the payload in one piece
	- Limits on acceleration
	- Limits on vibration
	- Provide power if necessary
	- Release payload into orbit

- Perform reliably each time
	- Complex systems -> many things can go wrong
	- Not forgiving when they fail
	- Cant call the AA or RAC

- Provide an economic launch solution
	- Development costs 
	- Manufacturing costs
	- Operations costs

### Derived Requirement: Energy, Thrust

- Delta V
	- Orbital Velocity (plus losses): 9 km/s
	- Energy: $\frac{1}{2} m v^2$

- Thrust: Weight
	- Typically ~1.5 x liftoff mass (=10s or 100s of tonnes)
	- Compared to aircraft with T:W < 1

$$\Delta V = I_{sp} ln \left( \frac{m_i}{m_f} \right)$$

- Vehicle mass breakdown:
	- more than 90% propellant
	- and 5-10% structure
	- 0.5 - 1.5% payload

### Hazards: All Launchers

Are propelled by:

- High energy chemicals which can inadvenrtantly (mix) combust and potentially explode
	- Failed launch: impact risk on populated areas
	- On ground potential for explosion creating
		- Blast (overpressure)
		- Fragments
		- Fireball, Gas Clouds
	
	- Launchers planned for  the UK have at least 10t of these propellants on board - and more at the launch site

### Launch Operations

- Where do you site a spaceport, and why?

	- Launch over ocean, avoiding populated areas
	- Earth rotates West to East
	- Velocity of rotation greatest at equator (benefit)

- Implications for the UK?
	- Safety implictions for international neighbours
	- And international waters, **airspace**

### Rocekts based launch into space

- Ground vertical launch
- Air horizontal launch (AN-225 remember)

	- X-15 as well
	- Virgin Orbit
	- Pegasus

### Staging or 'step' rockets

- if my laucnh mass is fixed, say 100tonnes
- Rockets travelling to LEO

	- Delta V = 8.5 km/s, accounting for losses
- Fixed performance of main engine
- Inert mass = small fixed fraction of propellant mass

What happens if I split the vehicle into multiple 'stages', each one of which is discarded when the propellant is used up?

(just look at KSP lmao)

### Staging in Practice

- A multistage or 'step' rocket is built from a number of seperate small rockets or 'stages' each containing its own propellant tanks and engines
	- Stacked one on top of the other

- Each operates sequentially
- Each is is discarded when empty of propellant, reducing inert mass carried to orbit
	- Apollo 4, saturn V stage separation

Staging = complexity = lower reliability

### Components of a modern large laucnh vehicle: Ariane 5

Facts and Figures:

- 52m high
- 777t on laucnh pad
- Over 20t into orbit
- 150-200 M euro per launch
- 6-10 per year built in Europe wide supply chain
- Non recoverable

- PAyload Fairing

... You can look at rest of stats on slides if u like

### Key Technologies

- Engine and combustions Chamber: Reacts Propellants, generate thrust to accelerate vehicle
- Propellant tanks: store and deliver oxidiser, fuel to chamber
- Nosecone, stage adapters, skirts: Non tank structural components
- Booster rocket: additional thrust for larger payloads
- Avionics set: responsible for Guidance, navigation, control
- Payload adapter: support satellite(s) through launch, disconnect in orbit

### Propulsion: Underpinning tech

Solids, liquids, etc

the materials problem: highest heat/cooling question

the pumping, fluid flow, pressurisation problem
(look at spacex merlin/raptor)

### Structural engineering

Problem:
- Launchers: mostly (90-95%) propellant
- Lightweight containment?

Solutions
- Materials science - composites
- Smart structural engineering (look at can of coke)

(look at atlas, under 5% inert mass fraction)

(ALMOST enough for ssto)

### A modern 'small' launcher: Rocketlabs electron

look at the numbers -> really attactive

Still expendable (same old architecture), despite fancy composites and grown engines, have we really advanced here?

### Not covered today:

- Modern reusable systems
	- Starship
	- Blue origin new glenn
	- Blue origin Shepherd...

### Summary - Technology

- Energetics, makes launch to orbit the most challenging form of current transportation
- We developed 'step' or staged rockets to make reaching LEO feasible
	- We are starting to learn how to recover stages
- Low cost, reliable Propulsion is the most challenging element of a launch system







