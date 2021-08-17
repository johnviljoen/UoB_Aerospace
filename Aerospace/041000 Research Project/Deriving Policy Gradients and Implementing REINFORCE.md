# Deriving Policy Gradients and Implementing REINFORCE

> Links [[041000 RP4]]

> Source https://medium.com/@thechrisyoon/deriving-policy-gradients-and-implementing-reinforce-f887949bd63

> Contents

Policy gradients are frequently used in model free reinforcement learning algorithms. The policy gradient method is also the 'actor' part of the Actor-Critic methods, so understanding it is foundational to studying reinforcement learning!

Here, we are going to derive the policy gradient step-by-step, and implement the REINFORCE algorithm, also known as Monte Carlo Policy Gradients.

***

## Preliminaries

Fundamentally, policy gradient methods update the probability distribution of actions so that actions with higher expected reward have a higher probabiliy value for an observed state. We assume discrete (finite) action space and a stochastic (non-deterministic) policy for this post. This is not what my RP4 is, which is continuous and deterministic.

### Definitions

1. Reinforcement Learning Objective

The objective function for policy gradients is defined as:

$$J(\theta) = \mathbb{E} \left[ \sum_{t=0}^{T-1}r_{t+1} \right]$$

The objective is to learn a policy that maximises the cumulative reward to be recieved starting from any given time t until the terminal time T.

Note that $r_{t+1}$ is the reward recieved by performing action $a_{t}$ at state $s_{t}$ ; $r_{t+1} = R(s_{t}, a_{t})$ where $R$ is the reward function.

Since this is a maximisation problem, we optimize the policy by taking the gradient *ascent* with the partial derivative of the objective with respect to the policy parameter $\theta$

$$\theta \leftarrow \theta + \frac{\partial}{\partial\theta}J(\theta)$$

The policy function is paramaterised by a neural network (since we have access to deep learning)

2. Expectation

Frequently appearing in literature is the expectation notation -- it is used because we want to optimize long term future (predicted) rewards, which have a degree of uncertainty.

The expectation, also known as the expected value or the mean, is computed by the summation of the product of every $x$ value and its probability.

$$\mathbb{E}[f(x)] = \sum_xP(x)f(x)$$

Where $P(x)$ represents the probability of the occurence of random variable $x$, and $f(x)$ is a function denoting the value of $x$

***

## Deriving the policy gradient

Let us start with the defined objective function $J(\theta)$. We can expand the expectation as: