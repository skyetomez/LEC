function [ValueGrid, PolicyGrid] = bellman(T, BINS_x, BINS_dx, ValueGrid, PolicyGrid)
% BELLMAN performs the Bellman update for a value iteration algorithm
% It updates the value and policy grids based 
% the time step t of total time T. 
% Inputs:
%   - T: Time horizon
%   - BINS_x: Number of bins for the state variable x
%   - BINS_dx: Number of bins for the state variable xdot
%   - ValueGrid: Value grid representing the expected cumulative rewards
%   - PolicyGrid: Policy grid representing the optimal actions
%
% Outputs:
%   - ValueGrid: Updated value grid
%   - PolicyGrid: Updated policy grid
% Author: Skyler

    actions = [-1, 1];
    [rows, cols, ~] = size(ValueGrid);

    for t = T-1:-1:1
        for xi = 1:rows
            for vi = 1:cols
                x_real = mapFromGrid(xi, BINS_x);
                xdot_real = mapFromGrid(vi, BINS_dx);

                best_value = -inf;
                best_action = 0;

                for action = actions
                    [next_x, next_xdot] = nextState(x_real, ...
                                                    xdot_real, ...
                                                    action, ...
                                                    BINS_x, ...
                                                    BINS_dx);
                    E_value = ValueGrid(next_x, next_xdot, t+1);
                    value = mapFromGrid(next_x, BINS_x) + E_value;

                    if value > best_value
                        best_value = value;
                        best_action = action;
                    end

                end

                ValueGrid(xi, vi, t) = best_value;
                PolicyGrid(xi, vi, t) = best_action;
            end
        end
    end

end
