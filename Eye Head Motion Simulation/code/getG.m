function G = getG(A, B, C1, C2, L, Wx, We)
%GETG Summary of this function goes here
%   Detailed explanation goes here


quad1  = (B' * Wx * B);
quad2  = (B' * We * B);
term1 = C1' * quad1 * C1 + C2' * quad1 * C2;
term2 = C1' * quad2 * C1 + C2' * quad2 * C2;

coeff = L + term1 + term2 + quad1; % input noise

G = coeff \ (B' * Wx * A); %inverse of first term


end

