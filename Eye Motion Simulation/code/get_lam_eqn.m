function [smat, y] = get_lam_eqn(A, b, x0, m, k)
%EXPECTATION Summary of this function goes here
% m  is the iteration
% x0 is the inital state
% 
  
    S = [1; 0; 0];
    g = pi/5;
    % Initialize the series matrix with zeros
    smat = zeros(k, m+k-1);
    y = zeros(1, k);

    % Construct the series matrix
    for i = 1:k
        term1 = S'*A^(m+i-2)*x0;
        for  j = 1:(m+k+1)
            if m-j+i-1 >= 0 
                smat(i,j) = S'*A^(m-j+i+1) * b;
            end 
        end
        y(i) = -term1 + g;
    end

end
