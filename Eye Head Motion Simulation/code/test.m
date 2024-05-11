%% Student Info
% Name: [Skyler Thomas]
% JHED-ID: [sthom215]

clc, clear all, close all;
cd /home/skyler/Documents/SP2024/580_691/FINAL_PROJECT

% Set random seed for reproducibility
rng(0);

% Define matrix dimensions
n = 7; % Dimension of state vector
m = 2; % Dimension of control input

% Define test matrices
% Time constants
tau1eye = 0.224;    % seconds
tau2eye = 0.013;    % seconds
alpha1eye = 0.004;  % seconds
tau1head = 0.270;   % seconds
tau2head = 0.15;    % seconds
alpha1head = 0.010; % seconds

% Covariances matrices for state and motor updates
Qx = 10^(-5) * eye(7);
Qy = 0.01 * eye(2);

% The goal direction
goal = 40 * pi/ 180;

% The H matrix
H = [-1,0,0,-1,0,0,1; 1,0,0,0,0,0,0];

% Specify the length of each time step
Delta = 0.002;  % seconds

% Specify the total simulation period
p = 0.3; % seconds

% The time at which we want our gaze to are at the target
k1 = 0.1; % seconds

% The number of discrete steps to reach time point k1
k1Steps = k1 / Delta;

% The number of time steps in the simulation
pSteps = p / Delta;

% The initial state vector
x0 = [0;0;0;0;0;0;goal]; 

% Specify the value of the T matrix. Note that T has this value only after
% k1 time has elapsed. It is zero before.
T =  [10^5,0; 0,300];

% Specify the matrix that determines the motor commands cost
L = [10,0;0,10];

% Number of simulations to average
numAverage = 50;

% Set the number of steps for the recursion
numSteps = 10;
K = zeros(2,7,numSteps);

C1 = [0,0; 0,0];
C2 = [0,0;0,0];
[A, B] = makeAandB(tau1eye, tau2eye, alpha1eye, tau1head, tau2head, alpha1head, Delta);



% Call the calculateFeedbackGains function
% Ghistory = calculateFeedbackGains(A, B, C1, C2, H, T, L, K, numSteps);
Ghistory = calculateFeedbackGains(A, B, H, T, L, K, numSteps);

% Display the results
disp('Ghistory:');
disp(Ghistory);

% Additional checks can be implemented to inspect the correctness of each matrix operation
