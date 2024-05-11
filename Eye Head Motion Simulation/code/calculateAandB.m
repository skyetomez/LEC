function [Adisc,Bdisc] = calculateAandB(A, B, dt)
%CALCULATEAANDB Summary of this function goes here
%   Detailed explanation goes here

[m, ~] = size(A);
[~, p] = size(B);

% matrix exponent for discrete approximation system
Adisc = [expm(A*dt), zeros(m, 1); zeros(1, m), 1] ;

% matrix exponent for discrete approximation input
Bdisc = [A\(expm(A*dt)-eye(m))*B; zeros(1,p)];

end

