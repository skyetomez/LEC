function [Khistory] = calculateKalmanGains(A, B, C1, C2, G, H, Qx, Qy, x0, numStep)
%CALCULATEKALMANGAINS This function will compute the Kalman 
% gains for each time step. As alluded to in previous discussion, 
% one input to this function should be the optimal feedback gains. 
%  

% Initialize matrices
Sxe = zeros(size(A));                  % (7,7)
Sx = x0 * x0';                         % (7,7)
Se = zeros(size(A, 1), size(H, 2));    % (7,2) b/c size(H) = (2,7)

Khistory = zeros(size(A, 1), size(H, 1), numStep); %(7,2,numsteps)


for step = 1:numStep


Khistory(:,:, step)  =  getK(H, Se, Qy);
K                    =  Khistory(:,:, step);

Sxe_next = getSxe(A, B, H, G(:,:,step), K, Sxe);
Se_next  = getSe(A, B, C1, C2, G(:,:,step), H, K, Qx, Se, Sx);
Sx_next  = getSx(A, B, H, G(:,:,step), K, Sxe, Se, Sx);


% Update Se
Se = Se_next;
Sx = Sx_next;
Sxe = Sxe_next;

end

end

