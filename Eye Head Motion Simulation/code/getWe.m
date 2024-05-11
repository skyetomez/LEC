function We_prev = getWe(A, B, G, H, K, Wx, We)
%GETWE Summary of this function goes here
%   Detailed explanation goes here

x1 = (A - A * K * H);

coeff = A' * Wx * B * G;

We_prev =  x1' * We * x1 + coeff;

end

