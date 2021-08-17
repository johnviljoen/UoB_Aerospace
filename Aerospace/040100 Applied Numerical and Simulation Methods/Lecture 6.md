# Lecture 6

---

> Links [[040100 Applied Numerical and Simulation Methods]]

> Contents

---

## Part 1 - Matrices recap and Fundamentals

- Recap of matrix algebra and linear systems
- Over-determined systems and the least-squares method
- Matrices as a linear basis
- Fundamental form of interpolation and approximation

### Matrix Algebra

Matrices, and the rules of matrix multiplication, allow the  compact representation of linear simultaneous equations

![[Pasted image 20210302155208.png]]

The solution $\gamma$ to the simultaenous equations is found by solving the system of linear equations. Mathematically we write this as the product of the inverse of $A$ and the RHS $f$

$$
\gamma = A^{-1}f
$$

An exact solution exists for the linear system if:

- A is square - number of unknowns equals number of equations
- A is also non-singular - all rows/columns are linearly independent

Computationally, we don't normally find the full matrix inverse $A^{-1}$ and multiply it with $f$. Normally, $x$ is found directly using an all-in-one solve algorithm

There are many ways to solve linear systems, however these are not covered in this course

## Over-Determined Systems

An **over-determined** system has more equations than unknowns. This corresponds to a **'tall' matrix** since it has more rows than columns

$$
\begin{bmatrix}
a & b \\
c & d \\
e & f
\end{bmatrix}
\begin{bmatrix}
\gamma_1 \\
\gamma_2
\end{bmatrix}
= 
\begin{bmatrix}
f_1 \\
f_2 \\
f_3
\end{bmatrix}
$$

- Here we have 3 equations (three rows) but only 2 unknowns
- Unless one row is simply a multiple of another row, there will be no exact solution to this system

**Is there any kind of solution for this system?**

YES! We can find the solution that minimises the error in each equation; this is known as the **least squares** solution.

## Method of Least Squares

> **Least squares** finds the solution to an overdetermined linear systems that minimises the sum of the squared errors in each equation

Start with an overdetermined system:

$$
A \gamma = f \tag{1}
$$

Where $A$ is 'tall'

Pre-multiply both sides by $A^T$:

$$
A^TA \gamma = A^Tf \tag{2}
$$

Where ($A^TA$) is now a **square matrix**

Solve the modified system:

$$\gamma = (A^TA)^{-1}A^Tf \tag{3}$$

This gives us the **least squares solution** to eq. 1

> For a 'tall' matrix A,  the **pseudo-inverse** is given by: $A^+ = (A^TA)^{-1}A^T$

We think of each row of a linear system as an infividual equation to satisfy. But what do the columns of the linear system represent?

## Matrices as a Linear Basis

We think of each row of a linear system as an individual equation to satisfy. But what do the columns of the linear system represent?

Lets write matrix $A$ now as a collection of column vectors $\phi_j$:

$$
\begin{bmatrix}
\vdots & \vdots & \cdots & \vdots \\
\phi_1 & \phi_2 & \cdots & \phi_m \\
\vdots & \vdots & \cdots & \vdots
\end{bmatrix}
\gamma
=
f
$$

We call these columns **basis functions** or **basis vectors**

Then row $i$ of the linear system is:

$$
\sum_{j=1}^m \phi_{ij}\gamma_j
=
f_i
\tag{4}
$$

Where $\phi_{ij}$ is the $i^{th}$ row of the $j^{th}$ basis function

> Another way to interpret our linear equation is that it expresses the RHS function $f$ as the **weighted combination** of basis functions $\phi_j$ where the $j^{th}$ weight is given by $\gamma_j$

## Interpolation and Approximation

Consider a set of data values that exists at discrete points in three dimensional space $f_i = f(\pmb{x}_j)$. Can we form a continous function $s(\pmb{x})$ that approximates or interpolates the discrete data?

![[Pasted image 20210302213412.png]]

1. Choose a set of basis functions that exist in the same space as our function, $\phi_j(\pmb{x})$
2. Define our interpolating/approximating function as:

$$
s(\pmb{x})
=
\sum_{j=1}^m \phi_j(\pmb{x})
\underbrace{\gamma_j}_{\text{unknown initially}}
\tag{5}
$$

3. Create a linear system using our basis function where **each row is an equation for our known data points:**

$$
\text{row } i: \space \space \space
\sum_{j=1}^m \phi_j(\pmb{x}_i)\gamma_j
=
f(\pmb{x}_i)
\tag{6}
$$

4. Solve the linear system to find the correct weightings $\gamma_j$

$$
s(\pmb{x}) 
=
\sum_{j=1}^m \phi_j(\pmb{x})\gamma_j
\tag{7}
$$

- Different interpolations/approximations vary in the basis functions they use (examples next lecture)
- If we have more datapoints $f_i$ than parameters $\gamma_j$, then our linear syste will have a 'tall' matrix
  - We have to use least squares to find $\gamma_j$ for best fit
  - Our continuous function $s(\pmb{x})$ will not satisfy the input data, $s(\pmb{x}_i) \approx f(\pmb{x}_i)$
  - $s(\pmb{x}_i)$ is an **approximating function**
- If we have the same number of data points $f_i$ and parameters $\gamma_j$, then our linear system will have a square matrix:
  - There is a unique and exact $\gamma$ that exactly solves the linear system
  - Our continuous function $s(\pmb{x})$ will exactly reproduce the original data, $s(\pmb{x}_i) = f(\pmb{x}_i)$
  - $s(\pmb{x}_i)$ is an **interpolating function**

## Conditioning

Conditioning describes how sensitive the output of a function is to changes in its inputs. An **ill-conditioned** problem is one that is highly sensitive to changes in the inputs.

> The **condition number** of a matrix quantifies the conditioning by giving a worst-case bound on how inaccurate the solution $\pmb{x}$ of the linear system $Ax = f$ will be

A common method for estimating the condition number of a matrix is the ratio eigenvalues:

$$
k \approx \frac{max(|\lambda|)}{min(|\lambda|)}
\tag{8}
$$

Simgular (non-invertible) matrices have a condition number of infinity

## Ill-Conditioning

An **ill-conditioned** matrox is one with a large condition number such that small changes in the inputs (e.g. errors) can cause very large errors in the outputs

- If the condition number of a matrix is $O(10^k)$, then in general you can expect to loose up to $k$ digits of accuracy in your solution

Typical computer $\approx$ 15-16 digits

Condition no. $\approx O(10^{15})$
$\therefore$ Numerically singular

- Ill-conditioning is caused by matrices containing elements with both very large and very small magnitudes or containing basis functions that are almost linearly dependent

![[Pasted image 20210302215922.png]]

**Why is ill-conditioning bad?**

- Your inputs must be accurate to a very high precision to obtain *some* accuracy in your solution
- Iterative solution methods slow down significantly or stall for poorly-conditioned problems

## Summary

- Matrix equations express linear simultaneous equations
- Linear systems with 'tall' matrices are over-determined
  - We can use the least squares method to find a unique but approximate solution
  - The least-squares solution minimises the sum of errors across all equations (rows)
- Matrix columns can represent a set of **basis vectors** for describing a function
  - A linear system finds a weighted combination of the basis functions tha represents the RHS function
- Interpolation/approximation give us a **continuous function** that we can **evaluate anywhere** and that interpolates/approximates our original data
- Matrices can be **ill-conditioned** depending on the basis functions
  - Ill-conditioned matrices cause problems for solving the linear system and the accuracy of the resulting solution

# Part 2 Interpolation/Approximation examples in MATLAB

- 1D and 2D Polynomial approximation/inetrpolation
- Problems with the polynomial basis
- Alternatives to the polynomial basis
- Introduction to the Radial Basis Function

## Polynomial Approximation in 2D

Now consider a similar 2D function $\pmb{\underline{x}} = (x,y)^T$

$$
f(\pmb{\underline{x}}) = 2 + 0.05x^2 + 0.025 y^2 + sin(x) + sin(2y)
$$

$$
0 \leq x \leq 4\pi, \space \space \space 0 \leq y \leq 4\pi
$$

Model this with a first (n=3) and a second order (n=6) least squares polynomial


