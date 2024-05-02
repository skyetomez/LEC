function contourPlotter(ValueGrid, BINS_x, BINS_dx) 
%CONTOURPLOTTER Plots a contour plot of a value grid across state space.
%   The contour plot represents the value function 
%   as a continous function across the state space.
%
%   Inputs:
%       - ValueGrid: A 3D matrix representing the value grid.
%       - BINS_x: A vector representing the positions.
%       - BINS_dx: A vector representing the velocities.
%
%   Author: Skyler

[X, Y] = meshgrid(BINS_x, BINS_dx);  
figure;
contourf(X', Y', max(ValueGrid, [], 3));  
colorbar;
title('Value Function Across State Space', 'FontSize', 20);
xlabel('Position', 'FontSize', 16);
ylabel('Velocity', 'FontSize', 16);

end
