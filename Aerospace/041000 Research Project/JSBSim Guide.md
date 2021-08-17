# JSBSim Guide
> Links [[041000 RP4]]

## Installation
1. Install jsbsim
2. Install jsbsim python library

This will place the jsbsim installation folder in your highest directory in C:/ above even documents. In Linux I am not sure where it goes, as with Mac.

## Technical Guidance
- JSBSim does **NOT** extrapolate beyond its given lookup tables!

## Python Interaction
It is possible to read all properties in the simulation by executing the following code once jsbsim itself and the jsbsim python library have been installed.
```python
import jsbsim

# this initialises a jsbsim intance
sim = jsbsim.FGFDMExec()

# loads an aircraft model from the installed library
sim.load_model('f16')

# print all properties in anaconda prompt
sim.print_property_catalog()
```

A simulation can then be started by defining initial conditions in the jsbsim instance and then *applying* them by using the reset_to_initial_conditions(0) command. I do not know why there is a zero passed as the argument there.

```python
# plug in initial conditions, here it says self.sim as its from a
# class where I used sim as a self attribute

	# translational velocities relative to world
	self.sim.set_property_value('ic/u-fps', ic_u_mps*m2ft) # positive forward
	self.sim.set_property_value('ic/v-fps', ic_v_mps*m2ft) # positive right wing
	self.sim.set_property_value('ic/w-fps', ic_w_mps*m2ft) # positive down

	# angular velocities
	self.sim.set_property_value('ic/p-rad_sec', ic_p_rad)
	self.sim.set_property_value('ic/q-rad_sec', ic_q_rad)
	self.sim.set_property_value('ic/r-rad_sec', ic_r_rad)

	# angles relative to world
	self.sim.set_property_value('ic/theta-deg', ic_theta_deg) # 
	self.sim.set_property_value('ic/phi-deg', ic_phi_deg) # 
	self.sim.set_property_value('ic/psi-true-deg', ic_psi_true_deg) # heading in degrees

	# positions relative to world
	self.sim.set_property_value('ic/h-sl-ft', ic_h_sl_m*m2ft)
	self.sim.set_property_value('ic/terrain-elevation-ft', ic_terrain_elevation_m*m2ft)
	self.sim.set_property_value('ic/long-gc-deg', ic_long_gc_deg)
	self.sim.set_property_value('ic/lat-geod-deg', ic_lat_geod_deg)

	# EXPERIMENTAL set turbulence to milspec
	# 100 is HEAVY beyond realistic, 1 is unnoticeable, includes roll perturbations
	self.sim.set_property_value('atmosphere/turbulence/milspec/severity', turb_severity)    
	
# in order to apply these initial conditions to the model we must reset the model
sim.reset_to_initial_conditions(0)

```

My main thing that i've made is the JSBSim_Env environment.

