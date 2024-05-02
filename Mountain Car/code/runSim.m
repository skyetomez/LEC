function [positions,velocities,actions] = runSim(PolicyGrid, num_steps)
%RUN_SIMULATION Runs a simulation of a system using a given policy grid.
%   Inputs:
%       - PolicyGrid: A 2D matrix representing the policy grid.
%       - num_steps: The number of steps to simulate.
%
%   Outputs:
%       - positions: A 1D array containing the positions at each step.
%       - velocities: A 1D array containing the velocities at each step.
%       - actions: A 1D array containing the actions taken at each step.
%  Author: Skyler

x_bounds  = [-1.5, 0.5]; n_bins_x  = 150;
dx_bounds = [-5.0, 5.0]; n_bins_dx = 100;

x0  = -0.5;
dx0 =  0.0;

x = x0;
dx = dx0;

BINS_x = linspace(x_bounds(1), x_bounds(2), n_bins_x);
BINS_dx = linspace(dx_bounds(1), dx_bounds(2), n_bins_dx);


positions = zeros(1,num_steps);
velocities = zeros(1,num_steps);
actions = zeros(1,num_steps);

    for i = 1:num_steps
        % real to grid 
        [~, ix] =  min(abs(BINS_x - x));    % closest x bin
        [~, idx] = min(abs(BINS_dx - dx));  % closest dx bin
        
        % best policy at grid entry
        u = PolicyGrid(ix, idx);
        
        [x_next, dx_next] = update_state(x, dx, u);    
        
        % update position
        x = clip(x_next, x_bounds);
        dx = clip(dx_next, dx_bounds);
       
        positions(i) = x;
        velocities(i) = dx;
        actions(i) = u;
    end
end
