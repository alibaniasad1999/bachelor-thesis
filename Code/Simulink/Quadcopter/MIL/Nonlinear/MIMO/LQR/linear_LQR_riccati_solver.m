QuadConstants;
global A B Q R n R_inv
[A, B] = Quadcopter_system(zeros(6, 1), rpm2radpersec(2000)*ones(4, 1));

q_v   = [10
         10 
         10
         10
         10
         10];
Q	  = diag(q_v);
R	  = eye(4);
R_inv = R^-1;


h_v   = [10
         10 
         10
         10
         10
         10];
H	  = diag(h_v);

tf	  = 15;

K0	  = H;
n	  = 6;
k0	  = reshape(K0,n^2,1);

global t_K K_arr
[t_K,K_arr]       = ode45(@diff_eq_Riccati,[tf,0],k0);
K_t	              = K_arr(end, :);
K	              = reshape(K_t,n,n);
LQR_feedback_gain = -R_inv*B'*K;
% initial condition
x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(30) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(30)]; % r
  
%% Functions
function d = diff_eq_Riccati(~,k)
global A B Q R_inv n
K	 = reshape(k,n,n);
Kdot = -K*A - A'*K - Q + K*B*R_inv*B'*K;
d	 = reshape(Kdot,n^2,1);
end

% rpm to rad/sec
function radpersec = rpm2radpersec(rpm)
radpersec = rpm / 60 * 2 * pi;
end
