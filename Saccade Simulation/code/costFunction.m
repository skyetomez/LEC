function J = costFunction(u,a,b,c,lambda,g)
%COSTFUNCTION Summary of this function goes here
%   u from the previous iteration to get the next iteration
%   the u returned from this minimization is the cost function
%   for the next iteration 

    phi = normrnd(0,1);
    vareps = normrnd(0, c^2*u^2*abs(phi));

    t = a + b*(u + vareps); % t = a + b(u^(p-1) + vareps)
    x = u + vareps; %x^(p) = u^(p-1) + vareps

    J = lambda * (g-x)^2 + t^2; 

end

