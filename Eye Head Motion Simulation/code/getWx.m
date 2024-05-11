function Wx_prev = getWx(A, B, G, H, T, Wx, k1Steps, step)
%GETWX Summary of this function goes here
%   Detailed explanation goes here

if step < k1Steps
    T = zeros(2,2);
end 

Wx_prev = H' * T  * H      ... % 
        + A' * Wx * A      ... % (7x7)*(7x7)*(7x7)
        - A' * Wx * B * G  ;   % (7x7)*(7x7)*(7x2)*(2,7)

end

