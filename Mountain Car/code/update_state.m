function [x_next,xdot_next] = update_state(x,dx, u)
%UPDATE_STATE updates the system state given action
%   The state update equation is given by:
%       velocity update: x + dx*dt
%       position update: dx + dt*(-3*g*cos(3*x) + (u*f-kf*dx)*1/m)
%
%   Inputs:
%       - x: The current position of the system.
%       - dx: The current velocity of the system.
%       - u: The control input to the system.
%   Outputs:
%       - x_next: The next position of the system.
%       - xdot_next: The next velocity of the system.
% Author: Skyler

f  = 0.20; 
g  = 9.80; % gravity
m  = 0.02;
kf = 0.50 * m ;  % coeff of friction


dt = 0.01; 
x_next = x + dx*dt;
xdot_next = dx + dt*(-3*g*cos(3*x) + (u*f-kf*dx)*1/m);



end
