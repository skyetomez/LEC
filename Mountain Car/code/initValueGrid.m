function ValueGrid = initValueGrid(n_bins_x, n_bins_dx, T, BINS_x)
% INITVALUEGRID initalizes the value grid
% Input Arguments:
%   - n_bins_x: Number of bins for x-axis.
%   - n_bins_dx: Number of bins for dx-axis.
%   - T: Number of time steps.
%   - BINS_x: Vector of bin values for x-axis.
%
% Output Argument:
%   - ValueGrid: Initialized value grid.
% Author: Skyler

ValueGrid = zeros(n_bins_x, n_bins_dx, T);
    for xi = 1:n_bins_x
        for vi = 1:n_bins_dx
            ValueGrid(xi, vi, T) = mapFromGrid(xi, BINS_x);
        end
    end
end
