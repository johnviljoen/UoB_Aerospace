# Pilot Handling Qualities for Aircraft
> Links [[040300 Aircraft Dynamics]]

> Contents

## 4.1 Intro

An important aim of this course is to introduce the concepts associated with aircraft active control systems and the related pilot handling qualities. The requirement for an active control system is based on the need to improve the cost of ownership and/or handling qualities of an aircraft. The control system design process is complex and testing very expensive. It is therefore highly desirable to have some control system performance criteria that can be used by an engineer to evaluate the likely acceptability of the handling qualities of an aircraft.

Handling qualities have been defined as ‘those qualities or characteristics of an aircraft that govern the _ease and precision_ with which a _pilot_ is able to perform the _tasks_ required in support of an _aircraft role_’ (Cooper & Harper, NASA TM D-5133, 1969).

In this chapter the types of analysis criteria that an engineer can use to predict the pilot’s ease of flying and opinion of an aircraft’s stability, controllability and manoeuvrability are discussed. The following definition can therefore be made.

> **Definition – Pilot Handling Qualities Criteria:**
Pilot Handling Qualities criteria are quantitative measures of the acceptability of the stability, controllability and manoeuvring performance of an aircraft which can be utilised by an engineer during the aircraft design process.

This is a very wide-ranging definition which covers all aspects of the pilot’s control input motion and force characteristics, as well as the longitudinal and lateral manoeuvring and gust response of an aircraft. It is perhaps not surprising that complete specifications of handling qualities can run to around 700 pages! This chapter can therefore only serve as an introduction to the general approach to handling qualities and will focus on those relevant to the pitching motions of actively controlled high performance aircraft. This is because much controversy and debate has surrounded these criteria in recent years and they are likely to be an area of continuing development of knowledge for some time to come.

Some practitioners differentiate between handling qualities and flying qualities. Cook (2007)[^1], for example, associates _flying qualities_ with the pilot’s perception of how well the aircraft carries out a specific task (i.e. task-related), whereas _handling qualities_ refers to the adequacy of the short-term dynamic response of the aircraft (response-related). The two are clearly interdependent and we regard them both as describing the ease and precision with which the aircraft responds to pilot commands.

Aircraft handling is linked mainly to the short term response, i.e. the short period in longitudinal motions. A pilot must be capable of handling the short term dynamics satisfactorily and this depends on the speed and stability of response. In other words, “the bandwidth of the human             

pilot and control bandwidth of the aeroplane must be compatible and the stability margins of the dynamic modes must be adequate” (Cook, 2007). Longer term handling, however, which is linked to trimming the aircraft, involves low frequencies with which a pilot can cope easily, so the requirements are more relaxed.

Longitudinal handling of older ‘classical’ aircraft exhibiting ‘second-order-like’ dynamics has often focussed on normal acceleration response (since the dominant motion cue is normal acceleration, to which the human pilot is very sensitive). As shown in Chapter 2, the $n_z$ transfer function has a constant numerator, i.e. is not dependent on $T_{\theta_2}$. Therefore, the response depends only on the denominator damping and frequency ($\zeta_{sp}$ and $\omega_{sp}$). The pitch angle and pitch rate transfer functions are, of course, dependent on $T_{\theta_2}$ − which is determined by the lift curve slope, the wing loading, the air density and air speed. For older aircraft with limited flight envelopes, $T_{\theta_2}$ does not vary much, so that even these responses are dominated by $\zeta_{sp}$ and $\omega_{sp}$.

Therefore when specification of handling qualities was initiated around 50 years ago, the emphasis was on correct design of the short period mode stability (denominator). One of the earliest flight test-based empirical criteria – the ‘thumb print’ criterion (referred to in the 2nd - year Flight Mechanics unit) – was adopted in the 1950s. This is illustrated in Fig. 4.1, for an aircraft with $\omega_{sp}$ of around 3 rad/s. Although still applicable, achieving excellent short period stability is not a guarantee of good handling qualities; we have seen in chapter 3 how important variations in incidence lag, $T_{\theta_2}$, are to the perceived handling, and this must be accounted for in modern aircraft with large altitude and speed operating ranges.

![[Pasted image 20210215111407.png]]

## 4.2 Handling Qualities Requirements

The main specification for handling qualities for most modern western military aircraft has been the US specification MIL-STD-8785C “Flying Qualities for Piloted Airplanes” produced in 1969. This remained in existence during the development of the F/A-18. Following problems with the F/A-18 much work was completed on revised criteria which resulted in the publication of MIL-STD-1797 “Flying Qualities of Piloted Vehicles” in 1987. This contained extensive guidelines but avoided precise numerical criteria in many key areas. This has recently been reissued; it remains to be seen if important problems have finally been resolved especially in light of recent well publicised crashes of development aircraft. In the case of rotorcraft, Aeronautical Design Standard (ADS) 33C – Handling qualities for Military Helicopters (1989) is used.

## 4.3 Pilot Opinion Ratings

In contrast to pilot handling qualities – which are objective in nature – pilot opinion ratings are used as a subjective means of assessing handling qualities. Their intention is to obtain consistent measures of typical pilot’s opinions of the controllability of an aircraft during or just after simulated or real test flights. The most commonly used method of pilot opinion rating is the Cooper Harper scale – see Fig. 4.2. To use this method a test is defined which may, for example, require a pilot to execute a particular manoeuvre. Ideally the pilot then answers each question in turn along the flow chart shown below to assess the aircraft’s opinion rating for that manoeuvre.

![[Pasted image 20210215111610.png]]

## 4.4 Categories of Handling Qualities [^2]

The characteristics of any dynamic system which is subject to direct human control must be bounded: outside these bounds the system would not be capable of human control. However, the human is particularly adaptable such that the variation in acceptable dynamic characteristics within the performance boundary of the system is considerable. In terms of aeroplane dynamics this means that wide variation in stability and control characteristics can be tolerated within the bounds of acceptable flying qualities. However, it is important that the flying qualities are appropriate to the type of aeroplane in question and to the task it is carrying out: not all aircraft types and phases of flight can be expected to meet or require the same handling qualities. 

In other words, the stability and control characteristics which comprise the flying qualities requirements of an aeroplane are bounded by the limitations of the human pilot, but within those bounds the characteristics are defined in a way that is most appropriate to the aircraft type and prevailing flight condition.

Thus, flying qualities requirements are formulated to allow for the type, or class, of aeroplane and for the flight task, or flight phase, under consideration. Also, the flying qualities are classified into different levels.

### 4.4.1 Aircraft Classification

Aeroplane types are classified broadly according to size and weight as follows:

- **Class I** - small light aeroplanes
- **Class II** - medium weight, low to medium manoeuvrability aeroplanes
- **Class III** - large, heavy, low to medium manoeuvrability aeroplanes
- **Class IV** - high manoeuvravility aeroplanes

### 4.4.2 Flight Phase

A sortie or mission may be completely defined as a sequence of piloting tasks. Alternatively, a mission may be described as a succession of flight phases. Flight phases are grouped into three categories and each category comprises a variety of tasks requiring similar flying qualities for their successful execution:

- **Category A** – non-terminal flight phases that require rapid manoeuvring, precision tracking, or precise flight path control (requiring closed-loop pilot control, i.e. active monitoring and adjustment of the aircraft’s orientation, speed and their rates of change).

	*Examples:* air-to-air combat, ground attack, precision tracking for weapon launch/delivery, reconnaissance, in-flight refuelling, terrain-following, maritime search, aerobatics, close formation flying.
	
- **Category B** – non-terminal flight phases that require gradual manoeuvring, less precise tracking and accurate flight path control.

	*Examples:* loiter, cruise, climb, descent, in-flight refuelling (tanker), aerial delivery.
	
- **Category C** – terminal flight phases that require gradual manoeuvring and precision flight path control.

	*Examples:* take-off, approach, landing, overshoot.
	
### 4.4.3 Levels of Flying Qualities

The levels of flying qualities quantify the degree of acceptability of an aeroplane in terms of its ability to complete the mission for which it is designed. The three levels of flying qualities indicate the severity of the pilot workload in the execution of a mission flight phase and are defined as follows:

- **Level 1** – flying qualities clearly adequate for the mission flight phase.

- **Level 2** – flying qualities adequate to accomplish the mission flight phase, but with an increase in pilot workload and/or degradation in mission effectiveness.

- **Level 3** – degraded flying qualities, but such that the aeroplane can be controlled, inadequate mission effectiveness and high, or limiting, pilot workload.

Usually the Cooper-Harper rating scale scores are matched to handling quality levels as follows:

CH rating: 1,2,3 – level 1 CH rating: 4,5,6 – level 2 CH rating: 6,7,8 –level 3.

CH ratings of 9 or 10 are typically considered below level 3.

Level 1 flying qualities implies a _fully functional_ aeroplane which is _100% capable of achieving its mission_ with _acceptable pilot_ _workload at all times_. Any fault or failure occurring in the airframe, engines or systems may degrade the level of flying qualities. Consequently, the probability of such a situation arising during a mission becomes an important issue. Thus, the levels of flying qualities are very much dependent on the aircraft failure state which, in turn, is dependent on the reliability of the critical functional components of the aeroplane.

Since the main problems of handling occur during closed loop pilot tracking tasks, these will be the main concern in these notes.

## 4.5 Important Parameters Used in Assessing Handling Qualities

Three key sets of parameters often used in the assessment of longitudinal pilot handling qualities are:

- Pole specifications (frequency and damping).

- $n_\alpha$: defined as the steady state normal acceleration attained by the approximate short period response, divided by the steady state incidence angle required to achieve this.

- Control Anticipation Parameter or CAP: the ratio of the initial pitch acceleration to the steady state normal acceleration obtained from the approximate short period equations. This parameter has also been shown to correlate with pilot opinion ratings.

Here, we consider the above in more detail, with particular emphasis on CAP (and also refer to an alternative to CAP, namely $\omega_{sp}T_{\theta_2}$). In section 4.8 we look at handling qualities in terms of response characeristics - in both time and frequency domain.

### 4.5.1 Pole Specifications [^3]

*Short Period*

In handling qualities requirements documents such as MIL-STD-8785-C, acceptable limits on the stability of the short period mode are quantified in terms of maximum and minimum values of the damping ratio as a function of flight phase category and level of flying qualities as set out in Table 4.1.

![[Pasted image 20210215113208.png]]

The maximum values of short period mode damping ratio obviously imply that a stable non-oscillatory mode is acceptable.

*Phugoid*

Upper and lower values for phugoid frequency are not quantified. However, it is recommended that the phugoid and short period mode frequencies are well separated. It is suggested that handling difficulties may become obtrusive if the frequency ratio of the modes $\frac{\omega_p}{\omega_s} > 0.1$. Generally, the phugoid dynamics is acceptable provided the mode is stable and damping ratio limits are quantified as shown in Table 4.2.

![[Pasted image 20210215115224.png]]

It is often useful to visualise the frequency and damping requirements in the s-plane. This is particularly helpful for analysis and design, including flight control system design. Fig. 4.3 illustrates this (for cases where the roots are all complex). The short period mode frequency boundaries are typically obtained from boundaries of $n_\alpha$  or CAP.

![[Pasted image 20210215115333.png]]

Although this chapter deals with longitudinal – mainly short period – handling qualities, the lateral-directional pole specifications are listed for completeness. In general, lateral-directional static stability is independent of CG position and flight condition. As with longitudinal requirements, control power and control forces are important – especially those in roll and yaw for asymmetric conditions such as steady sideslip, cross-winds, and engine-out. Due to the coupling involved in lateral-directional flight dynamics, the requirements are quite substantial.

*Roll Subsidence Mode*

The roll subsidence mode describes short term lateral dynamics and is therefore critical in the determination of lateral handling qualities. The limiting acceptable values of its time constant are specified in Table 4.3.

There is no common agreement on a suitable maximum value of the time constant for level 3 flying qualities. It is suggested in DEF-STAN 00-970 that a suitable value of time constant would appear to be in the range 6-8s whereas MIL-F-8785C quotes a value of 10s.

![[Pasted image 20210215115631.png]]

*Spiral Mode*

           

This mode involves very slow dynamic behaviour so it is not very critical in terms of handling unless it is very unstable. A stable spiral mode is acceptable whatever its time constant. The maximum level of stability is determined by the maximum acceptable roll control force, since its time constant is dependent on lateral static stability (dihedral effect). 

The minimum acceptable degree of instability is quantified by time to double bank angle in an uncontrolled departure from straight and level flight. See Table 4.4 for limiting values.

It is sometimes more convenient to express the spiral mode requirement in terms of time constant rather than time to double bank angle. Assuming that the unstable mode gives rise to a purely exponential divergence in roll then it can be shown that the _time constant_ = (_time to double amplitude_)/$log_e2$. A table showing the requirements in this alternative form appears in Cook, 1997.

![[Pasted image 20210215115749.png]]

*Dutch Roll Mode*

The Dutch roll mode is a short period mode and therefore plays a significant role in lateral-directional handling; its damping and frequency requirements are therefore specified in some detail. It is approximately the lateral-directional equivalent of the longitudinal short period mode and has frequency of the same order since pitch and yaw inertias are usually similar in magnitude. However, yaw damping is frequently low as a result of the design conflict with the need to constrain spiral mode instability with dihedral. Although similar in bandwidth to the longitudinal short period mode, the Dutch roll mode is not as critical to handling: a poorly damped Dutch roll is considered more an irritation than a serious problem.

The acceptable minima for damping ratio, undamped natural frequency and damping ratio-frequency product are specified for various combinations of aircraft class and flight phase category, as shown in Table 4.5.

![[Pasted image 20210215115833.png]]

The lateral-directional modal requirements are shown in the s-plane in Fig. 4.4.

![[Pasted image 20210215115919.png]]

### 4.5.2 Derivation of the Parameter $n_\alpha$

As previously defined, $n_\alpha = \frac{n_{ss}}{\alpha_{ss}}$.

From derivation of the approximate short period mode transfer function in chapter 2 we know that:

$$\frac{n}{\delta_p} = k_n \frac{1}{\Delta}$$

where 

$$\Delta = 1 + \frac{2 \zeta}{\omega_{sp}}s + \frac{s^2}{\omega_{sp}^2}$$

Now, using the final value theorem, the steady state normal acceleration following a step input of amplitude $\delta_0$ can be found as follows:

$$\delta_p = \frac{\delta_0}{s}$$

and

$$\lim_{t \rightarrow \infty}n(t) = \lim_{s \rightarrow 0}\left( s\frac{\delta_0}{s}k_n\frac{1}{\Delta}  \right)$$

$$\therefore n_{ss} = \delta_0k_n$$

The transfer function of the $\alpha$ response is obtained from:

$$\frac{\alpha}{\delta_p}=\frac{\theta}{\delta_p}-\frac{\gamma}{\delta_p}$$

$$=k_1\frac{T_{\theta_2}}{\Delta}$$

Using the final value therem for the same amplitude step input gives:

$$\alpha_{ss} = \delta_0k_qT_{\theta_2}$$

Thus

$$n_\alpha = \frac{n_{ss}}{\alpha_{ss}} = \frac{\delta_0k_n}{\delta_0k_qT_{\theta_2}}$$

but since

$$k_n = \frac{U_0k_1}{g}$$

> $$n_\alpha = \frac{U_0}{gT_{\theta_2}}$$

### 4.5.3 Derivation of CAP

As previously stated, CAP is defined as the amount of initial pitch acceleration per unit of steady state normal acceleration. It is obtained from the approximate short period equations.

CAP was originated by William Birhle who noted in the 1960’s that ‘in order to make precise adjustments to the flight path, the pilot must be able to anticipate the ultimate response of the airplane and that angular pitching acceleration is used for this purpose’. Aircraft with good second-order-like short term longitudinal response properties usually provide the pilot with good anticipatory handling cues. This depends on the damping and frequency of the short period pitching mode (hence the SP pole requirements above) but Birhle found from pilot observations that, ‘for airplanes having high inertia or low static stability the angular pitching acceleration accompanying small adjustments to flight path may fall below the threshold of perception’. In other words, the anticipatory nature of the response cues may become insignificant, thereby giving rise to poor handling qualities (Cook, 1997).

The initial value of the pitch acceleration is found using the initial value theorem for a step input of amplitude $\delta_0$.

$$\lim_{t \rightarrow 0} \dot{q}(t) = \lim_{s \rightarrow \infty} \left( s\frac{\delta_0}{s}k_qs \frac{(T_{\theta_2}s + 1)}{\Delta} \right)$$

$$\therefore \dot{q} = \delta_0 k_q T_{\theta_2} \omega_{sp}^2$$

Using the value for $n_{ss}$ derived above gives:

$$\text{CAP} = \frac{\dot{q}_0}{n_{ss} }=\frac{\omega_{sp}^2}{n_\alpha}$$

> $$CAP = \frac{\omega_{sp}^2}{n_\alpha}$$

### 4.5.4 The Significance of $n_\alpha$ and CAP

The parameter $n_\alpha$ is as defined above related to $T_{\theta_2}$. $T_{\theta_2}$ is the pitch angle lead time constant and is important in defining the overshoot or dropback in the pitch angle response and the lag in the flight path angle behind the pitch angle. It is also related to the aerodynamic configuration of the aricraft since

$$\begin{matrix} T_{\theta_2} \approx \frac{m}{C_{L_\alpha} \frac{1}{2} \rho V S} & \text{and thus} & n_{\alpha} \approx \frac{C_{L_\alpha}\frac{1}{2} \rho V^2 S}{mg} \end{matrix}$$

It can be shown that CAP is related to the manoeuvre margin.

$$\text{CAP} = \frac{\omega_{sp}^2}{n_\alpha}$$

From [[Chapter 2 The Approximate Short Period Transfer Functions | Chapter 2]] 

$$\omega_{sp}^2 = \frac{Z_w M_q}{mI_{yy}}-\frac{M_w U_0}{I_{yy}}$$

and it was also shown that

$$Z_w = -\frac{1}{2}\rho V_fSC_{L_\alpha}$$

It can similarly be shown that:

$$\begin{align} M_wU_0 & = \frac{1}{2} \rho V_f^2S \bar{c}C_{m_\alpha} \\ M_q & = \frac{1}{2} \rho V_f S \bar{c}^2 C_{m_q}  \end{align}$$

Thus

$$\omega_{sp}^2 = \frac{-\frac{1}{2}\rho V_f^2S\bar{c}}{I_{yy}}C_{L_\alpha} \left[ \frac{C_{m_\alpha}}{C_{L_\alpha}}+\frac{\rho S \bar{c}}{2m} C_{m_q} \right]$$

and, as $n_{\alpha} \approx \frac{C_{L_\alpha}\frac{1}{2} \rho V^2 S}{mg}$, we have: 

> $$CAP = \frac{-mg\bar{c}}{I_{yy}}\left[ \frac{C_{m_\alpha}}{C_{L_\alpha}}+\frac{\rho S \bar{c}}{2m} C_{m_q} \right]$$

The term in brackets is in fact the **manoeuvre margin**.

![[Pasted image 20210222114406.png]]

Thus it can be seen that CAP is indeed related directly to manouvre margin:

$$CAP = -\frac{mg\bar{c}}{I_{yy}} \times (-\text{controls fixed manoeuvre margin})$$

so that limits on CAP can be viewed as limits on the allowable manoeuvre margins for an aircraft. It effectively quantifies acceptable short period mode characteristics appropriate to the aerodynamic properties and operating condition of the aeroplane.

A more physiological explanation of the relevance of CAP is that the initial pitch acceleration can be sensed rapidly by the inner ear semi-circular canals and is used by pilots as an indication of the ultimate vertical acceleration to be attained. Limits on the allowable CAP can then be viewed as maximum and minimum limits on the sensitivity of the initial and final responses to the pilot’s input. Birhle determined that the lower acceptable value of CAP for human pilots is around $16°/s^2$ per g and the higher limit as $50°/s^2$ per g. However, the higher acceptable value is subjective as it depends on the pilot’s interpretation of the particular aircraft’s controllability and on his/her control strategy.

In addition since $CAP = \frac{\omega_{sp}^2}{n_\alpha}$, limits on the allowable CAP and $n_\alpha$ place limits on the allowable $\omega_{sp}$ as shown in Fig. 4.5, taken from MIL-STD-8785C.

The response of an aircraft with an active control system may be significantly different from a conventional unaugmented aircraft for which these expressions are derived. Therefore direct evaluation of the $n_\alpha$ and CAP may not be possible for such aircraft.

![[Pasted image 20210222115049.png]]

FIG. 4.5: MIL-F-8785C SHORT PERIOD FREQUENCY REQUIREMENTS: LINES OF CONSTANT CAP AT THE MAX. AND MIN. PERMITTED LEVELS, CAT. A FLIGHT PHASES

Level of acceptability:

Level 1: adequate for mission.
Level 2: degraded capability, e.g. due to a failure.
Level 3: safe to fly but unable to complete mission, e.g. due to a failure.

## 4.6 Augmented Aircraft and Equivalent Systems

Since the desirable response characteristics of unaugmented aircraft are well understood in terms of the approximate short period transfer function parameters (including $n_\alpha$ and CAP), it is logical to try to express more general requirements in terms of these parameters. However, the dynamic response of actively controlled aircraft will include the effects of the control system as well as the basic aircraft. These effects will include such things as:

- Zero initial pitch acceleration:
	![[Pasted image 20210222120131.png]]
- Many important roots in the transfer function, making precise definition of the short period root impossible
- Additional lags in the transfer function which have no equivalent in the approximate short period tansfer function.

To overcome this difficulty an **equivalent system** can be defined which has the transfer function:

$$\frac{q(s)}{\delta(s)} = k_{q_e} \frac{[T_{\theta_{2e}}s+1]e^{-\tau_\theta s}}{\Delta_e} \text{ where } \Delta_e = \left[ \frac{s^2}{\omega_{sp_e}^2} + \frac{2 \zeta_{sp_e}s}{\omega_{sp_e}} + 1 \right]$$

The equivalent system parameters are determined from choosing them such that the equivalent system frequency response most closely fits the frequency response of the full system with its active control system. The term $e^{-\tau_\theta s}$  is included as a pure delay which is equivalent to the additional phase lags that cannot be modelled by a simple second order transfer function.

$\tau_\theta$ is called the equivalent time delay and maximum permitted value may be about 0.1 sec.

Equivalent system values for $n_\alpha$ and CAP can be found from the equivalent system transfer function as illustrated in Fig. 4.6.

![[Pasted image 20210222120813.png]]

FIG. 4.6: PROCESS FOR MINIMISING FREQUENCY RESPONSE COST FUNCTION TO FIT EQUIVALENT SYSTEM; COST FUNCTIONAL = $\sum_{i=1}^{20} (G_i^2 + KP_i^2)$; $K=0.02$.

Alternatively an equivalent CAP may be found by replacing the initial pitch acceleration with the maximum (peak) pitch acceleration following a step input.

## 4.7 Pilot Induced Oscillations

### 4.7.1 What are Pilot Induced Oscillations?

Pilot Induced Oscillations (PIO) are defined in MIL-STD-1797A as _sustained or uncontrollable oscillations resulting from the pilot’s efforts to control the aircraft._

When pilots are controlling an aircraft attitude to precise requirements their actions become closely linked to the response of the aircraft and the input they sense they are applying. In this context pilots are a complex adaptive control system overlaid on the aircraft and its control system. It is possible for this combination of system responses to become unstable. Such closed-loop pilot and aircraft instability constitutes PIO. It is often characterised by large stop-to-stop control movements.

### 4.7.2 How Can They Happen?

There are various theories for the reasons why a pilot would encounter PIO. One theory is that when pilots act in a closed loop manner, such as during landing, they pump the control stick at a frequency where the pitch acceleration is in phase with the input. This is like a subconscious feeling of the response through the pitch acceleration cue sensed by the semi-circular canal in the inner ear. Unfortunately, when the pitch acceleration is in phase with the input, the pitch attitude response is 180° out of phase with the input. If the gain of the pitch attitude response is sufficiently large at this frequency the pilot will notice the out of phase response and will attempt to correct it by applying larger control movements leading to an unstable response.

Because PIO are caused by an out of phase response the likelihood of their occurrence will be increased if there exists the possibility of rapid changes of phase within the control system. This can occur when an actuator saturates, for example when the servo valve reaches its travel limit – see Fig. 4.7.

Since in a conventional aircraft the pitch attitude response can never reach 180°, they cannot encounter PIO as described here. PIO is therefore a phenomenon linked with highly augmented aircraft. In addition since the phenomenon is governed by the phase relationship between the pitch attitude response and pitch acceleration response, PIO cannot be adequately predicted by conventional flight simulators which often exhibit image generation lags (latency) and restricted motion cueing.

![[Pasted image 20210222121125.png]]

### 4.7.3 Examples of Pilot Induced Oscillation

There is a long list of aircraft that have experienced PIO during development – both military and civil. A couple of examples are:

- The space shuttle on its fifth test flight following release from its carrier aircraft attempted its first landing on a concrete runway and experienced a PIO. In this case the PIO appeared to be coupled between the pitch and roll axes, but in fact the roll response was caused by saturation of the roll actuation when the elevons saturated in pitch. See Fig. 4.8.
	![[Pasted image 20210222121232.png]]
	The concrete runway landing increased the pilot’s awareness of the aircraft’s attitude response. The problem was solved by introducing a filter on the pilot’s demand so that response at the important PIO frequency would be insignificant.
	
- During the Tornado development programme a PIO was recorded during a landing.
	This was thought to have been caused by the high gain in the pitch acceleration response at the frequency where it is in phase with the input. The PIO was not encountered when the augmentation system was not operating, because its gain was lower in this frequency region. See Figs. 4.9 and 4.10.
	![[Pasted image 20210222121407.png]]

- In 1989 a PIO was experienced by a SAAB Gripen during development testing, triggered by lateral turbulence and resulting in a crash on landing. Then in 1993 the same test pilot experience a PIO triggered by an aggressive roll to wings-level at an air show. Both were due to rate saturation of the elevons, which are used for both roll and pitch control (including for stabilisation of the inherently unstable pitch dynamics).
	![[Pasted image 20210222121450.png]]

- In 1992 the YF22 prototype aircraft crashed:
	![[Pasted image 20210222121534.png]]
	
### 4.7.4 Categories of PIO

Pilot induced oscillations – sometimes referred to as ‘pilot-in-the-loop oscillations’, ‘pilot-involved oscillations’ or ‘aircraft-pilot coupling’ (APC) – are classified into three categories in order to simplify their analysis and prediction:

**CATEGORY I:**

- essentially **linear** (only ‘simple’ non-linearities such as gain shaping of the pilot’s command signal and dynamic changes to the pilot);
- caused by the pilot-vehicle system (PVS) closed-loop performance being restricted by excessive phase lag and/or inappropriate aircraft gain;
- not always severe;
- usually predictable.

**CATEGORY II:**

- essentially **non-linear** PVS oscillations caused when amplitudes enter the range where **rate and/or position limits** dominate (see block diagram in Fig. 4.12, showing common control system non-linearities and, in particular, position and rate saturations);
- most common limit cycle oscillatory PIO;
- intrinsically severe;
- often predictable.

![[Pasted image 20210222121816.png]]

The effect of actuator rate saturation on the ability of the actuator output to follow the commanded input is shown in Figure 4.12.

![[Pasted image 20210222121846.png]]
![[Pasted image 20210222121854.png]] [^4]

**Rate-Limited frequency response (non-examinable)**

- Severe rate limiting reduces the gain and increases the phase lag beyond the roll-off frequency.
- In severe cases, two possible responses exist near the roll-off frequency for the same input (see Figure 4.13): one in phase and one out of phase with the inputs.
- This causes a sudden increase in phase lag as the pilot increases the frequency (i.e. a jump resonance), which can be encountered during demanding phases of the flight like landing.
- In Figure 4.13, the abrupt jump from 21° to 180° phase lag essentially reverses the effect of the control column. This catches the pilot off guard and contributes to a category II PIO.

![[Pasted image 20210222122102.png]]

**CATEGORY III:**

- non-linear PVS oscillations with transitions;
- oscillations depend on non-linear and non-stationary transitions in either the controlled element (e.g. mode changes in the controller, changes in aerodynamic or propulsion configuration of the aircraft) or the pilot’s behaviour (magnitude of pilot’s commands);
- can be severe;
- extremely difficult to predict.

## 4.8 Response Criteria

In addition to the handling qualities criteria defined in terms of the aircraft transfer function parameters (pole specifications, $n_\alpha$ and CAP), metrics have been defined in the frequency and the time domains. The latter may be used in an analysis of the full nonlinear model. Here we consider a couple of time response criteria and a frequency response criterion that has been established to try to avoid pilot induced oscillations.

### 4.8.1 Time Response Criteria

Time response criteria may take the form of a set of measures describing the important features of the desired response, such as in Fig. 4.14.

![[Pasted image 20210222122257.png]]

Typical values for the response measures for precision tracking may be:

![[Pasted image 20210222122320.png]]

An alternative form of time response criterion is that of envelopes placed around the time response following a step input, as in Fig. 4.15.

![[Pasted image 20210222122352.png]]

An example of such a criterion which is not often used for highly-manoeuvrable aircraft – but is used by Airbus – is the C\* criterion. It is used in preference to short period frequency and damping requirements in situations where the latter are unsatisfactory – due to controller poles and zeros being located close in frequency to the uncontrolled aircraft $\omega_{sp}$, thus altering the dynamic response[^5]. C\* is a time response parameter defined as:

$$C^* = k \left[ n + \frac{l_p \dot{q}}{g} + \frac{V_{co}q}{g} \right]$$

where 

- $n+\frac{l_q \dot{q}}{g}$ is the normal acceleration at the pilot's station;
- $V_{co}$ is a constant usually taken as 400 ft/s (a somewhat arbritrary choice) and is considered to be where the pilot's perception of the $q$ and $n$ responses are equal. It is a weighting factor reflecting the change in emphasis pilots place on motion cues, pitch rate control being preferred at lower speeds and normal acceleration control at higher speeds (where even a small control input resulting in a very small pitch rate is likely to cuse a significant normal acceleration).

Application of this criterion involves ensuring that C* against time following a step input fits within a specified envelope, as shown in the examples in Fig. 4.16.

![[Pasted image 20210222123036.png]]

The example shown in Fig. 4.16 indicates that the C\* criterion does not always correlate with pilot opinion. This may be because the criterion is not able to adequately capture the interdependence of pitch rate and normal acceleration in flight manoeuvres.

It has also been criticised in two other respects:
- although intended to account for the higher order dynamics of aircraft with feedback control systems, it sometimes gives poor predictions when control system dynamics are significant;
- when used within a control law (as in some Airbus aircraft) it can tend to result in neutral speed stability.

### 4.8.2 Frequency Response Criteria

If a pilot acting in a closed loop manner is considered to be a simple gain then the combination of pilot and aircraft (see Fig. 4.17) will be unstable if the pilot aircraft loop gain and phase margins are inadequate.

![[Pasted image 20210222123151.png]]

The problem with this analysis is that the gain the pilot injects into the loop will vary or adapt to suit particular circumstances. To account for this, one proposed frequency response criterion (the Gibson frequency domain template, or Gibson gain-phase criterion) involves plotting a ‘relative gain’ pitch attitude transfer function[^6] on a Nichols chart. The relative gain is simply a scaling of the attitude gain such that the –120° phase angle point lies on the 0dB line; it corresponds to the notion of adding pilot gain into the loop so as to achieve a 120° phase lag in the pitch attitude response when the gain is unity.

The response is then tested for adequate gain margin in the pilot-aircraft loop. This is achieved by referring to certain boundaries incorporated in the template; these are obtained from a database of existing aircraft with known handling qualities. A frequency response inside the boundaries – which are centred on a _K/s_ response at low frequencies – signifies satisfactory behaviour; there is also a ‘pitch bobble’ area. Anything outside of these regions implies PIO.

Fig. 4.18 defines the frequency response boundaries. Note that the transfer function here is $\frac{\theta}{\delta}$; a ratio of $\theta$ to pilot’s force is often used instead; an example of such a response for the so-called ‘LAHOS’ (Landing Approach High Order System) configuration is shown in Fig. 4.19.

The LAHOS database is from a NT-33 flight test programme to evaluate the influence of high-order effects on landing and approach[^7]. The frequency response in this figure applies to a configuration that was rated by pilots as having a tendency to bobble[^8], with low frequency PIO during landing. The Gibson frequency domain criterion correctly predicts the PIO proneness of this configuration: the transfer function exits from the prescribed bounds both in the low frequency region (above 0dB of relative gain), where bobble in the form of attitude dropback is predicted, and in the higher frequency region (below 0dB of relative gain), where the PIO region is crossed

![[Pasted image 20210222123700.png]]

![[Pasted image 20210222123712.png]]



[^1]:  Much of this chapter is based on Cook, 2007 to which you are referred for more detail.
[^2]: This section is based on M.V. Cook *Flight Dynamics Principles*, 1997.
[^3]: This section is based on M.V. Cook *Flight Dynamics Principles*, 1997.
[^4]: D.H. Klyde, D.T. McRuer & T.T. Myers, Highly saturated system time responses From: Unified Pilot-Induced Oscillation Theory, Vol. 1: PIO Analysis with Linear and Nonlinear Effective Vehicle Characteristics, Including Rate Limiting, Report no. WL-TR-96-3028, US Flight Dynamics Directorate, Wright Laboratory, 1995.
[^5]: D. McLean, _Automatic Flight Control Systems_, Prentice Hall, 1990.
[^6]: The criterion is presumably based on the fact that a pilot focuses on pitch angle ($\theta$) during certain high-gain tasks, such as landing; the aircraft might respond to pilot input in the form of pitch rate or angle of attack, depending on the manoeuvre demand control law, but the pilot will be monitoring $\theta$. The previously-mentioned sensitivity to angular acceleration (180° out of phase with angle) can lead to the instability causing PIO.
[^7]: RTO Tech. Report 29, _Flight Control Design – Best Practices_, RTO-TR-029, 2000.
[^8]: A ‘bobble’ is a steady self-limiting oscillation, typically of low amplitude; it does not classify as a PIO and has never been known to cause worse than Level 2 handling on its own \[RTO-TR-029\].