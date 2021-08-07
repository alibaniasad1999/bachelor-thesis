clear
clc

global A B Q n S1 S2 R1_inv R2_inv U_1 U_2 U_3 U_4
U_1   = []; % save data u1
U_2   = []; % save data u2
U_3   = []; % save data u3
U_4   = []; % time for u saver
[A, B] = Quadcopter_system(zeros(6, 1), ones(4, 1) * 2000);
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

[t,x] = ode45(@diff_eq_states,[0,tf],x0);
figure(101)
plot(t, x)
legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
    'interpreter', 'latex')
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$System~State$', 'interpreter', 'latex');

U = [U_1; U_2; U_3; U_4];
U = radpersec2rpm(U);
figure(102)
plot(linspace(0, tf, length(U)), U);
xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
ylabel('$RPM$', 'interpreter', 'latex');
legend('$\omega_1$', '$\omega_2$', '$\omega_3$','$\omega_4$' ,...
    'interpreter', 'latex')

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

function d = diff_eq_states(~,x)
global n u A B R1_inv R2_inv U_1 U_2 U_3 U_4
global p_arr

p_t	= p_arr(end, :);
p	= reshape(p_t,2 * n,n);
p1 = p(1:n, :);
p2 = p(n+1: end, :);

% all player
% u =  (-R1_inv * B' * p1 - R2_inv * B' * p2) * x + rpm2rad_sec(2000);

% one player
u          = (-R1_inv * B' * p1) * x + rpm2rad_sec(2000);
% [A, B] = Quadcopter_system(x, u);
S1         = B * R1_inv * B';
S2         = B * R2_inv * B';
U_1(end+1) = u(1); % save u1
U_2(end+1) = u(2); % save u2
U_3(end+1) = u(3); % save u3
U_4(end+1) = u(4); % save u4

d	= (A - S1 * p1 - S2 * p2) * x;
end

% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end

% rad/sec to rpm
function rpm = radpersec2rpm(rad)
rpm = rad * 60 / 2 / pi;
end