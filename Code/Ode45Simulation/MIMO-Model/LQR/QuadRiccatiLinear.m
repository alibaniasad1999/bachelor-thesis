global A B Q R n R_inv
[A, B] = Quadcopter_system(zeros(6, 1), 1000*ones(4, 1));
Q	= 1000*eye(6);
R	= eye(4);
R_inv = R^-1;
H	= 40*eye(6);
tf	= 10;

K0	= H;
n	= 6;
k0	= reshape(K0,n^2,1);

global t_K K_arr
[t_K,K_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);

figure(100)
hold on
plot(t_K,K_arr)

x0	= ones(6, 1);
[t,x] = ode45(@diff_eq_states,[0,tf],x0);

figure(101)
hold on
plot(t,x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
%%
function d = diff_eq_Riccati(~,k)
global A B Q R_inv n
K	= reshape(k,n,n);
Kdot	= -K*A - A'*K - Q + K*B*R_inv*B'*K;
d	= reshape(Kdot,n^2,1);
end

function d = diff_eq_states(t,x)
global R_inv n A B
global t_K K_arr u

K_t	= K_arr(end, :);
K	= reshape(K_t,n,n);
u	= -R_inv*B'*K*x;
d	= A*x + B*u;
end
