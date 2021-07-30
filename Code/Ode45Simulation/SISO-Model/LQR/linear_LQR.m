clear
clc

global A B1 B2 B3 Q n R_inv U_1 U_2 U_3 U_t
U_1   = []; % save data u1
U_2   = []; % save data u2
U_3   = []; % save data u3
U_t = []; % time for u saver

[A, B1, B2, B3] = Quadcopter_system(zeros(6, 1)); % Space State

q_v = [10
       10 
       10
       10
       10
       10];
Q      = diag(q_v);
R      = 5;
R_inv  = R^-1;

h_v = [10
       10 
       10
       10
       10
       10];
H	 = diag(h_v);

tf   = 15; % final time

k0	= H;
n	= 6;
k0	= reshape(k0,n^2,1);

global t_k_1 k_arr_1
% u1 
[t_k_1,k_arr_1] = ode45(@diff_eq_Riccati_u1,[tf,0],k0);

global t_k_2 k_arr_2
% u2 
[t_k_2,k_arr_2] = ode45(@diff_eq_Riccati_u2,[tf,0],k0);

global t_k_3 k_arr_3
% u3 
[t_k_3,k_arr_3] = ode45(@diff_eq_Riccati_u3,[tf,0],k0);

% all U in one
U = [U_1; U_2; U_3];

x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(00) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(00)]; % r
 
% System Simulation
[t,x] = ode45(@diff_eq_states,[0,tf],x0);

% Plot figure
figure(101)
plot(t, x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$System~State$', 'interpreter', 'latex');
% figure(102)
% plot(t_u, u_saver);
% legend('$\omega_1$', '$\omega_2$', '$\omega_3$','$\omega_4$',...
%     'interpreter', 'latex')
% xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
% ylabel('$Rad/{\sec}$', 'interpreter', 'latex');

%% Functions %%
% u1
function d = diff_eq_Riccati_u1(~,k)
global A B1 Q n R_inv
k	= reshape(k,n,n);
B = B1;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	= reshape(kdot, n^2, 1);
end

% u2
function d = diff_eq_Riccati_u2(~,k)
global A B2 Q n R_inv
k	= reshape(k,n,n);
B = B2;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	= reshape(kdot, n^2, 1);
end

% u3
function d = diff_eq_Riccati_u3(~,k)
global A B3 Q n R_inv
k	= reshape(k,n,n);
B = B3;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	= reshape(kdot, n^2, 1);
end

function d = diff_eq_states(t,x)
global A B1 B2 B3 n R_inv
global U_1 U_2 U_3 U_t
global t_k_1 k_arr_1 t_k_2 k_arr_2 t_k_3 k_arr_3 

k_t_1	= interp1(t_k_1, k_arr_1, t);
k_t_2	= interp1(t_k_2, k_arr_2, t);
k_t_3	= interp1(t_k_3, k_arr_3, t);

k_1	= reshape(k_t_1,n,n);
k_2	= reshape(k_t_2,n,n);
k_3	= reshape(k_t_3,n,n);

u1	  = -R_inv*B1'*k_1*x;
u2	  = -R_inv*B2'*k_2*x;
u3	  = -R_inv*B3'*k_3*x;
% save data
U_1(end+1) = u1;
U_2(end+1) = u2;
U_3(end+1) = u3;
U_t(end+1) = t ;

d	= A * x + B1 * u1 + B2 * u2 + B3 * u3;
end