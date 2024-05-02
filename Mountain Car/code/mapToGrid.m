function index = mapToGrid(value, bins)
% MAPTOGRID - maps a real-world value to its grid index.
% Inputs:
%   value - The value to be mapped to a bin index.
%   bins  - A vector of bin values.
%
% Output:
%   index - The index of the nearest bin to the given value.
% Author: Skyler

    [~, index] = min(abs(bins - value));
end
