% pitch LQR solver
QuadConstants;
A = [0 1;
    B1 0];
B = [0; B3];
Q = diag([100, 100]);
R =1;
[~, K, ~] = icare(A, B, Q, R);