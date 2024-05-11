function [Ghistory] = calculateFeedbackGains(A, B, C1, C2, H, T, L, K, numSteps, k1Steps)
%CALCULATEFEEDBACKGAINS Summary of this function goes here
%   Detailed explanation goes here

% Initialize matrices for backward recursion

Wx = H' * T * H;
We = zeros(size(A));

% Initialize feedback gains matrix
% (7,2): size(B) = (7,2) and size(A) = (7,7)
Ghistory = zeros(size(B, 2), size(A, 1), numSteps);

for step = numSteps:-1:1

    % get Gain at current step
    Ghistory(:, :, step) = getG(A, B, C1, C2, L, Wx, We);

    % assign current Gain to G
    G = Ghistory(:, :, step);

    % Compute We, Wx, and w at next step
    We_next = getWe(A, B, G, H, K(:,:,step), Wx, We);
    Wx_next = getWx(A, B, G, H, T, Wx, k1Steps, step);

    % Assign updated matrices
    We = We_next;
    Wx = Wx_next;
end

end
