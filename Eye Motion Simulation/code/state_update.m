function [states] = state_update(A,b,n,u,x0)
%STATE_UPDATE 
%   state update equation provided by the homework problem

[m,~] = size(A);

states = zeros(m,n);

% Initialize the first state

states(:,1) = A*x0 + b*(u(1));

% Update states for each time step
for i = 2:n
    states(:,i) = A*states(:,i-1) + b*(u(i-1)); 
end


end

