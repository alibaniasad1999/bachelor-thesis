QuadConstants;
A = [0 1;
    A1 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
load('25-Dec-2021-14-36-13-noise_ite_Roll_LQIR1005.mat');
weighting_matrix = XOpt;
Q1 = 10^weighting_matrix(1);
Q2 = 10^weighting_matrix(2);
Q3 = 10^weighting_matrix(3);
Q4 = 10^weighting_matrix(4);
R  = 10^weighting_matrix(5);
Q = diag([Q1, Q2, Q3, Q4]);
[~, K, ~] = icare(A_a, B_a, Q, R);