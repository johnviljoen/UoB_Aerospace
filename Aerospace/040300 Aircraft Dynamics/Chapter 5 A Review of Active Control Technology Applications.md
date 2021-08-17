# Chapter 5: A Review of Active Control Technology Applications

> Links [[040300 Aircraft Dynamics]]

> Contents

The core of the control work comes here in chapter 5

We review nature of control systems and what they are intended to achieve.

we look at short term control shenanigans and not the navigational longer term stuff

The first recording is just background information. Nice and calm

## 5.1 Motivation and Aims of Active Control Systems

- increased performance
	- Manoeuvrability
	- Agility
	- Speed
- reduced weight or size or fuel consumption
- Improved operation
	- Reduced pilot workload
- Increased mission effectiveness
- Reduced life cycle cost

---

Depending on the role of the air vehicle system each of these considerations will be given different weighting and thereby dictate the configuration and type of systems employed

The term *air vehicle system* is used here because the aircraft must be seen not as the totality of the requirement, but rather as one means or part of achieveing some mission or set of missions within a total system.

For example a civil aircraft is part of the air transportation system and must fit in with the requirements of that system in terms of its operation.

A military aircraft may have quite specific mission which it is designed to fulfil to contribute to some wider plan.

An aircraft may be just one of a number of methods of achieving this. Its subsystems must in turn be seen as enhancements to the aircrafts effectiveness in its design role.

---

## Definitions and Descriptions

### Manoeuvre Demand System:

A control system which seeks to ensure that the aircraft responds in a desireable manner to the pilots demands, by constant tracking of the response and regulation of the control demands.

An example is the pitch rate demand system of the F/A18

A system of this type may well improve pilot handling qualities and make them more consistent over the flight envelope

![[Pasted image 20210315104721.png]]

### Stability Augmentation System (SAS):

- A control system which is designed to achieve closed loop stability on a system which is open loop unstable, or to augment the stability where it is deficient.
- most common reason for designing an aircraft to be unstable is to reduce trim drag and weight

An SAS is often combined with a manoeuvre demand system

### Direct Lift Control:

- A type of manoeuvre demand system in which control surfaces or thrust vectoring  is used to achieve a force normal to the longitudinal axis
- Direct lift control can produce vertical accelerations without a pitch response procuding a *decoupled manoeuvre*

Less interest in this concept after the AFTY F16 programme which experimented with this idea and found that the pilot reaction was unfavourable. Elements of decoupled manoeuvring control underlie some of the concepts for advanced short take off vertical landing (ASTOVL) aircraft.

### Direct Sideforce Control:

This concept is similar to direct lift control except that lateral forces and accelerations are produced.

This was also investigated in the AFTI F16 program and found to be of some use in the ground attack role.

### Gust Alleviation System (GAS) or Ride Control System:

These systems reduce the mean level of g excursions due to gusts at a particular aircraft position. Other positions in the aircraft may suffer a worse gust response as a result.

Often these desireable for military aircraft required to fly low level missions where turbulence level can cause excessive pilot fatigure and must be relieved.

---

A typical method of achieveing this is illustrated below. Here the incidence due to the gust is estimated and used to apply a control input which attempted to cancel the lift which will be caused by the gust.

![[Pasted image 20210315105339.png]]

From a theoretical point of view this type of  *gust cancellation system* is trying to effect an open loop control over the gust generated lift since the response of the aircraft is not being measured and fed back.

In practive, lags and flexible dynamics of the aircraft can lead to problems with the performance and stability of the scheme.

---

### Gust Load Alleviation Systems (GLA)

In these systems structural load parameters on the aircraft, usually including wing root bending, are reduced when a gust hits the aircraft.

This can be achieved by using symmetric deflection of the ailerons and/or spoilers. The latter suffer from the problem that they are only effective in one direction. The Airbus A320, for example, uses a spoiler gust alleviation system.

Theoretically a system geared to normal acceleration responses will always be active and this may lead to an undesireable level of control surface activity. For example, excessive deployment of spoilers may be aerodynamically inefficient. Sometimes to overcome this a 'dead band' is included in such systems so that the feedback measurement must reach a certain threshold before the system responds.

---

Practically, it is always easier to use a fuselage mounted normal acceleration measurement. However this may not include sufficient indication of the structural dynamics of the aircraft response.

Thus excessivley rapid removal of the control surface deployment based on the fuselage measurements may result in a higher second peak (rebound) structural response.

Non-linear logic in holding the surface deployment for a short period may be used in an attempt to overcome this

---

### Manoeuvre Load Alleviation Systems (MLA)

These systems redistribute the loads on the aircraft during a manoeuvre to reduce local peak loads. They could be implemented by means of an open loop control with no feedback applied.

![[Pasted image 20210315110345.png]]

Studies indicate that to be effective in reducing design loads significantly both GLA and MLA systems must be used together.

---

### Flutter Suppresion Systems (FSS)

These systems prevent flutter by applying a control force to counteract unwanted motions. This allows an increase in the aircraft flutter speed.

In the civil aircraft field the main aim would be to reduce weight. In military aircraft the advantages may be seen more in terms of flexibility to carry a wide range of stores as external loads, without imposing envelope limits, rather than weight reduction.

There are virtually no practical systems in use to date (the Boeing 747-8 is a possible exception), perhaps because flutter is a more complex phenomenon than static stability, and divergence rates and the natural frequencies to be controlled are much more rapid.

It is likely that early practical systems will be used to allow flight closer to the flutter boundary rather than in the unstable region.

---

Northrop in the USA have demonstrated an adaptive control system on a wind tunnel model. This system works by sensing the system's characteristics and determining its own control law to stabilise the system.

The certification and application of this type of system for widespread use seem a long way off at present.

![[Pasted image 20210315111320.png]]

![[Pasted image 20210315111336.png]]

---

### Envelope Limiting Systems

These systems are designed to prevent the pilot inadvertently exceeding flight envelope limits. These limits can be quite complex and monitoring them can add to pilot workload at time of peak activity.

The Tornado has a system of this type, and the A320 has an incidence limiting system. The F/A18 incoroporates a spin prevention system. Most newer fly-by-wire (FBW) systems incorprorate envelope protection, many purpoting to provide 'carefree handling'.

Limiting of displacement quantities such as incidence may be difficult in a dynamic manoeuvring situation. The inertia of the aircraft must be taken into account as it approaches the limit otherwise large overshoots can occur.

Nonlinear effects introduced by such control systems must be carefully examined to ensure they do not introduce other problems.

Rigorous testing and theoretical evaluation may be required. This is one reason why envelope limiting systems which cannot be disabled are not universally accepted.

## Recent and Current Active Control Programmes

Many recent programmes have used or require active control systems. Some of these are listed below.

**A320** incorporates a manoeuvre demand and gust load alleviation system.

**AFTI F16** as indicated above this programme investigated direct lift and side force decoupled mode control.

Conventional manoeuvre control systems were also examined.

Later work looked at air to ground integrated flight and fire control (IFFC) systems in which the aircraft trajectory was controlled automatically during the weapon arming and release phase.

![[Pasted image 20210315112025.png]]

The AFTI F16 is shown with its additional canted canards which allowed for vertical and sideways control

---

**Euro ACT** was a collaborative helicopter programme with Agusta, Aerospatiale, MBB and Westland Helicopters to produce demonstration ACT helicopters with improved agility and handling.

Problems with this sort of control exist in defining the rotor system dynamics at high frequencies.

Multivariable control laws are required to achieve good decoupling between the various degrees of freedom in the helicopter's response

**Experimental Aircraft Programme EAP** was a demonstrator aircraft for the European Fighter Aircraft (subsequently renamed the Eurofighter Typhoon). The aircraft was unstable and incorporated a fly-by-wire stability augmentation pitch rate manoeuvre demand system.

![[Pasted image 20210315112330.png]]

**Eurofighter Typhoon**. This aircraft was longitudinally unstable and has a control system developed from the EAP design

**F/A18**. This aircraft incorporates a manoeuvre demand system with stall and spin prevention.

![[Pasted image 20210315112444.png]]

**High Alpha Research Vehicle (HARV)**. This was a NASA programme which utilised a modified F/A18. The main purpose of the programme was to investigate high alpha aerodynamics; however, to be able to fly at up to 85 degrees of incidence, thrust vectoring and an advanced control law were required.

In parallel with this flight programme a ground based simulator control law design investigation was carried out, to examine more sophisticated design methods.

![[Pasted image 20210315112647.png]]

**IFFC F15**. This incorporated an advanced air-to-air integrated flight and fire control system. Reports indicate that the system was successful in reducing pilot workload.

![[Pasted image 20210315112740.png]]

**IFPCS**. This was the UK Integrated Flight and Propulsion Control System project, contributing to the US/UK ASTOVL programme. The intention was to examine control systems that integrate engine control las with the flight control. Dynamic working line variation to improve surge margins and cruise efficiency were evaluated. Variable cycle ASTOVL engines were also considered.

**Active Flexibile Wing Programme.** In the flexible wing concept the control surfaces act as a servo tabls to twist the wing to produce rolling moments. In this case control reversal was designed into the wing to effect the twist required. The USAF investigated the flexible wing concept and NASA investigated advanced flutter suppression control laws, using a dynamically scaled flexible wind tunnel model, built by Rockwell, which was allowed to rotate about its sting

**SRA**. This was the NASA F/A18 System Research Aircraft. It was used to investigate various systems concepts such as advanced actuators with built-in hydraulic pumps and electric actuators. The actuation system experiments were part of the move towards aircraft which have electrical power distribution to the control surfaces. This is isaid to be more efficient in terms of overall weight, improve engine efficiency by reducing power off-takes and reduce maintenance. It remains to be seen whether the weight and power density of such system will produce the required benefits.

**Jaguar Fly-By-Wire.** A demonstrator aircraft for flightworthy full time autostabilisation system. The programme led on to the EAP.

**MATV**. This is the USAF Multi-Axis Thrust Vectoring F16. The programme has investigated in-flight thrust vectoring and high incidence manoeuvring using the aircraft.

![[Pasted image 20210315113524.png]]

**STOL F15**. This aircraft had a novel vectoring rear engine nozzle to improve short take-off and landing performance. It had a control system which integrated vectoring and engine control with flight path control during landing.

**VAAC Harrier** (VAAC: Vectorec-thrust aircraft Advanced Flight Control)

This was a research aircraft at QinetiQ Boscombe Down to support the joint US/UK agreement directed towards an ASTOVL aircraft (now known as the Joint Strike Fighter, JSF; the Lockeed Martin F-35 was selected from the competitive 'fly-off' against the Boeing F-32 in 2002).

The aim was to investigate control systems to improve controllability and pilot workload in the low speed transition and hover flight phases; it was included research into integrating nozzle commands within the pithc control inceptor.

The aircraft was tested with longitudinal and lateral feedback control laws (including novel and modern robust control systems).

![[Pasted image 20210315113907.png]]

**X-29**. This forward swept wing aircraft incorporated a stability augmentaiton system. Owing to programme constraints and technical problems the control system investigation components of this programme were limited.

![[Pasted image 20210315114013.png]]

**X-31**. This was a US/German high alpha programme focussing on the tactical use of high incidence manoeuvres. It incorporated multi-axis paddle-type thrust vectoring.

![[Pasted image 20210315114102.png]]

---

# Part 2

Apparently the most important part of the control section of the unit

We will focus on longitudinal control but there will be a coupole of slides at end on lateral

## Types of Feedback In Aircraft Manoeuvre Control

There are several options available in deciding the parameters which should be the key feedbacks for control of an aircraft. The parameters selected will depend on the role of the system.

For example an autopilot may use a feedback of speed since this is one of the parameters over which it is desired to have some control. However, since speed remains more or less constant in the short period response, it cannot provide any significant control of longitudinal stability or damping.

Often the feedback of a parameter can be regarded as enhancing an aerodynamic derivative, e.g. feedback of incidence to the elevator will effectively increase $C_{m_\alpha}$

The feedback parameters can also be modified by some dynamic elements, e.g. an integrator, to influence the overall response.

The main feedbacks and their effects are summarised below.

## Longitudinal Control

Longitudinal response is controlled by the elevator (or similar devices), thus the transfer function of the responses to elevator is an important consideration. The full longitudinal transfer function for pitch angle response to an elevator is:

![[Pasted image 20210315114851.png]]

where:

- $\omega_{ph}$	is the phugoid frequency
- $\zeta_{ph}$ is the phugoid damping ratio
- $T_{\theta_1}$ is the phugoid numerator time constant
- $A_\theta$ is the pitch gain for the full transfer function

The pole and zero values for a typical conventional aircraft can be illustrated on an Argand diagram:

![[Pasted image 20210315115051.png]]

For a longitudinally unstable aircraft, the transfer function is:

![[Pasted image 20210315115112.png]]

and the root positions are:

![[Pasted image 20210315115133.png]]

The **oscillatory mode** often has:
- long phugoi-like *period*;
- short-period-like *damping ratio*
- Often referred to as '*third oscillatory mode*' of a statically unstable aircraft

Pitch Angle to Elevator. 

This scheme is used in early autopilots. Since pitch angle is fed back the elevator moves to oppose any pitch angle errors.

Since the phugoid mode has a relatively large pitch angle response the effect is to increase the phugoid damping whilst reducing the short period damping. This is acceptable in aircraft where there is already a good short period damping ratio.

The damping of the phugoid provides a crude autopilot function since speed and height variations due to the phugoid are damped.

The block diagram for the system and the root locus is:

![[Pasted image 20210315115333.png]]

With this feedback the aircraft will not achieve the desired steady state pitch angle, therefore an **integral term** may be added to ensure true attitude hold is achieved.

![[Pasted image 20210315115426.png]]

When the short period has a low damping ratio, pitch rate feedback may be used to increase the damping (see below).

***u* to the Elevator:**

Will increase phugoid damping in similar manner to pitch angle feedback.

**Altitude to Elevator:**

Although altitude hold is often desirable, simple altitude feedback usually destabilises the phugoid mode. 

To overcome this it may be combined with an attitude control which increases the phugoid damping. The altitude control can then be applied to reasonable gain levels without destabilising the system.

**Pitch Rate to Elevator:**

This injects a moment which opposes the pitch rate i.e. a pitch damping. Effectively it increases the value of the derivative $M_q$ which is an important parameter in the short period damping ratio equation derived in Chapter 2. 

It therefore increases the short period damping:

![[Pasted image 20210315115723.png]]

It cannot stabilise a longitudinally unstable aircraft, as can be seen from the root locus:

![[Pasted image 20210315115850.png]]

The pitch rate sensor is a **gyroscopic device**, i.e. it measures inertial angular rate about the pitch axis. 

Care must be taken with inertial devices to avoid feeding back signals from the structural vibrations of the airframe. 

Recall that at a structural node there is rotation and not displacement, and vice versa at an anti-node … hence a good place to mount an angular rate sensor could be at an anti-node of the dominant structural mode. 

Filters are often used to remove noise and to cancel structural mode responses.

**Integral Pitch Rate Plus Pitch Rate to Elevator:**

This a proportional integral (PI) feedback of pitch rate, and forms the core of many modern longitudinal manoeuvre demand and autostabilisation systems. 

The $q$ feedback adds damping whilst the integral term ensures the pilot’s commands are interpreted as pitch rate demands. 

The integral $q$ feedback can also be interpreted as a pitch attitude demand (see above) but since it is combined with added damping the result is a stabilising system.

The PI pitch rate controller has the equation:

$$
\frac{\eta}{q_e} = G_p + \frac{G_i}{s}
$$

Which can be rewritten as:

$$
\frac{\eta}{q_e} = G_i \frac{\frac{G_p}{G_i}s + 1}{s}
$$

which is of the form

$$
\frac{\eta}{q_e} = G_i \frac{(T_qs + 1)}{s}
$$

Thus the PI controller introduces another zero into the open loop transfer function. This allows the system to stabilise a longitudinally unstable aircraft, as shown in the root locus:

![[Pasted image 20210315120352.png]]

Also, in a steady banked turn the aircraft experiences a pitch rate given by $q=r\tan(\phi)$.

Therefore, some correction may be required in turns by subtracting this term from the pilot’s demand as illustrated in the following block diagram.

This is also beneficial with pure $q$ feedback.

![[Pasted image 20210315120444.png]]

**$\alpha$ to Elevator**

In idealised cases this will correc tinstability, however there are practical problems in measuring $\alpha$

Measured by
- small **vanes** mounted on the side of the aircraft forebody; or
- a pressure driven (pitot-static) **air data sensor**

Sensor is located and calibrated to account for local flow effects and provide measurements of the freestream $\alpha$ over a range of flight conditions.

Two sensors may be used, located either side of the fuselage – provides redundancy AND averages out errors due to sideslip. 

However, signal from $\alpha$ sensor usually **noisy** as a result of turbulence; also pitot-static measurements in particular may suffer lags in response.

Because of the difficulties obtaining accurate noise-free measurements that respond quickly to changes in incidence, $\alpha$ feedback is often avoided. When it is used, a noise filter is usually applied to the feedback signal.

$\alpha$ feedback often used in conjunction with pitch rate feedback. 

The usual PI pitch rate autostabiliser stabilises with respect to the inertial space, whereas the $\alpha$ feedback controls relative to the wind direction or wind axes, and thus gives a more usual ‘weathercock’ stabilising effect.

It is sometimes used for landing phases where a more ‘normal’ attitude response is desirable (e.g. EAP).

Incidence feedback may also be used to provide an $\alpha$ limiting function in the control system.

**Vertical Acceleration to Elevator**

Similar to $\alpha$  feedback since the transfer function for $n_{cg}$ is similar to that for $\alpha$  (see notes on the short period transfer function). Must be used with caution since accelerometers pick up structural vibration modes. Also, undesirable small zero offsets are caused by changes in pitch angle caused by climbing, trimming, etc. In addition it is generally accepted that pilots prefer pitch rate manoeuvre demand systems to a vertical acceleration demand system for normal manoeuvring at lower speeds. However, at high vertical accelerations it is desirable to include an element of vertical acceleration control to improve pilot handling qualities, and to provide envelope limiting control.

**Integral Vertical Acceleration + High Pass Filtered Pitch Rate to Elevator**

This will stabilise an unstable aircraft. Since there is an integral vertical acceleration term in the controller, the pilot’s commands are interpreted as vertical acceleration demands.

The high pass filter on the pitch rate feedback allows high frequency pitch rate responses to be fed back, giving a damping effect. The low frequency content of the $q$ signal is then blocked, preventing it influencing the response.

![[Pasted image 20210315121006.png]]

## Lateral Control

**Roll Attitude to Aileron**. This is used by autopilots to achieve a higher degree of spiral mode stability. 

**Roll Velocity to Aileron.** This augments the roll damping derivative Lp and acts to damp the Dutch roll. 

**Heading Angle to Rudder**. Used in autopilots to steer the aeroplane by small amounts. However, high gains can be destabilising and so generally only low gain low bandwidth systems are practical.

**Yawing Velocity to Rudder**. This acts as a classical yaw damper for improving the Dutch roll characteristics. However, in a steady turn this will tend to oppose the required yaw rate. To overcome this, the yawing velocity is passed through a high pass filter to eliminate its steady state effect.

![[Pasted image 20210315122729.png]]

**Sideslip Angle to Rudder.** This is generally used to improve turn coordination as it serves to minimise sideslip.

## Example Control Laws - EAP

This is basically a *pitch rate feedback manoeuvre demand system*, but is *modified by vertical acceleration feedback at high g*, and *some incidence feedback*.

Consider first the path from the stick through node 2 to the direct foreplane and flap gains, ignoring for the time being the path through the integral gain. 

At node 2 the actual pitch rate is subtracted (with a sign reversal to allow for sign conventions) from the demanded pitch rate.

The pitch rate error is then fed via gains to the control surfaces. 

Note that these gains mean that the surfaces are effectively geared together.

![[Pasted image 20210315122908.png]]

Feeding back pitch rate in this way will primarily augment $M_q$ since surface deflections produce an extra moment dependant on $q$.

This will improve damping as a moment is produced opposing the pitching angular velocity. 

However, since static instability implies a negative pitch stiffness, additional feedback is required to give stability. This is provided by the integral compensation, which produces an implied pitch angle feedback which will augment the pitch stiffness. This term also reduces pitch rate error to zero, thus producing a pitch rate command *tracking* or manoeuvre demand system.

![[Pasted image 20210315122958.png]]

Consider now the aerodynamic characteristics of the canard itself

![[Pasted image 20210315123028.png]]

The canard is more effective than the flap at high $\alpha$ → desirable to reserve its operation for high incidence control. 

However …

the proportional feedback through nodes 3 and 4 reduces to zero if a steady state zero error condition is reached. Thus this path need not be considered in arranging the incidence scheduling of the system at a given flight condition.

Incidence scheduling of the control surfaces is achieved by adding an incidence signal to the integral feedback term at node 5.

This incidence signal is a non-linear function of incidence and causes a larger demand at higher incidences.

In combination with the nonlinear trim distribution functions this causes the demand on the flaperons to be limited and for the demand to the foreplanes to be zero at low incidences.

e.g: At high incidence the control system demand will be greater than A and will no longer have an effect on the flap, whereas the foreplane demand will.

![[Pasted image 20210315123129.png]]

![[Pasted image 20210315123139.png]]

Note also that at **high speed** and **very high incidence** the pitch rate feedback is *washed out* by a high pass filter and vertical acceleration feedback is added into the system. The aircraft then has a vertical acceleration plus high pass filter pitch rate feedback as described earlier.

At **low speed** and **high incidence during landing**, vertical acceleration is not fed back. Instead incidence feedback is added at node 6 to improve handling qualities.

In both the above conditions some dynamic, or high frequency, pitch rate feedback is required, since this will act in advance of the incidence and acceleration responses.

![[Pasted image 20210315123247.png]]

## A320

The first path simply feeds pitch rate via node 6 to the elevator. This is rather like a pitch rate system with zero demand and will improve pitch damping. 

The lower frequency contents of normal acceleration and pitch rate are summed at node 3 to produce C\*.

$$
C^* = n_p + V_{c_0} \frac{q}{g}
$$

This is compared with the stick input at node 4 and the error passed through a proportional plus integral controller to the elevator.

The elevator command is slowly integrated to move the tailplane thereby reducing the elevator angle to zero and trimming the aircraft.

This is basically a C* manoeuvre demand system

![[Pasted image 20210315123423.png]]