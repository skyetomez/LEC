%% Extra Credit
% Mountain Car Problem

%% Student Info
% Name: [Skyler Thomas]
% JHED-ID: [sthom215]

clc, clear all, close all;
cd /home/skyler/Documents/SP2024/580_691/wk13/extra_credit/


%% Hyperparameters
% number of bins for Q-table
n_bins_x = 150;
n_bins_dx = 100;

% Position and velocity bounds
x_int  = struct('upper', -1.5, 'lower', 0.5);  
dx_int = struct('upper', -5.0, 'lower', 5.0);  


% Discretize the state space
BINS_x = linspace(x_int.upper, x_int.lower, n_bins_x);
BINS_dx = linspace(dx_int.upper, dx_int.lower, n_bins_dx);


%% Get Optimal Policy and Value Table:
T = 150;

PolicyGrid = zeros(n_bins_x, n_bins_dx, T);
ValueGrid = initValueGrid(n_bins_x, n_bins_dx, T, BINS_x);

[ValueGrid, PolicyGrid] = bellman(T, ...
                                  BINS_x, ...
                                  BINS_dx, ...
                                  ValueGrid, ...
                                  PolicyGrid);

%% Get Best Policy
optValues = max(ValueGrid, [], 3);
optPolicies = PolicyGrid(:,:,1);

%% Simulate for policy
[positions, velocities, actions] = runSim(optPolicies, T);

%% Visualization 
%State Space
stateSpacePlotter(optPolicies, optValues, BINS_x, BINS_dx)

% Contour Plot of State Space
contourPlotter(optValues,BINS_x, BINS_dx)

% Velocity, Distance, & Actions over Time
time_steps = 1:T;
plotter(actions, velocities, positions, time_steps)


