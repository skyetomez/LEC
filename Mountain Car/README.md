# Table of Contents

1. [Introduction](#introduction)
2. [Approach](#approach)
3. [Implementation](#implementation)
4. [Results](#results)
5. [Code](#code)

## Introduction

In this homework assignment, we were tasked with the [Mountain Car Problem](https://gymnasium.farama.org/environments/classic_control/mountain_car/#mountain-car),
a classic test in the field of reinforcement learning. 

The problem is that a car must climb over a hill starting from a valley. 
In this task, we need to find the optimal control policy $\pi^*$ given our initial conditions,
to get our car over a hill. 

We were told in class that a solution is for the car to initially move backwards
to build enough momentum to reach its target. 
This optimal strategy allows the car to gain enough momentum to ascend the hill.
However, it is counterintuitive and not immediately obvious that this is the optimal strategy.

We use the Q-learning algorithm to determine the optimal sequence of actions 
that will allow the car to reach the hilltop. 
This works by iteratively updating the car's actions based on the rewards received, 
at each time step. Mathematically, this is done using the Bellman equation.

$$ x $$

$$
V^{\*}_{\pi^*}(x^{(\rho-1)}) = \alpha^{(\rho-1)}(x^{(\rho-1)}, \pi^*(x^{(\rho-1)})) + \mathbb{E} \left[ V^*_{\pi^*}(x^{(\rho)} \min x^{(\rho-1)}, \pi^*(x^{(\rho-1)})) \right]
$$

Equation then allows us to extract the optimal policy $\pi^*$ at each state by:

$$
\pi^*(x^{(\rho-1)}) = \arg \min_u \left\{ \alpha^{(\rho-1)} + \mathbb{E} \left[V^*_{\pi^*}(x^{(\rho)} \mi x^{(\rho-1)}, u^{(\rho-1)}) \right] \right\}
$$

After the optimal policy is determined, we can then simulate the car moving through the state space
and analyze its strategy to reach the hilltop. 

## Approach

As mentioned, we are approaching this problem by using Q-learning.
This means that we need to:

1. Create a Q-table
2. Populate the Q-table iteratively
3. Get the Optimal policy

### Creating a Q-Table

The initialization of state space is the creation of the Q-table. 
First, we define a discrete state space representing the car's position and velocity.
This involves creating a Q-table, a matrix where rows correspond to discrete position states and columns to velocity states. 
The Q-table initialization is conducted using the following dimensions:

$$
nbinsx = 150, \quad nbinsdx = 100
$$

Where $n_bins_x$ and $n_bins_dx$ are the number of bins for the position and velocity states.

### Iteratively Populating Q-Table: Bellman Equation

After we've created our Q-table we can then populate it with the optimal values
by using the Bellman Equation. Because the Bellman Equation returns optimal values it will also return an optimal policy.

To update the position and velocity of the car we use the following equations:

$$
\dot{x}^{(n+1)} = \dot{x}^{(n)} + \Delta t \left(-3g \cos(3x^{(n)}) + \frac{u^{(n)}f}{m} - \frac{k_{f}}{m} \dot{x}^{(n)}\right)
$$

$$
x^{(n+1)} = x^{(n)} + \Delta t \dot{x}^{(n)}
$$

Additionally, the car can only move left or right with unit force $u\in\{-1,1\}$.

### Deriving the Optimal Policy

After the Q-table is fully populated, the optimal policy is extracted, which guides the car's movements. This policy determines whether to accelerate forward or backward at each state based on the table's maximum value entries.

## Implementation

Due to the size of the state space, we simulate this approach in MATLAB. 

### Q-table

The Q-table is a matrix of size $100 \times 150$ where each element is
