%% HW19
% Open Loop Optimal Control 

%% Student Info
% Name: [Skyler Thomas]
% JHED-ID: [sthom215]

clc, clear all, close all;
cd /home/skyler/Documents/SP2024/580_691/wk11/HW19

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Minimize the variance because we have signal dependent noise
% We have a cost and a constaint so we need lagrange multipliers. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k = 50;
p = 120; 
%% Hyperparameters

A = [[1, 1e-3, 0]; [-0.34, 0.92, 0.34]; [0, 0, 0.9]];
S = [1; 0; 0];
b = [0; 0; 0.1];
eta = 1e-3;

x_init = zeros(3,1);
fg = pi/5;

kappa = 0; 
%% Expectation Block

[B3, y] = get_lam_eqn(A,b,x_init, p,k);

%% Noise Block;

B1 = zeros(p,1);

for ii = 1:p
    B1(ii) = 2*(kappa^2)*S'*A^(p-ii)*(b*b')*(A^(p-ii))'*S;   
end

B1 = diag(B1);

%% Sum Block 
% Upper triangular in the lambdas. 
% size p x k 
B2 = zeros(p+k-1, k);
% for each col 
for ii = 1:k
    % for each col entry 
    for jj = 1:p+k-1
        if p-jj-1+ii >= 0
        B2(jj, ii) = S'*A^((p-jj-1)+(ii))*b;
        end
    end      
end 

%% Create system of equations

Z1 = zeros(p,k-1);
Z2 = zeros(k-1,p+k-1);
Z5 = zeros(k,k);

%(pxp) ... (p+k-1xk)
C = [[[B1,Z1;Z2],B2];B3,Z5];
Y = [zeros(p+k-1,1);y'];


%% Lambdas
steps = p+k-1;
sol = pinv(C)*Y;
u_vec = sol(1:steps);

%% Plot Optimal Motor Commands

states = state_update(A,b,steps,u_vec,x_init);
old_vel = rad2deg(states(2,:))/1000;

figure;

% Optimal Motor Commands
subplot(3,1,1);
plot(u_vec, 'LineWidth', 1.5); 
title('Optimal Motor Commands');
xlabel('Time step'); 
ylabel('Command value'); 
grid on;

% Positions
subplot(3,1,2); 
% Convert radians to degrees for position
plot(rad2deg(states(1,:)), 'LineWidth', 1.5); 
title('Positions');
xlabel('Time step');
ylabel('Position (degrees)');
grid on; 

% Velocity
subplot(3,1,3); 
% Convert rad/s to deg/s and scale for velocity
plot(rad2deg(states(2,:))/1000, 'LineWidth', 1.5); 
title('Velocity');
xlabel('Time step');
ylabel('Velocity (deg/s)');
grid on; 

sgtitle('System without Signal Dependent Noise', 'FontSize', 20);



%% Repeat with kappa .0005

% the blocks are as above but with new kappa

kappa = 6e-5;

[B3, y] = get_lam_eqn(A,b,x_init, p,k);


B1 = zeros(p,1);
for ii = 1:p
    B1(ii) = 2*(kappa^2)*S'*A^(p-ii)*(b*b')*(A^(p-ii))'*S;   
end
B1 = diag(B1);


B2 = zeros(p+k-1, k);
% for each col 
for ii = 1:k
    % for each col entry 
    for jj = 1:p+k-1
        if p-jj-1+ii >= 0
            B2(jj, ii) = S'*A^((p-jj-1)+(ii))*b;
        end
    end      
end 


Z1 = zeros(p,k-1);
Z2 = zeros(k-1,p+k-1);
Z5 = zeros(k,k);

%(pxp) ... (p+k-1xk)
C2 = [[[B1,Z1;Z2],B2];B3,Z5];
Y2 = [zeros(p+k-1,1);y'];
sol2 = pinv(C2)*Y2;
u_vec2 = sol2(1:steps);

states2 = state_update(A,b,steps,u_vec2,x_init);

figure;

% Optimal Motor Commands
subplot(3,1,1); 
hold on;
plot(u_vec, 'DisplayName', 'Motor Command','LineWidth', 1.5); 
plot(pi/5*ones(1,length(u_vec)), ...
    'DisplayName', 'Target','LineWidth', 1.5); 
hold off;
title('Optimal Motor Commands');
xlabel('Time step'); 
ylabel('Command value'); 
legend('show', 'Location', 'best'); 
grid on;

% Positions
subplot(3,1,2); 
hold on;
% Convert radians to degrees for position
plot(rad2deg(states2(1,:)), ...
    'DisplayName', 'Signal Dependent Position','LineWidth',1.5); 
hold off;
title('Positions');
xlabel('Time step');
ylabel('Position (deg)');
legend('show', 'Location', 'best');
grid on;

% Velocity
subplot(3,1,3); 
hold on; 
% Convert rad/s to deg/s and scale for velocity
p1 = plot(rad2deg(states2(2,:))/1000, ...
        'DisplayName', 'Signal Dependent Velocity','LineWidth', 1.5); 
p2 = plot(old_vel, ...
        'DisplayName', 'No Noise Velocity','LineWidth', 1.5); 
hold off; 
title('Velocity (deg/s)');
xlabel('Time (s)');
ylabel('Velocity (deg/s)');
legend('show', 'Location', 'best');
grid on;

sgtitle('Signal Dependent vs Non-Signal Dependent Noise', ...
                'FontSize', 20);




