# Optimal Feedback Control of Gaze


## Introduction
The simulation aims to demonstrate that natural gaze behavior adheres to an optimal control strategy, with a focus on centering the target on the fovea while keeping the eyes aligned with the head. This involves examining how variations in signal-dependent noise impact control strategies.

## Approach

### System Dynamics
The dynamics of the eye are modeled using a third-order linear system, capturing position, velocity, and torque, expressed by the state vector $\mathbf{x}$ and control input $u_e$. The dynamics equation is:

$$
\begin{bmatrix}
\dot{x}_1 \\
\dot{x}_2 \\
\dot{x}_3
\end{bmatrix} = 
\begin{bmatrix}
0 & 1 & 0 \\
-\frac{k_e}{m_e} & -\frac{b_e}{m_e} & \frac{1}{m_e} \\
0 & 0 & -\alpha_2
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2 \\
x_3
\end{bmatrix} +
\begin{bmatrix}
0 \\
0 \\
\frac{1}{\alpha_1}
\end{bmatrix} u_e
$$

### Optimal Control
Optimal feedback control strategies are computed using:

- **Kalman Gain Equation**:

$$
K(t) = S_e(t|t-1)H^T [H S_e(t|t-1) H^T + Q_y]^{-1}
$$

- **Feedback Gain Calculation**:

$$
G(t) = [L + B^T W_x B + B^T W_{xe} C_i B]^{-1} B^T W_x A
$$

## Method
The MATLAB functions implemented include:
- `calculateAandB.m`: Calculates system matrices A and B.
- `simulateCase.m`: Simulates scenarios under various noise conditions.
- `calculateKalmanGains.m`: Computes Kalman gains for state estimation.
- `calculateFeedbackGains.m`: Calculates feedback gains for control inputs.
- `simulateSystem.m`: Applies calculated gains to simulate system dynamics.

## Results
Simulated scenarios with associated discussions:

1. **No Signal Dependent Noise, No Hold**: Baseline scenario. The plot shows stable gaze control with minimal deviation from the target.
2. **Small Signal Dependent Noise, No Hold**: Introduces minor variability. The plot indicates slightly increased fluctuations in gaze trajectory but maintains target alignment.
3. **Large Signal Dependent Noise, No Hold**: Tests system robustness. The plot reveals more significant deviations from the target path, highlighting the effects of increased noise on control accuracy.
4. **Small Signal Dependent Noise, Head Hold 50 ms**: Examines control during brief head immobilization. The plot displays initial stability, followed by minor deviations due to the imposed hold, illustrating the system's response to sudden restraint.
5. **Small Signal Dependent Noise, Head Hold 100 ms**: Longer restraint period. The plot shows initial gaze stability, with noticeable deviations increasing over the hold period, underscoring the challenges in control strategy during extended immobilization.

## Discussion
The project confirms the efficacy of the optimal feedback control model in simulating natural gaze behaviors under varied conditions. The results demonstrate the system's adaptability to external noise and temporary restraints, providing valuable insights into human gaze stabilization mechanisms.

## Code Overview
The MATLAB codebase encompasses detailed function implementations for system modeling, gain calculations, and scenario simulations, ensuring the theoretical concepts are practically applied to achieve the project's objectives.

