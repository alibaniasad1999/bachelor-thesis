clear
clc
% feedback game
global A1 A2 A3 B1 B2 B3 n R1_inv R2_inv U_1 U_2 U_3 U_t
U_1   = []; % save data u1
U_2   = []; % save data u2
U_3   = []; % save data u3
U_t   = []; % time for u saver
global S1_1 S2_1 S1_2 S2_2 S1_3 S2_3 Q1 Q2 Q3

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

h_v1 = [10
       10];
H1	 = diag(h_v1);

h_v2 = [10
       10];
H2	 = diag(h_v2);

h_v3 = [1000000000
        1000000000];
H3	 = diag(h_v3);

R1     = eye(1);
R1_inv = R1^-1;
R2     = 2 * eye(1);
R2_inv = R2^-1;

% S1 for u1 u2 u3
% u1
S1_1   = B1 * R1_inv * B1';
S2_1   = B1 * R2_inv * B1';
% u2
S1_2   = B2 * R1_inv * B2';
S2_2   = B2 * R2_inv * B2';
% u3
S1_3   = B3 * R1_inv * B3';
S2_3   = B3 * R2_inv * B3';

tf     = 15; % final time

n	= 2;

k01	= [H1;H1];
k01	= reshape(k01,2 * n^2,1);

k02	= [H2;H2];
k02	= reshape(k02,2 * n^2,1);

k03	= [H3;H3];
k03	= reshape(k03,2 * n^2,1);

global t_k_1 k_arr_1
% u1 
[t_k_1,k_arr_1] = ode45(@diff_eq_Riccati_u1,[tf,0],k01);

global t_k_2 k_arr_2
% u2 
[t_k_2,k_arr_2] = ode45(@diff_eq_Riccati_u2,[tf,0],k02);

global t_k_3 k_arr_3
% u3 
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
global A1 Q1 n S1_1 S2_1
A  = A1;
Q  = Q1;
S1 = S1_1;
S2 = S2_1;
k	= reshape(k,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);
k1dot	= -(A - S2 * k2)' * k1 - k1 * (A - S2 * k2) + k1 * S1 * k1 - Q;
k2dot	= -(A - S1 * k1)' * k2 - k2 * (A - S1 * k1) + k2 * S2 * k2 - Q;
d	= reshape([k1dot;k2dot],2 * n^2,1);
end

% u2
function d = diff_eq_Riccati_u2(~,k)
global A2 Q2 n S1_2 S2_2
A  = A2;
Q  = Q2;
S1 = S1_2;
S2 = S2_2;
k	= reshape(k,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);
k1dot	= -(A - S2 * k2)' * k1 - k1 * (A - S2 * k2) + k1 * S1 * k1 - Q;
k2dot	= -(A - S1 * k1)' * k2 - k2 * (A - S1 * k1) + k2 * S2 * k2 - Q;
d	= reshape([k1dot;k2dot],2 * n^2,1);
end

% u3
function d = diff_eq_Riccati_u3(~,k)
global A3 Q3 n S1_3 S2_3
A  = A3;
Q  = Q3;
S1 = S1_3;
S2 = S2_3;
k	= reshape(k,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);
k1dot	= -(A - S2 * k2)' * k1 - k1 * (A - S2 * k2) + k1 * S1 * k1 - Q;
k2dot	= -(A - S1 * k1)' * k2 - k2 * (A - S1 * k1) + k2 * S2 * k2 - Q;
d	= reshape([k1dot;k2dot],2 * n^2,1);
end

function d = diff_eq_states(t,x)
global A1 A2 A3 n 
% global u_saver counter t_u
global t_k_1 k_arr_1 t_k_2 k_arr_2 t_k_3 k_arr_3 
global R1_inv R2_inv
global U_1 U_2 U_3 U_t B1 B2 B3

k_t_1	= interp1(t_k_1, k_arr_1, t);
k_t_2	= interp1(t_k_2, k_arr_2, t);
k_t_3	= interp1(t_k_3, k_arr_3, t);

k_1	= reshape(k_t_1,2 * n,n);
k_2	= reshape(k_t_2,2 * n,n);
k_3	= reshape(k_t_3,2 * n,n);

k1_1 = k_1(1:n, :);
k2_1 = k_1(n+1: end, :);

k1_2 = k_2(1:n, :);
k2_2 = k_2(n+1: end, :);

k1_3 = k_3(1:n, :);
k2_3 = k_3(n+1: end, :);

x1 = [x(1); x(4)];
x2 = [x(2); x(5)];
x3 = [x(3); x(6)];

u1	 = (-R1_inv*B1'*k1_1 -R2_inv*B1'*k2_1) * x1;
u2	 = (-R1_inv*B2'*k1_2 -R2_inv*B2'*k2_2) * x2;
u3   = (-R1_inv*B3'*k1_3 -R2_inv*B3'*k2_3) * x3;
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
% u = R1_inv * B' * k1 * x;
% t_u(counter) = t;
% u_saver(:, counter) = u;
% counter = counter + 1;
end

% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end

% rad/sec to rpm
function rpm = rad_sec2rpm(rad)
rpm = rad * 60 / 2 / pi;
end