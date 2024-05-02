# Introduction

In the beginning of chapter 8 of our textbook, (saccadic) gain is defined as:

> the ratio between the displacement of the eyes and the displacement of the target.

Formally, this is represented by the equation:

$$
G = \frac{x(t)}{g}
$$

We are given the following system representing the eyes as:

$$
\text{Position of the eye} \quad X = u + \varepsilon \quad \varepsilon \sim \mathcal{N}(0, c^2u^2 \phi) \quad \phi \sim \mathcal{N}(0,1)
$$
$$
X = u(1 + c\phi)
$$
$$
\text{Duration of the saccade} \quad t = a + bx = a + bu(1 + c\phi)
$$

# Approach

We solve the problem by minimizing the expected cost function $E[J]$ with respect to the control input $u$. The cost function is given by

$$
J(u,\lambda) = \lambda (g - u)^2 + (a + bu)^2
$$

## Signal Dependent Noise Derivation

By taking expectation of the cost function, we have:

$$
E[J] = \lambda E[(g - u)^2] + E[(a + bu)^2]
$$

Expanding the terms in the expectation gives:

$$
E[J] = a^{2}+2 a b u+b^{2} c^{2} u^{2}+b^{2} u^{2}+c^{2} \lambda  u^{2}+g^{2} \lambda -2 g \lambda
u+\lambda  u^{2}
$$

In order to minimize for $u$, we take the partial derivative of $E[J]$ with respect to $u$ and set it to zero:

$$
\nabla_u E[J] = 2 a b+2 b^2 c^2 u+2 b^2 u+2 c^2 \lambda  u-2 g \lambda +2 \lambda  u  = 0
$$

Rearranging these terms to isolate $u$ and find that:

$$
u^* = \frac{g \lambda -a b}{\left(c^2+1\right) \left(b^2+\lambda \right)}
$$

Further simplification by partial fraction decomposition gives:

$$
u^* = \frac{-gb^2-a b}{\left(c^2+1\right) \left(b^2+\lambda
\right)}+\frac{g}{c^2+1}
$$

## Gaussian (Signal Independent) Noise Derivation

In the case where the noise is Gaussian, the cost function remains the same as in. However, the expectation is taken with respect to a Gaussian distribution without signal dependent noise:

$$
E[J]= a^2+2 a b u+b^2 \sigma ^2+b^2 u^2+g^2 \lambda -2 g \lambda  u+\lambda  \sigma
^2+\lambda  u^2
$$

Taking the derivative with respect to $u$:

$$
\nabla_u E[J] = 2 a b+2 b^2 u+2 g \lambda -2 \lambda  u = 0
$$

Isolating $u$ gives:

$$
u^* = \frac{g \lambda -a b}{b^2+\lambda}
$$

Similarly to the signal dependent case, we can simplify by partial fraction decomposition:

$$
u^* = \frac{-gb^2-a b}{b^2+\lambda }+g
$$

# Results

## Signal Dependent Noise Corruption

**Part 1**

As computed above, the optimal control input $u^*$ is given by:

$$
u^* = \frac{-gb^2-a b}{\left(c^2+1\right) \left(b^2+\lambda\right)}+\frac{g}{c^2+1}
$$

**Part 2**

Considering the limit as $\lambda\rightarrow\infty$ for a given goal $g$:

$$
\lim_{\lambda\rightarrow\infty}x(u^*(t)) = \frac{g}{c^2+1} + \varepsilon
$$

With the expected or average position for this optimal input:

$$
E[x(u^*(t))] = \paren{\frac{1}{c^2+1}}g = Gg
$$

## Gaussian (Signal Independent) Noise Corruption

**Part 1**

As computed above, the control input $u^*$ is given by:

$$
u^* = \frac{-gb^2-a b}{b^2+\lambda
