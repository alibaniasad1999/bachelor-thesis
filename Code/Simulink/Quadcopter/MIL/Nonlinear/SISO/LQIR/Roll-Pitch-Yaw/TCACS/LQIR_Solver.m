QuadConstants;
% roll
A = [0 1;
    A1 0];
B = [0; 1];
C = eye(2);
D = zeros(2, 1);
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
Q1 = 10^(weighting_matrix(1));
Q2 = 10^(weighting_matrix(2));
Q3 = 10^(weighting_matrix(5));
Q4 = 10^(weighting_matrix(4));
R  = 10^weighting_matrix(13);
Q = diag([Q1, Q2, Q3, Q4]);
[~, LQIR_roll, ~] = icare(A_a, B_a, Q, R);
% pitch
A = [0 1;
    B1 0];
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
Q1 = 10^(weighting_matrix(5));
Q2 = 10^(weighting_matrix(6));
Q3 = 10^(weighting_matrix(7));
Q4 = 10^(weighting_matrix(8));
Q = diag([Q1, Q2, Q3, Q4]);
[~, LQIR_pitch, ~] = icare(A_a, B_a, Q, R);
% yaw
A = [0 1;
     0 0];
A_a = [A zeros(2) ;...
       C zeros(2)];
B_a = [B; zeros(2, 1)];
Q1 = 10^(weighting_matrix(9 ));
Q2 = 10^(weighting_matrix(10));
Q3 = 10^(weighting_matrix(11));
Q4 = 10^(weighting_matrix(12));
Q = diag([Q1, Q2, Q3, Q4]);
[~, LQIR_yaw, ~] = icare(A_a, B_a, Q, R);