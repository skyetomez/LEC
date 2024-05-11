function Se_next = getSe(A, B, C1, C2, G, H, K, Qx, Se, Sx)
%GETSE Summary of this function goes here
%   Detailed explanation goes here

x1 = A * (eye(size(A)) - K * H);

x2 = B * C1 * G;

x3 = B * C2 * G;

Se_next = x1 * Se * A'      + ...
          Qx                + ...
          x2 * Sx * x2'     + ...
          x3 * Sx * x3' ;

end

