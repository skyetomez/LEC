function [headTraj, eyeTraj, gazeTraj] = simulateSystem(A, B, C1, C2,... 
                                                        G, H, K,  ...
                                                        Qx, Qy, ...
                                                        x0, Thold, ...
                                                        numSteps)
%SIMULATESYSTEM This is the final function that you will need 
%   to implement to complete the project. In this function, you will 
%   simulate the eye and head system, along with the optimal control. 
%   Therefore, you will begin at the first time point. 




x = x0;
xhat = x0;

headTraj  = zeros(1, numSteps);
eyeTraj   = zeros(1, numSteps);
gazeTraj  = zeros(1, numSteps);


% Simulate system trajectory
 
for k = 1:numSteps

    % Record trajectory data
    headTraj(k) = x(4);
    eyeTraj(k)  = x(1);
    gazeTraj(k) = headTraj(k) + eyeTraj(k);
    
    % motor command based on current state estimate
    u = -G(:, :, k) * xhat;

    % Generate noise-influenced motor command
    
    varepsx  = mvnrnd(zeros(1,7), Qx);
    C1noisy = C1 * (u .* randn(2,1));
    C2noisy = C2 * (u .* randn(2,1));

    % If within the holding period, set head velocity to zero

    if k <= Thold
        x(4:5) = 0; % Set head-related state variables to zero
    end

    % Update the true state with noise
    x_next = A * x + B * u  + varepsx' + B*(C1noisy + C2noisy);

    % Simulate noisy observation
    varepsy = mvnrnd(zeros(size(H,1),size(xhat,2)), Qy);
    
    y = H * xhat + varepsy';

    % Update state estimation, 
    coeff = y - (H * x_next); %(7x1)
    xhat_next = A * x_next + B * u + A*K(:, :, k) * coeff;
    
    x = x_next;
    xhat = xhat_next;


end

end

