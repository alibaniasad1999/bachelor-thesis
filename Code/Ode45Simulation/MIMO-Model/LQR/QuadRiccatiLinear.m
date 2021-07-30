global A B Q R n R_inv
[A, B] = Quadcopter_system(zeros(6, 1), rpm2radpersec(2000)*ones(4, 1));
Q	= 10*eye(6);
R	= eye(4);
R_inv = R^-1;
H	= 40*eye(6);
tf	= 15;

K0	= H;
n	= 6;
k0	= reshape(K0,n^2,1);

global t_K K_arr
[t_K,K_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);

figure(100)
hold on
plot(t_K,K_arr)

x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(60) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(30)]; % r
  
[t,x] = ode45(@diff_eq_states,[0,tf],x0);

figure(101)
hold on
plot(t,x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
%% Functions
function d = diff_eq_Riccati(~,k)
global A B Q R_inv n
K	 = reshape(k,n,n);
Kdot = -K*A - A'*K - Q + K*B*R_inv*B'*K;
d	 = reshape(Kdot,n^2,1);
end

function d = diff_eq_states(~,x)
global R_inv n A B
global K_arr u

K_t	= K_arr(end, :);
K	= reshape(K_t,n,n);
u	= -R_inv*B'*K*x;
d	= A*x + B*u;
end

function radpersec = rpm2radpersec(rpm)
radpersec = rpm / 60 * 2 * pi;
end