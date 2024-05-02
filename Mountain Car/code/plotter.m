function plotter(actions, velocities, positions, time_steps)
% PLOTTER Auxiliry function to plot the outputs of the simulation
%
% Inputs:
% - actions: A vector representing the actions taken over time.
% - velocities: A vector representing the car velocities over time.
% - positions: A vector representing the car positions over time.
% - time_steps: A vector representing the time steps of the simulation.
% Outputs:
% - Figure / None
% Author: Skyler

titleFont = 20;
labelFont = 16;
LineWidth = 2.0;

% Plot actions
subplot(3,1,1);
stairs(time_steps, actions, 'LineWidth', LineWidth, 'Color', [0.2 0.6 0.8]);
title('Actions Taken Over Time', 'FontSize', titleFont);
xlabel('Time Step', 'FontSize', labelFont);
ylabel('Action', 'FontSize', labelFont);
ylim([-1.5 1.5]);
yticks([-1 1]);
yticklabels({'Backward', 'Forward'});
grid on;

% Plot velocities
subplot(3,1,2);
plot(time_steps, velocities, 'LineWidth', LineWidth, 'Color', [0.8 0.2 0.6]);
title('Car Velocity Over Time', 'FontSize', titleFont);
xlabel('Time Step', 'FontSize', labelFont);
ylabel('Velocity', 'FontSize', labelFont);
grid on;

% Plot positions
subplot(3,1,3);
plot(time_steps, positions, 'LineWidth', LineWidth, 'Color', [0.2 0.8 0.2]);
title('Car Position Over Time', 'FontSize', titleFont);
xlabel('Time Step', 'FontSize', labelFont);
ylabel('Position', 'FontSize', labelFont);
grid on;

% Adjust subplot spacing
set(gcf, 'Position', [100, 100, 800, 800]);
set(gcf, 'PaperPositionMode', 'auto');
set(gcf, 'color', 'w');


end
