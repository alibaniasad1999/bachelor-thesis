clear
clc
QuadConstants;
global A B Q n S1 S2 R1_inv U_1 U_2 U_3 U_4
U_1   = []; % save data u1
U_2   = []; % save data u2
U_3   = []; % save data u3
U_4   = []; % time for u saver
[A, B] = Quadcopter_system(zeros(6, 1), ones(4, 1) * rpm2rad_sec(2000));
q_v = [10
       10 
       10
       10
       10
       10];
Q      = diag(q_v);
R1     = eye(4);
R1_inv = R1^-1;
R2     = 2 * eye(4);
R2_inv = R2^-1;
S1     = B* R1_inv * B';
S2     = B* R2_inv * B';
h_v = [10
       10 
       10
       10
       10
       10];
H	 = diag(h_v);
tf     = 10;
k0	= [H;H];
n	= 6;
k0	= reshape(k0,2 * n^2,1);
global t_k k_arr
[t_k,k_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);

x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(30) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(30)]; % r
  
k_t	= k_arr(end, :);
k	= reshape(k_t,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);

% all player
LQDG_feedback_gain = (-R1_inv * B' * k1 - R2_inv * B' * k2) ;
%% Functions %%
function d = diff_eq_Riccati(~,k)
global A Q n S1 S2
k	= reshape(k,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);
k1dot	= -(A - S2 * k2)' * k1 - k1 * (A - S2 * k2) + k1 * S1 * k1 - Q;
k2dot	= -(A - S1 * k1)' * k2 - k2 * (A - S1 * k1) + k2 * S2 * k2 - Q;
d	= reshape([k1dot;k2dot],2 * n^2,1);
end

% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end