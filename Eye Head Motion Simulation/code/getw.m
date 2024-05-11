function w_prev = getw(A, K, Qx, Qy, We, Wx, beta, lam, p)
%GETW Summary of this function goes here
%   Detailed explanation goes here


coeff = (lam * beta) / (1 + beta * p);

x1 = (Qx + A * K * Qy * K' * A');

w_mat = Wx * Qx + We * x1 + coeff;

w_prev = trace(w_mat);

end

