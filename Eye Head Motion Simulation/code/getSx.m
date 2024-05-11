function Sx_next = getSx(A, B, H, G, K, Sxe, Se, Sx)
%GETSX Summary of this function goes here
%   Detailed explanation goes here


x1 = A - (B * G);
x2 = A *  K * H  ; 


Sx_next = x1 * Sx  * x1'  + ... 
          x1 * Sxe * x2'  + ... 
          x2 * Sxe'* x1'  + ... 
          x2 * Se' * A';

end

