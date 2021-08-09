clear
clc

global A1 A2 A3 B1 B2 B3 Q1 Q2 Q3 n R_inv U_1 U_2 U_3 U_t
U_1   = []; % save data u1
U_2   = []; % save data u2
U_3   = []; % save data u3
U_t   = []; % time for u saver

[A1, A2, A3, B1, B2, B3] = SISO_Quadcopter_system(zeros(6, 1)); % Space State

q_v1   = [10
          10];
Q1     = diag(q_v1);

q_v2   = [10
          10];
Q2     = diag(q_v2);

q_v3   = [1000000000
          1000000000];
Q3     = diag(q_v3);

R      = 5;
R_inv  = R^-1;

h_v1 = [10
       10];
H1	 = diag(h_v1);

h_v2 = [10
       10];
H2	 = diag(h_v2);

h_v3 = [1000000000
        1000000000];
H3	 = diag(h_v3);

tf   = 20; % final time

n	= 2;

k01	= H1;
k01	= reshape(k01,n^2,1);

k02	= H2;
k02	= reshape(k02,n^2,1);

k03	= H3;
k03	= reshape(k03,n^2,1);

global t_k_1 k_arr_1
% u1 omega_2^2 - omega_4^2
[t_k_1,k_arr_1] = ode45(@diff_eq_Riccati_u1,[tf,0],k01);

global t_k_2 k_arr_2
% u2 omega_1^2 - omega_3^2
[t_k_2,k_arr_2] = ode45(@diff_eq_Riccati_u2,[tf,0],k02);

global t_k_3 k_arr_3
% u3 omega_1^2 - omega_2^2 + omega_3^2 - omega_4^2
[t_k_3,k_arr_3] = ode45(@diff_eq_Riccati_u3,[tf,0],k03);

% u4 = omega_1^2 + omega_2^2 + omega_3^2 + omega_4^2 Assume 4*2000rpm

x0 = [deg2rad(30) ; % roll
      deg2rad(45) ; % pitch
      deg2rad(30) ; % yaw
      deg2rad(60) ; % p
      deg2rad(50) ; % q
      deg2rad(30)]; % r
 
% System Simulation
[t,x] = ode45(@diff_eq_states,[0,tf],x0);

% control effort
U_4 = ones(1, length(U_1)) * 4 * rpm2rad_sec(2000)^2;

% all U in one
U = [U_1; U_2; U_3; U_4];

% calculate omega
omega_1 = sqrt((U_4 + U_3 + 2 * U_2) / 4);
omega_3 = sqrt((U_4 + U_3 - 2 * U_2) / 4);
omega_2 = sqrt((U_4 - U_3 + 2 * U_1) / 4);
omega_4 = sqrt((U_4 - U_3 - 2 * U_1) / 4);
omega = [omega_1; omega_2; omega_3; omega_4];
% rad/sec to rpm
omega = rad_sec2rpm(omega);
% Plot figure
figure(101)
plot(t, x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$System~State$', 'interpreter', 'latex');
figure(102)
plot(linspace(0, tf, length(omega)), omega);
legend('$\omega_1$', '$\omega_2$', '$\omega_3$','$\omega_4$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$Rad/{\sec}$', 'interpreter', 'latex');

%% Functions %%
% u1
function d = diff_eq_Riccati_u1(~,k)
global A1 B1 Q1 n R_inv
Q    = Q1;
A    = A1;
k    = reshape(k,n,n);
B    = B1;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	 = reshape(kdot, n^2, 1);
end

% u2
function d = diff_eq_Riccati_u2(~,k)
global A2 B2 Q2 n R_inv
Q    = Q2;
A    = A2;
k  	 = reshape(k,n,n);
B    = B2;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	 = reshape(kdot, n^2, 1);
end

% u3
function d = diff_eq_Riccati_u3(~,k)
global A3 B3 Q3 n R_inv
Q    = Q3;
A    = A3;
k    = reshape(k,n,n);
B    = B3;
kdot = -k*A - A'*k - Q + k*B*R_inv*B'*k;
d	 = reshape(kdot, n^2, 1);
end

% System simulation
function d = diff_eq_states(t,x)
global A1 A2 A3 B1 B2 B3 n R_inv
global U_1 U_2 U_3 U_t
global t_k_1 k_arr_1 t_k_2 k_arr_2 t_k_3 k_arr_3 

k_t_1	= interp1(t_k_1, k_arr_1, t);
k_t_2	= interp1(t_k_2, k_arr_2, t);
k_t_3	= interp1(t_k_3, k_arr_3, t);

k_1	= reshape(k_t_1,n,n);
k_2	= reshape(k_t_2,n,n);
k_3	= reshape(k_t_3,n,n);

x1 = [x(1); x(4)];
x2 = [x(2); x(5)];
x3 = [x(3); x(6)];

u1	  = -R_inv*B1'*k_1*x1;
u2	  = -R_inv*B2'*k_2*x2;
u3	  = -R_inv*B3'*k_3*x3;
% save data
U_1(end+1) = u1;
U_2(end+1) = u2;
U_3(end+1) = u3;
U_t(end+1) = t ;

d1 = A1 * x1 + B1 * u1;
d2 = A2 * x2 + B2 * u2;
d3 = A3 * x3 + B3 * u3;

d	= [d1(1) ;
       d2(1) ;
       d3(1) ;
       d1(2) ;
       d2(2) ;
       d3(2)];
end

% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end

% rad/sec to rpm
function rpm = rad_sec2rpm(rad)
rpm = rad * 60 / 2 / pi;
end