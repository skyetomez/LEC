% FILEPATH: /home/skyler/Documents/SP2024/580_691/wk13/extra_credit/mapFromGrid.m
function value = mapFromGrid(index, bins)
% mapFromGrid - maps a grid index back to the real-world value.
%   Inputs:
%       - index: The index value of the grid.
%       - bins: A vector of real-world values corresponding to the grid
%         indices.
%
%   Output:
%       - value: The real-world value corresponding to the given index.
%   Author: Skyler

    value = bins(index);
end
