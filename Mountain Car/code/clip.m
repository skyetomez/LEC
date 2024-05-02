function value = clip(value, bounds)
% CLIP Clips a value within specified bounds.
%   value = clip(value, bounds) clips the input value to be within bounds.
% 
%   Inputs:
%       - value: The value to be clipped.
%       - bounds: A 2-element vector specifying the lower and upper bounds.
%
%   Output:
%       - value: The clipped value.
%   Author: Skyler

    value = max(min(value, bounds(2)), bounds(1));
end
