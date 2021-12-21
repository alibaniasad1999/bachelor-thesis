% pitch LQR solver
QuadConstants;
A = [0 1;
    B1 0];
B = [0; B3];
C = eye(2);
D = zeros(2, 1);
Q = diag([10000, 100000]);
R =0.00000001;
[~, K, ~] = icare(A, B, Q, R)