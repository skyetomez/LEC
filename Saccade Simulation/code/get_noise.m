function [vareps] = get_noise(x,u,c)
%GET_STATES Summary of this function goes here
%   Detailed explanation goes here
    % u = u + min_u;
    vareps = zeros(size(x));
    phi  = normrnd(0, 1, size(x));
    for ii = 1:length(u)
        vareps(ii) = normrnd(0, c^2*u(ii)^2*abs(phi(ii)));
    end
end

