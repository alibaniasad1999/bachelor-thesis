syms a real
A = [0 1 ;
     a 0];
syms b real
B = [0 ;
     b];
syms q1 q2
Q = diag([q1, q2]);
syms R1 real
R1_inv = R1^-1;
syms R2 real
R2_inv = R2^-1;
S1  = B * R1_inv * B';
S2  = B * R2_inv * B';
syms k11_1 k12_1 k22_1 real
k1 = [k11_1 k12_1 ;
      k12_1 k22_1];
syms k11_2 k12_2 k22_2 real
k2 = [k11_2 k12_2 ;
      k12_2 k22_2];
eq1	= -(A - S2 * k2)' * k1 - k1 * (A - S2 * k2) + k1 * S1 * k1 - Q;
eq2	= -(A - S1 * k1)' * k2 - k2 * (A - S1 * k1) + k2 * S2 * k2 - Q;
  