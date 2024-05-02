function [next_x, next_dx] = nextState(x, dx, u, BINS_x, BINS_dx)
% NEXTSTATE returns the next system state given the current state and action.
%
% Inputs:
%   x - current state vector
%   dx - current state derivative vector
%   u - control input vector
%   BINS_x - bins for discretizing the state space in the x dimension
%   BINS_dx - bins for discretizing the state space in the dx dimension
%
% Outputs:
%   next_x - next state vector
%   next_dx - next state derivative vector
% Author: Skyler

    x_bounds  = [-1.5, 0.5];   % Position bounds
    dx_bounds = [-5.0, 5.0];   % Velocity bounds


    [next_x, next_dx] = update_state(x, dx, u);

    % Clamp the next position to stay within bounds
    next_x = clip(next_x, x_bounds);

    % Clamp the next velocity to stay within bounds
    next_dx = clip(next_dx, dx_bounds);


    % Convert to grid indices
    next_x = mapToGrid(next_x, BINS_x);
    next_dx = mapToGrid(next_dx, BINS_dx);
end
