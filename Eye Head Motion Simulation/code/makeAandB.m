function [A,B] = makeAandB(t1e, t2e, a1e, t1h, t2h, a1h, dt)
%MAKEAANDB Summary of this function goes here
%   Detailed explanation goes here


% Parameters for eye|head system 
me = t1e * t2e; mh = t1h * t2h;
be = t1e + t2e; bh = t1h + t2h;
ke = 1        ; kh = 1; 
a2e= 1        ; a2h= 1;

% state/noise matrices for eyes
Ae = [0,       1,        0; 
    -ke/me, -be/me,     1/me; 
      0 ,      0 ,   -a2e/a1e];

Be = [0;      0;       1/a1e];


% state/noise matrices for head
Ah = [0,       1,        0; 
    -kh/mh, -bh/mh,     1/mh; 
      0 ,      0 ,   -a2h/a1h];

Bh = [0;      0;       1/a1h];


% block diag continuous matrix for full system
% Acont = [Ae, zeros(size(Ae)); zeros(size(Ae)), Ah];
Acont = blkdiag(Ae, Ah);
% Bcont = [Be, zeros(size(Be)); zeros(size(Be)), Bh];
Bcont = blkdiag(Be, Bh);

% get discrete matrix for full system
[A, B] = calculateAandB(Acont, Bcont, dt);

end

