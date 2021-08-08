clear
clc

global A B Q n S1 S2 R1_inv U_1 U_2 U_3 U_4
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
k0	= [H;H];
n	= 6;
k0	= reshape(k0,2 * n^2,1);
global t_k k_arr
[t_k,k_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);

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

%{
for i = 1:7
    u_saver = zeros(4,1);
    t_u = zeros(1);
    counter = 1;
    if i == 7
        x0 = ones(6, 1);
    else
        x0 = zeros(6, 1);
        x0(i) = 1;
    end
    [t,x] = ode45(@diff_eq_states,[0,tf],x0);
    figure(101)
    plot(t, x)
    legend('$\phi$', '$\theta$', '$\psi$','$p$','$q$','$r$',...
        'interpreter', 'latex')
    xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
    ylabel('$System~State$', 'interpreter', 'latex');
    figure(102)
    plot(t_u, 2e6*u_saver);
    legend('$\omega_1$', '$\omega_2$', '$\omega_3$','$\omega_4$',...
        'interpreter', 'latex')
    xlabel('$Time_{(\sec)}$', 'interpreter', 'latex');
    ylabel('$RPM$', 'interpreter', 'latex');
    switch i
        case 1
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGroll.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGrollcontrol.png','-dpng','-r500')
        case 2
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGpitch.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGpitchcontrol.png','-dpng','-r500')
        case 3
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGpsi.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGpsicontrol.png','-dpng','-r500')
        case 4
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGp.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGpcontrol.png','-dpng','-r500')
        case 5
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGq.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGqcontrol.png','-dpng','-r500')
        case 6
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGr.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGrcontrol.png','-dpng','-r500')
        otherwise
            print(101, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGall.png','-dpng','-r500')
            print(102, '../../../Figure/Ode45Simulation/LQDG/FeedBackLQDGallcontrol.png','-dpng','-r500')
    end
%     close all;
end
%}
% x(:, 1:3) = wrapToPi(x(:, 1:3));

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

function d = diff_eq_states(~,x)
global n u A B R1_inv R2_inv U_1 U_2 U_3 U_4
global k_arr

k_t	= k_arr(end, :);
k	= reshape(k_t,2 * n,n);
k1 = k(1:n, :);
k2 = k(n+1: end, :);

% all player
u =  (-R1_inv * B' * k1 - R2_inv * B' * k2) * x + rpm2rad_sec(2000);

% one player
% u          = (-R1_inv * B' * p1) * x + rpm2rad_sec(2000);

% [A, B] = Quadcopter_system(x, u);
S1         = B * R1_inv * B';
S2         = B * R2_inv * B';
U_1(end+1) = u(1); % save u1
U_2(end+1) = u(2); % save u2
U_3(end+1) = u(3); % save u3
U_4(end+1) = u(4); % save u4

d	= (A - S1 * k1 - S2 * k2) * x;
end

% rpm to rad/sec
function rad = rpm2rad_sec(rpm)
rad = rpm / 60 * 2 * pi;
end

% rad/sec to rpm
function rpm = radpersec2rpm(rad)
rpm = rad * 60 / 2 / pi;
end