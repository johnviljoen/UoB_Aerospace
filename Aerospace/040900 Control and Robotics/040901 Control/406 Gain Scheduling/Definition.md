Links: [[406 Gain Scheduling]]
# Definition

- Definition

    The dynamics of a plant may vary over time or with the state of the plant. If these variations are known, then gain scheduling allows the control engineer to vary the controller gains so as to ensure that the plant remains well controlled.

    Hence gain scheduling allows us to control nonlinear plants with linear controllers: if the states of the plant is known, then we can develop a locally-linearised model of the plant and an associated linear controller. So as the plant changes so too will the controller gains — this is gain scheduling.

    Gain scheduling can be divided into 4 steps:

    1. Determine a family of linear approximations to a non-linear plant, which between them cover the operating range of the plant.
    2. Design linear controllers (e.g., P, PD, PID etc) for each of the above approximations. 
    3. Implement the controllers, such that the controller gains are scheduled according to the current values of the scheduling variables.
    4. Assess the performance of the controlled system, e.g. via theory, simulation, and physcial testing. Check for stability and robustness throughout the operating range.
- Terminology

    The scheduling variables are the (observable) parameters which are used to select the most appropriate gain values. For example, the scheduling variables in the following engineering fields might be:

    - Control of aircraft or other vehicles: vehicles speed, fuel, and freight load, altitude, air temperature, roll, pitch, yaw angles and their time derivatives
    - Manufacturing systems: Throughput rate, machine tool condition, raw material properties, power supply (voltage / pressure of hydraulic / air system), robot arm geometry and inertia.
    - Process systems: Temperature, concentration and pressure of reactants, catalysts, fluids etc in the plant, extent of valve opening.

    Gain scheduling is particularly suitable when the scheduling variables change slowly compared to the bandwidth of the controller

    A block diagram for a system with gain scheduling is shown below: the controller varies in a predetermined manner with the state of the plant.

    ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/gain_scheduled_block_diagram_(1).svg](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/gain_scheduled_block_diagram_(1).svg)

    - Example

        ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled.png)

        ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%201.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%201.png)

        ![Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%202.png](Gain%20Scheduling%207dc11479abe04cf6b9d19822bf23b3f6/Untitled%202.png)