# Trajectory Planning

# Motion and trajectory

- Trajectory

    Transformation matrix expressing the position and orientation of the end effector of a robot w.r.t. its base at each moment t:

    $$T_{0E}(t)=\begin{bmatrix} R_{0E}(t) & p_{0E} \\ 0_{1\times 3} & 1 \end{bmatrix}$$

- Study of derivatives of the trajectory yields the Velocity and Acceleration

# Position (trajectory) control

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled.png)

Can we control only position?

Accelerations and speed can be controlled by the rate at which points are sent to the control loop

The result defines a velocity profile for the move.

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%201.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%201.png)

# Path Selection

Stored either as joint values (Joint space) or end effectors position and orientation (cartesian space)

- Joint space: no kinematic calculations are required
    - Jogging the robot to the desired position
    - Recording the joint values and repeat
- Cartesian space: kinematic calculations are required to provide these joint angles for a given location and orientation

# Joint Space Trajectories

- An operator manually jogs the robot to a desired position and then stores that position e.g. stores the joint values for that position. Once that position is taught, it can be recalled during robot operation.
- These joint values obtained through the use of a teach pendant
- Point to point trajectory (PPT), based upon taking the joint values (angles) as input.
- No need for inverse kinematic calculations. The path of the end effector between points is usually not a straight line

# Motion Teaching

- Set the robot in gravity compensation and move it to the desired position
- Record values
- Repeat motion

# PPT — Start and Finish example (1)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%202.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%202.png)

Joint space: normalised movements of a robot with 2 DoF.

$$\text{Joint } \alpha: 20 \rightarrow40 \\ \text{Joint } \beta: 30 \rightarrow80$$

Generation of joint values so that end effector trajectory is a straight line (using IK)

# Time Change of Joint Values

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%203.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%203.png)

# Polynomial functions

- Cubic
- Quintic

## System of equations

with (4 and 6) respective unknowns ($\alpha_0 \space \cdots\space \alpha_n$):

- Original function (position)
- First derivative (velocity)
- Second derivative (acceleration) equations form

## Conditions

Known start and end position, velocity, and acceleration to derive the polynomial parameters

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%204.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%204.png)

lol^

# Linear Functions with Parabolic Blends

### Linear Functions

Position $\theta=\theta_0+v \cdot t$

Velocity $\dot{\theta}=v$

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%205.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%205.png)

- Velocity would be discontinuous at the beginning and at the end
- To create a smooth function for path we add parabolic blends

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%206.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%206.png)

### Linear Functions with Parabolic Blends

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%207.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%207.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%208.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%208.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%209.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%209.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2010.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2010.png)

### Example

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2011.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2011.png)

### Study of Acceleration

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2012.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2012.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2013.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2013.png)

# Path Motion with 'via points'

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2014.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2014.png)

### Polynomials vs 'via points'

Drawbacks of polynomials:

- As the order of polynomial increases, its oscillatory behaviour also increases
- Numerical accuracy decreases with the increased order polynomial
- Coefficients must be recomputed if only one point on the trajectory is changed

Why use via points:

- Described in terms of a desired position and orientation
- Low order polynomials connect via points
- Velocity constraints are not zero in via points
- Velocity in via points chosen in a way to maintain constant acceleration.

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2015.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2015.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2016.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2016.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2017.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2017.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2018.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2018.png)

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2019.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2019.png)

### Example

Create a trajectory for a joint to move between two points ($\theta_1= 0 \degree$ and $\theta_4 = 30 \degree$) via two other points ($\theta_2 = 40 \degree$ and $\theta_3 = 20 \degree$).

Requirements: all blend times must be 2 seconds, all durations between point must be 5 seconds and use the motor in stock that can produce an acceleration of magnitude of $6 \degree$ per second

a) Can you satisfy all requirements of the trajectory?

b) If not, what amendments in the requirements you can make? What are the characteristics of the trajectory?

c) Plot/draw the velocity and acceleration profiles of the movement

# Cartesian Space vs Joint Space

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2020.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2020.png)

Cartesian Space Problems

Type A:

Points not in workspace

Type B:

Path through singularity

Type C:

Different configuration

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2021.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2021.png)

### Cartesian Space Trajectories

1. The trajectory is applied to the linear coordinates and angles which represent the end-effector location $^0T_6$
2. These trajectories are then sampled to produce a set of $^0T_6$ transformations spanning the whole movement
3. Performing the **inverse kinematics** calculations on each one of these gives a set of joint angle vectors for the manipulator to follow

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2022.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2022.png)

### Cartesian Trajectory Generation

Goal:

Turn a specified cartesian space trajectory of $P_e$ into appropriate joint position reference values

Input: 

Cartesian space trajectory of $P_e$

Output:

A series of joint position/velocity reference values to sent to the controller

Steps:

Use IK of a robot manipulator arm to find joint values for any particular location of $P_e$

Use sampling and curve fitting to reduce computation

![Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2023.png](Trajectory%20Planning%209ac6c033d23045b78ae536a2e0bf5c86/Untitled%2023.png)

### Example: Straight Path

Express line as continuous function (i.e. parameterise by time): $x(t), y(t)$

Let $y=mx+b$

Move along the line with constant speed, $u$

### Parameterise the Line:

Equation of the line: $y=mx+b$

Differentiate: $\dot{y} = m\dot{x}$

Planar Velocity Vector: $\vec{u}=\dot{x}\hat{i} + \dot{y} \hat{j}$

Substitute $\dot{y}$: $\vec{u} = \dot{x} \hat{i} + m\dot{x} \hat{j}$

Velocity (magnitude): $u=\sqrt{\dot{x}^2+(m\dot{x})^2} = \pm \dot{x}\sqrt{1+m^2}$

Solve for the $x$ element (pick appropriate sign):

$$\dot{x} = \frac{\pm u}{\sqrt{1+m^2}}$$

Substitute and then integrate

$$\begin{matrix} \dot{x} = \frac{u}{\sqrt{1+m^2}} & x(t)=\frac{ut}{\sqrt{1+m^2}}+x_0 \end{matrix}$$

$$\begin{matrix} \dot{y}= \frac{um}{\sqrt{1+m^2}} & y(t) = \frac{umt}{\sqrt{1+m^2}}+y_0 \end{matrix}$$

### Sample the continuous path function

Use $M$ samples of the total time $t_{total}$

$$t_i=\left( \frac{t_{total}}{M-1} \right)i, \space\ \space i=0, \cdots,M $$

$$x_i = \frac{ut_i}{\sqrt{1+m^2}}+x_0$$

$$y_i = \frac{umt_i}{\sqrt{1+m^2}}+y_0$$