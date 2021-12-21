% pitch LQR solver
QuadConstants;
A = [0 1;
    B1 0];
B = [0; B3];
C = eye(2);
D = zeros(2, 1);
load('21-Dec-2021-10-13-28-noise_ite_Pitch_LQR250.mat');
weighting_matrix = XOpt;
Q1 = 10^weighting_matrix(1);
Q2 = 10^weighting_matrix(2);
R  = 10^weighting_matrix(3);
Q = diag([Q1, Q2]);
[~, K, ~] = icare(A, B, Q, R);