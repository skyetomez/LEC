%% HW21
% Saccade Gain Investigation

%% Student Info
% Name: [Skyler Thomas]
% JHED-ID: [sthom215]

clc, clear all, close all;
cd /home/skyler/Documents/SP2024/580_691/wk12/hw21

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimum gain when motor commands are corrupted by SDN
% * Motor command minmizing E[j]
% * for given goal g, what is g as lambda -> infinity
% Optimum gain when corrupted by Gaussian Noise
% * Motor command minmizing E[j]
% * for given goal g, what is g as lambda -> infinity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p = 120; %ms
a = 1;  
b = 1;
c = 1;
lambda = 1;
g = 15;
%% Hyperparameters

% duration 

x1 = zeros(1,p);
u0 = zeros(size(x1));
min_u1 = (-a*b + g*lambda) / ((1+c^2) * (b^2 + lambda));
vareps = get_noise(x1,u0,c,min_u1);
%% Signal Dependent Noise
figure;
x1 = u0 + vareps;
plot(x1,'b-', 'LineWidth', 2);
title('Signal Dependent Noise of the Eye Movement', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Time', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Amplitude', 'FontSize', 12, 'FontWeight', 'bold');
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
grid on;


%% Plot
figure;
sig = 1;
min_u2 = (-a*b + g*lambda) / (b^2 + lambda);
u2 = min_u2 + u0;
x2 = u2 + normrnd(0, sig, size(u2));

%% Guassian Noise
plot(x2,'b-', 'LineWidth', 2);
title("Signal Independent Noise of the eye movement",'FontSize', 14, 'FontWeight', 'bold');
xlabel('Time', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Amplitude', 'FontSize', 12, 'FontWeight', 'bold');
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
grid on;

%%

costFunc = @(u) costFunction(u, a, b, c, lambda, g);
options = optimoptions('fminunc', 'Display', 'iter', 'Algorithm', 'quasi-newton');

[u_min, J_min] = fminunc(costFunc, u0(1), options);

fprintf('The minimum u found is: %f\n', u_min);
fprintf('The minimum cost J is: %f\n', J_min);


%% run simulation SDN
rng(seed);
p = 120; %ms
a = 4e-3;  
b = 1e-2;
c = 1;
lambda = 2;
g = deg2rad(15);

u0 = zeros(1, p);
u1opt = zeros(size(u0));
costFunc = @(u) costFunction(u, a, b, c, lambda, g);
options = optimoptions('fminunc', 'Display', 'None', 'Algorithm', 'quasi-newton');

for ii = 1:length(u0)
    [u_min, J_min] = fminunc(costFunc, u0(ii), options);
    u1opt(ii) = u_min;
end 

figure;
hold on;
plot(u1opt);
plot(g*ones(size(u1opt)));
hold off;

%% Plot SGN




