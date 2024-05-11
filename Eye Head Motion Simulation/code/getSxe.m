function Sxe_next = getSxe(A, B, H, G, K, Sxe)
%GETSXE Summary of this function goes here
%   Detailed explanation goes here

left  = A - (B * G) ;         %(7,7) - (7,2)*(2,7)
right = eye(size(A)) - K*H;   %(7,7) - (7,2)*(2,7)

Sxe_next = left * Sxe * right' * A';

end

