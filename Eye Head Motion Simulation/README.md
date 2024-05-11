### Introduction

We were given the task to simulate the motion of a system resembling a human eye. The primary goal of this assignment was to determine motor commands that minimize endpoint variance during eye movement towards a target position in the presence of signal-dependent noise. Additionally, the minimization was constrained by having the expected position at the next time points $k$ be equal to our goal position.

### Approach

The system is modeled using the given state vector $\mathbf{s}$ composed of position, velocity, and force. We frame this problem as an optimization problem.

Minimize:

$$
J = \text{Var}\left[ S^T x^{(p)} \right]
$$

Subject to: 

$$
s^T E\left[ x^{(p+i-1)} \right] = g, \quad \text{for} \quad i = 1, \dots, k
$$

To solve this optimization function, we need to construct its Lagrangian function and solve for when the gradients are parallel i.e., they differ by a scalar multiple $\lambda_i$ in each constraint.

The Lagrangian function is given by:

$$
\mathcal{L}(u,\lambda_i) = \text{var}\left[ S^T x^{(p)} \right] + \lambda_i \sum_{i=1}^{k} \left( s^T E\left[ x^{(p+i-1)} \right] - g \right)
$$

In the derivation that follows, the $\frac{d\mathcal{L}}{du}$ and $\frac{d\mathcal{L}}{d\lambda}$ are computed to solve for the optimal motor commands $u$ and the Lagrangian multipliers $\lambda_i$. Additionally, the $\frac{dJ}{du}$ or $\frac{dJ}{d\lambda}$ term refer to their corresponding component in the Lagrangian.

### Implementation

To solve the problem, we first used the given cost function and constraints to set up a Lagrangian function. This Lagrangian function was then minimized by first computing the gradient of the function with respect to the system input $u$ and then to each of the Lagrangian multipliers $\lambda_i$.

Upon computing this, we are left with $p+k$ equations and $p+k$ unknowns where $p$ is the number of time steps and $k$ is the number of constraints.

**No Signal Dependent Noise**

The first plot above shows the system for the optimal $u$ without signal dependent noise in the system. The second plot shows a continuous increase in the position over time. This suggests that once the target is reached there is no movement, but the amount of input provided to the system, based on the first plot, changes a lot before the system converges to the target position. The third subplot shows how the speed of the eye movement peaks and then decreases.

**Signal Dependent Noise**

The above plot shows a comparison of a control system's behavior with and without signal-dependent noise in the system by setting $\kappa=0.0006$. The top plot shows the optimal motor commands calculated to minimize endpoint variance when controlling the system.

