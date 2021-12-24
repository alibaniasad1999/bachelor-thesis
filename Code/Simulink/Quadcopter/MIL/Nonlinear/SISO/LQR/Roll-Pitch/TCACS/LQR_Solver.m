QuadConstants;
% roll
A = [0 1;
    A1 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
Q1 = 10^(weighting_matrix(1));
Q2 = 10^(weighting_matrix(2));
R  = 10^weighting_matrix(3);
Q = diag([Q1, Q2]);
[~, K_roll, ~] = icare(A, B, Q, R);
% pitch
A = [0 1;
    B1 0];
[~, K_pitch, ~] = icare(A, B, Q, R);