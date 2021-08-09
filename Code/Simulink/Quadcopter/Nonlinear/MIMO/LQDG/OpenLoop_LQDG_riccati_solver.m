clear
clc
QuadConstants;
global A B Q n S1 S2 R1_inv R2_inv U_1 U_2 U_3 U_4
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
p0	= [H;H];
n	= 6;
p0	= reshape(p0,2 * n^2,1);
global t_p p_arr
[t_p,p_arr] = ode45(@diff_eq_Riccati,[tf,0],p0);

x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(30) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(30)]; % r

p_t	= p_arr(end, :);
p	= reshape(p_t,2 * n,n);
p1 = p(1:n, :);
p2 = p(n+1: end, :);

% all player
LQDG_openloop_gain = (-R1_inv * B' * p1 - R2_inv * B' * p2) ;
%% Functions %%
function d = diff_eq_Riccati(~,p)
global A Q n S1 S2
p	  = reshape(p,2 * n,n);
p1    = p(1:n, :);
p2    = p(n+1: end, :);
p1dot = -p1*A - A'*p1 - Q +  p1*S1*p1 + p1 * S2 * p2;
p2dot = -p2*A - A'*p2 - Q +  p2*S2*p2 + p2 * S1 * p1;
d	  = reshape([p1dot;p2dot],2 * n^2,1);
end
% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end