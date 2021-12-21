% pitch LQR solver
QuadConstants;
A = [0 1;
    B1 0];
B = [0; B3];
C = eye(2);
D = zeros(2, 1);
Q = diag([100000, 100]);
R =0.000001;
[~, K, ~] = icare(A, B, Q, R)