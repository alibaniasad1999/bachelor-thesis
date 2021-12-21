QuadConstants;
A = [0 1;
    B1 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
load('21-Dec-2021-11-27-00-noise_ite_Pitch_LQR630.mat');
weighting_matrix = XOpt;
Q1 = 1000;
Q2 = 100;
R  = 10;
Q = diag([Q1, Q2]);
[~, K, ~] = icare(A, B, Q, R)