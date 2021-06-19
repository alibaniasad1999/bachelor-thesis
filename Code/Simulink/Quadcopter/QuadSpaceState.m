%%% Quadcopter spacestate %%%
% load data %
QuadConstants;
% dot(x) = Ax + Bu
A = [0  0  0 1 0 0;
     0  0  0 0 1 0;
     0  0  0 0 0 1;
     A1 0  0 0 0 0;
     0  B1 0 0 0 0;
     0  0  0 0 0 0];
B = [0   0   0   0;
     0   0   0   0;
     0   0   0   0;
     0   A3  0  -A3;
     B3  0  -B3  0;
     C2 -C2  C2  C2];