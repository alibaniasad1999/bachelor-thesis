QuadConstants;
A = [0 1;
    B1 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
Q1 = 10^weighting_matrix(1);
Q2 = 10^weighting_matrix(2);
Q3 = 10^weighting_matrix(3);
Q4 = 10^weighting_matrix(4);
R  = 10^weighting_matrix(5);
% I  = weighting_matrix(4)^10;
Q = diag([Q1, Q2, Q3, Q4]);
[~, K, ~] = icare(A_a, B_a, Q, R);