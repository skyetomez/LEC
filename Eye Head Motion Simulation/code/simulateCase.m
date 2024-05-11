function simulateCase(x0, A, B, numSteps, k1Steps, T, Thold, numAverage, Qx, Qy, H, C1, C2, L, Delta, goal, figIdx1, figIdx2)
%SIMULATECASE Simulate the system for a given set of parameters 


% Initialize storage for averaging
headAvg = zeros(1, numSteps);
eyeAvg  = zeros(1, numSteps);
gazeAvg = zeros(1, numSteps);

% Perform iterative estimation
fbGains = zeros(size(B, 2), size(A, 1), numSteps);
KalGains = zeros(size(A, 1), size(H, 1), numSteps);

num_iter = 10;
x_range = (0:numSteps - 1) * Delta;
% Iteratively compute Kalman and feedback gains
for iteration = 1:num_iter

KalGains = calculateKalmanGains(A, B, C1, C2, fbGains, H, Qx, Qy, x0, numSteps);
fbGains = calculateFeedbackGains(A, B, C1, C2, H, T, L, KalGains, numSteps, k1Steps);

end

% Simulate system and plot results
for trial = 1:numAverage
    [headTraj, eyeTraj, gazeTraj] = simulateSystem(A,  B, ...
                                                   C1, C2, ...
                                                   fbGains, H,...
                                                   KalGains, ...
                                                   Qx, Qy, ...
                                                   x0, Thold, numSteps);
    headAvg = headAvg + headTraj;
    eyeAvg = eyeAvg + eyeTraj;
    gazeAvg = gazeAvg + gazeTraj;

    % Plot single simulation
    if trial == 1
        figure(figIdx1);
        plot(x_range, [eyeTraj; headTraj; gazeTraj]);
        hold on;
        plot([0, numSteps * Delta], [goal, goal], 'k--', 'LineWidth', 2);
        name = sprintf('Single Simulation: Case %d', figIdx1);
        title(name, 'FontSize', 20);
        xlabel('Time (s)', 'FontSize', 16);
        ylabel('Angle (rad)', 'FontSize', 16);
        
        legend('Eye', 'Head', 'Gaze', 'Goal');
        legend('Location', 'best');

        grid on;
        grid minor;

        eyeColor =  'r';   % Red
        headColor = 'b';  % Blue
        gazeColor = [0.9290 0.6940 0.1250];  % yellow
        goalColor = 'k'; % black

        lines = findobj(gcf, 'Type', 'Line');
        set(lines(4), 'Color', eyeColor);   % Eye
        set(lines(3), 'Color', headColor);  % Head
        set(lines(2), 'Color', gazeColor);  % Gaze
        set(lines(1), 'Color', goalColor);  % Goal

        set(gca, 'FontSize', 12);
    
        sname = sprintf('Single_Simulation_%d.png', figIdx1);
        saveas(gcf, fullfile('assets', sname));

        
    end

end

% Plot averaged trajectories
figure(figIdx2);
plot(x_range, [eyeAvg; headAvg; gazeAvg] / numAverage, 'LineWidth', 2);
hold on;
plot([0, numSteps * Delta], [goal, goal], 'k--','LineWidth', 2);
name = sprintf('Averaged Simulation: Case %d', figIdx2);
title(name, 'FontSize', 20);
xlabel('Time (s)', 'FontSize', 16);
ylabel('Angle (rad)', 'FontSize', 16);

legend('Eye', 'Head', 'Gaze', 'Goal');
legend('Location', 'best');

grid on;
grid minor;

eyeColor =  'r';  % Red
headColor = 'b';  % Blue
gazeColor = [0.9290 0.6940 0.1250];  % yellow
goalColor = 'k'; % black

lines = findobj(gcf, 'Type', 'Line');
set(lines(4), 'Color', eyeColor);   % Eye
set(lines(3), 'Color', headColor);  % Head
set(lines(2), 'Color', gazeColor);  % Gaze
set(lines(1), 'Color', goalColor);  % Goal

set(gca, 'FontSize', 12);

saveas(gcf, fullfile('assets', sprintf('Single_Simulation_%d.png', figIdx2)));

end
