# Introduction

In the beginning of chapter 8 of [Biological Learning and Control](https://www.amazon.com/Biological-Learning-Control-Representations-Computational/dp/0262016966/ref=sr_1_3?dib=eyJ2IjoiMSJ9.D_u5jyG_I7gaVB3JrO1NrykD_xTPl6mMHbJabr3dZim_NqDhXui1Cxr07tdpU_Tq.dxIOX42w31wx2nDLDsgJRXLdCUNSr835PO9psMM6F_s&dib_tag=se&qid=1714703603&refinements=p_27%3AReza+Shadmehr&s=books&sr=1-3), (saccadic) gain is defined as:

> the ratio between the displacement of the eyes and the displacement of the target.

Formally, this is:

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

We solve the problem by minimizing the expected cost function $E[J]$ with respect to the control input $u$. The cost function is given by:

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

To minimize for $u$, we take the partial derivative of $E[J]$ with respect to $u$ and set it to zero:

$$
\nabla_u E[J] = 2 a b+2 b^2 c^2 u+2 b^2 u+2 c^2 \lambda  u-2 g \lambda +2 \lambda  u = 0
$$

We rearrange these terms to isolate $u$ and find that:

$$
u^* = \frac{g \lambda -a b}{\left(c^2+1\right) \left(b^2+\lambda \right)}
$$

We can simplify this expression further by partial fraction decomposition. By this method, we find that:

$$
u^* = \frac{-gb^2-a b}{\left(c^2+1\right) \left(b^2+\lambda
\right)}+\frac{g}{c^2+1}
$$

## Gaussian (Signal Independent) Noise Derivation

We are also interested in the case where the noise is Gaussian. In this case, the cost function is given by the same equation as in:

$$
E[J]= a^2+2 a b u+b^2 \sigma ^2+b^2 u^2+g^2 \lambda -2 g \lambda  u+\lambda  \sigma
^2+\lambda  u^2
$$

Similarly, we take the derivative with respect to $u$ and find that:

$$
\nabla_u E[J] = 2 a b+2 b^2 u+2 g \lambda -2 \lambda  u = 0
$$

Again, we isolate $u$ and find that:

$$
u^* = \frac{g \lambda -a b}{b^2+\lambda}
$$

Similarly to the signal dependent case, we can simplify by partial fraction decomposition and find that:

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

Next, we consider the limit as $\lambda\rightarrow\infty$ for a given goal $g$. That is:

$$
\lim_{\lambda\rightarrow\infty}x(u^*(t)) = \frac{g}{c^2+1} + \varepsilon
$$

With the expected or average position for this optimal input, we have that:

$$
E[x(u^*(t))] = \left(\frac{1}{c^2+1}\right)g = Gg
$$

## Gaussian (Signal Independent) Noise Corruption

**Part 1**

As computed above, the control input $u^*$ is given by:

$$
u^* = \frac{-gb^2-a b}{b^2+\lambda }+g
$$

**Part 2**

By algebra, we see that:

$$
\lim_{\lambda\rightarrow\infty}x(u^*(t)) = g + \varepsilon
$$

Now, in expectation, the average position for this optimal input is given by:

$$
E[x(u^*(t))] = g = (1)g = Gg
$$

In comparison with the noise dependent case, the control input $u$ is the same but there is no effect of the scale of the signal dependent noise $c$ in the Gaussian case. Specifically, the gain is constantly $1$ and for a given $g$, for optimal input controls, the position, as $\lambda$ approaches infinity, will be $g$ on average.

