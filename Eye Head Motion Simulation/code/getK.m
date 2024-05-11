function K = getK(H, Se, Qy)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


coeff = (H * Se * H') + Qy;

K = (Se * H')/ coeff; 

end