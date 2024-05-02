function stateSpacePlotter(PolicyGrid, ValueGrid, BINS_x, BINS_dx)
%STATE_SPACE_PLOTTER Plots the state space, optimal policy, and value function.
% Inputs:
%   - PolicyGrid: Policy Matrix
%   - ValueGrid: Value Matrix
%   - BINS_x: A vector representing the positions in the state space.
%   - BINS_dx: A vector representing the velocities in the state space.
% Outputs:
%   - Figure / None
%   Author: Skyler

figure;
subplot(2,1,1);
imagesc(BINS_x, BINS_dx, PolicyGrid);
title('Optimal Policy from inital conditions', 'FontSize', 20);
xlabel('Position', 'FontSize', 16);
ylabel('Velocity', 'FontSize', 16);
colormap(gca, [1.0 0.0 0.0; 0.0 1.0 0.0]); 
colorbar;
c = colorbar;
c.Ticks = [-0.75, 0.75];
c.TickLabels = {'Backward', 'Forward'};

subplot(2,1,2);
imagesc(BINS_x, BINS_dx, ValueGrid);
title('Maximum Value Function', 'FontSize', 20);
xlabel('Position', 'FontSize', 16);
ylabel('Velocity', 'FontSize', 16);
colorbar;

% Contour Plot of State Space

[X, Y] = meshgrid(BINS_x, BINS_dx);  
figure;
contourf(X', Y', max(ValueGrid, [], 3));  
colorbar;
title('Value Function Across State Space', 'FontSize', 20);
xlabel('Position', 'FontSize', 16);
ylabel('Velocity', 'FontSize', 16);


end

