clear
clc
global A B Q n S1 S2 R1_inv u_saver t_u counter
[A, B] = Quadcopter_system(zeros(6, 1), ones(4, 1) * 20);
Q      = 100*eye(6);
R1     = eye(4);
R1_inv = R1^-1;
R2     = 2 * eye(4);
R2_inv = R2^-1;
S1     = B* R1_inv * B';
S2     = B* R2_inv * B';
H	   = 1*eye(6);
tf     = 100;
k0	= [H;H];
n	= 6;
k0	= reshape(k0,2 * n^2,1);

% initial variable 

counter = ones(1);
u_saver = zeros(4, 1);
t_u = zeros(1);


global t_k k_arr
[t_k,k_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);
x0 = [0 ;
      0 ;
      1 ;
      0 ;
      0 ;
      0];
  
% Plot figure
[t,x] = ode45(@diff_eq_states,[0,tf],x0);
figure(101)
plot(t, x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$System~State$', 'interpreter', 'latex');
figure(102)
plot(t_u, u_saver);
legend('$\omega_1$', '$\omega_2$', '$\omega_3$','$\omega_4$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$Rad/{\sec}$', 'interpreter', 'latex');

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

function d = diff_eq_states(t,x)
global A B n u R1_inv u_saver counter t_u
global t_k k_arr S1 S2
k_t	= interp1(t_k, k_arr, t);
k	= reshape(k_t,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);
d	= (A - S1 * k1 - S2 * k2) * x;
u = R1_inv * B' * k1 * x;
t_u(counter) = t;
u_saver(:, counter) = u;
counter = counter + 1;
end