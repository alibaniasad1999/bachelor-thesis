QuadConstants;
A = [0 1;
     0 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
Q1 = weighting_matrix(1);
Q2 = weighting_matrix(2);
Q3 = weighting_matrix(3);
Q4 = weighting_matrix(4);
R  = weighting_matrix(5);
% I  = weighting_matrix(4)^10;
Q = diag([Q1, 1, 1, .001]);
[~, K, ~] = icare(A_a, B_a, Q, R);