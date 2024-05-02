function [vmat, y] = get_u_eqn(A, b,u, m, k, kappa)
%GET_U_EQN Summary of this function goes here
%   constants are as defined by the problem statement except
%  for the following: m - the desired final iteration

S = [1; 0; 0];

vmat = zeros(1, k);

summation = 0; 
for ii  = 1:k
    for jj = 0:m+ii-2
        summation = summation + S'*A^(m+ii-2-jj)*b;
    end 
    vmat(ii) = summation;
    summation = 0;
end 

y = zeros(1, m);

for ii = 1:m
    y(ii) = 2*kappa^2*u(ii)*S'*A^(m-ii)*(b'*b)*A^(m-ii)*S;
end 



end

