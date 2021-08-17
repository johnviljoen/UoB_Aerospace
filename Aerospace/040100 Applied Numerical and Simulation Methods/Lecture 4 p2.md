# Lecture 4 p2
>Links [[040100 Applied Numerical and Simulation Methods]]

>Contents

Recap: N-S in **tensor form** (ignoring body forces and heat flux terms):

$$\begin{split} \frac{\partial \rho}{\partial t} + \frac{\partial \rho u_i}{\partial x_i} & = 0 \\ \frac{\partial \rho u_i}{\partial t} + \frac{\partial \rho u_i u_j}{\partial x_j} & = -\frac{\partial P}{\partial x_i} + \frac{\partial \tau_{ji}}{\partial x_j} \\ \frac{\partial E}{\partial t} + \frac{\partial \rho u_j (E+P)}{\partial x_j} & = \frac{\partial u_i \tau_{ji}}{\partial x_j} \end{split}$$

where the stress terms are given by

$$\tau_{ij} = 2\mu s_{ij} - \frac{2}{3} \mu \frac{\partial u_k}{\partial x_k}\delta_{ij}$$

and where the stress rate tensor is given by:

$$s_{ij} = \frac{1}{2} \left( \frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i} \right)$$

and $\delta_{ij}$ is the Kronecker delta: $\delta_{ij}=1$ if $i = j$, $=0$ otherwise. So its basically the elements of an identity matrix.

After applying Favre Averaging and simplifying, we obtain (write using same notation as Reynolds averaging, i.e. $\bar{u}$ and $u'$ rather than $\tilde{u}$ and $u''$ for simplicity to represent an averaged quantity and a perturbation quantity):

![[Pasted image 20210218135331.png]]

Hence, the extra stress terms are clear. There are also extra terms in the equation of state. However, under certain assumptions these can be neglected, and the final term in the energy equation can be ignored for majority of flows (M < 5).

Turbulence models known as Eddy Viscosity Models or Reynolds Stress Models.

For laminar flow, we know the shear stresses are, for example the xy component:

![[Pasted image 20210218135408.png]]

where $\mu^l$ is the laminar viscosity coefficient.

Can't evaluate the terms in the Reynolds stresses directly, so use analogy with shear stress to say the extra stresses are associate with a turbulent shear stress as:

![[Pasted image 20210218135502.png]]

