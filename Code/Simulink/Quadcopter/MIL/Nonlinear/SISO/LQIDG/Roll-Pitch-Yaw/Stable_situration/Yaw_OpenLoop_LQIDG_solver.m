% clear
% clc
QuadConstants;
global A B Q n S1 S2 R1_inv R2_inv

A = [0  1 ;
     0  0];
% A for LQIDG
A = [A      , zeros(2) ;
     eye(2) , zeros(2)];
B = [0 ;
     1];
B = [B; zeros(2, 1)];

q_v = [10^weighting_matrix(9 ) % psi
       10^weighting_matrix(10)
       10^weighting_matrix(11)
       10^weighting_matrix(12)]; % r
Q      = diag(q_v);
R1     = eye(1);
R1_inv = R1^-1;
R2     = 10^weighting_matrix(13);
R2_inv = R2^-1;
S1     = B* R1_inv * B';
S2     = B* R2_inv * B';
h_v = [10
       10
       10
       10];
H	 = diag(h_v);
tf     = 15;
p0	= [H;H];
n	= 4;
p0	= reshape(p0,2 * n^2,1);
global t_p p_arr
[t_p,p_arr] = ode45(@diff_eq_Riccati,[tf,0],p0);

% x0 = [1 ; % pitch
%       0]; % q 

p_t	= p_arr(end, :);
p	= reshape(p_t,2 * n,n);
p1 = p(1:n, :);
p2 = p(n+1: end, :);

% all player
LQIDG_openloop_yaw = (R1_inv * B' * p1) ;
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
% function rad = rpm2rad_sec(rpm)
% rad = rpm / 60 * 2 * pi;
% end