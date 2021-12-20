pitch = [0, 0];
q_pitch = 8.4754;
q_q = -3.7210;
R_weight =  -1.6927;
% QuadConstants;
% QuadConstants;
%%% constans %%%
% Distance between rotor center to quad center (m)
% d_cg = 0.295;
% Distance between D point to quad center (m)
% h_cg = 0.0078;
% Thrust factor (non dimensional)
% b = 1.10794e-5;
% Rotor torque drag factor (non dimensional)
% d = 3.2e-6;
% Total mass (kg)
% m_tot = 1.774;
% Quad Moment of inertia respect to axix X Body (kg.m^2)
% J_xx = 0.0297598;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
% J_yy = 0.0298565;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
% J_zz = 0.058510;
% Quad blade Moment (kg.m^2)
% J_R = 4.439e-5;
% Mass on X axis bearing (kg)
% m1 = 1.272;
% Mass on Y axis bearing (kg)
% m2 = 1.074;
% Mass on Z axis bearing (kg)
% m3 = 1.693;
% Bearing radius in X axix (m)
% r_x = 0.01;
% Bearing radius in Y axix (m)
% r_y = 0.01;
% Bearing radius in Z axix (m)
% r_z = 0.025;
% Static bearing friction (non dimensional)
% miu_s = 0.003;
% Dynamic bearing friction (non dimensional)
% miu_k = 0.002;
% Motor constant (non dimensional)
% tau = 0.15;
% Delay of motor (sec)
% T_d = 0.02;
% Gravity force (m/s^2)
% g = 9.81;
% A Constants
% A1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_xx);
% A2 = (2*m_tot * h_cg^2 + J_yy -J_zz) / (m_tot * h_cg^2 + J_xx);
% A3 = (b * d_cg) / (m_tot * h_cg^2 + J_xx);
% A4 = (J_R) / (m_tot * h_cg^2 + J_xx);
% A5 = (m1 * g * miu_k * r_x) / (m_tot * h_cg^2 + J_xx);
% B Constants
% B1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_yy);
% B2 = (-2*m_tot * h_cg^2 - J_xx + J_zz) / (m_tot * h_cg^2 + J_yy);
% B3 = (b * d_cg) / (m_tot * h_cg^2 + J_yy);
% B4 = (-J_R) / (m_tot * h_cg^2 + J_yy);
% B5 = (m2 * g * miu_k * r_y) / (m_tot * h_cg^2 + J_yy);
% C Constants
% C1 = (J_xx - J_yy) / (J_zz);
% C2 = (d) / (J_zz);
% C3 = (m3 * g * miu_k * r_z) / (J_zz);
% omega for linearzation 2000 RPM
% Omega = 2000 / 60 * 2 * pi;

x2     = pitch(1);
A22    = 0; %da2dx2
A25    = 1; %da2dx5
A52    = B1 * cos(x2); %da5dx2
A55    = 0; %da5dx5

A      = [A22, A25 ;
          A52, A55];
B      = [0  ;
          B3];
a      = A(2);
b      = B(2);

q1     = 10^q_pitch;
q2     = 10^q_q;
R1     = 1;
R2     = 10^R_weight;
R1_inv = R1^-1;
R2_inv = R2^-1;
k1_ans = zeros(2, 2);
k2_ans = zeros(2, 2);

% algebraic_riccati = K * A + A' * K - K * B * R^-1 * B' * K + Q;
% first equation q1 + 2*a*k12 - (b^2*k12^2)/R = 0
% Ans1 K12 = -m*(k + (k^2 + Q11)^(1/2))
% Ans2 K12 = -m*(k - (k^2 + Q11)^(1/2))
valid_ans = false; % answer validation for statble system
k12_1 = zeros(1, 2);
k12_2 = zeros(1, 2);
k12_1(1) =   (R1*R2*a + R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
k12_1(2) =  -(R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) - R1*R2*a + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
k12_2(1) =  (R1*R2*a + R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
for i = 1:length(k12_1)
    % Second equation 
    % 1 (b^2*k22_1^2)/R1 + (k22_2*b^2*k22_1)/R2 - 2*k12_1 - q2 = 0
    % 2 (b^2*k22_2^2)/R2 + (k22_1*b^2*k22_2)/R1 - 2*k12_2 - q2
    % Ans1 K22_1 =  -((2*k12_1 + q2)*((R1*R2*
    % (2*k12_2 + q2)^2)/(b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))
    % ^(1/2))/(2*k12_2 + q2)
    
    % Ans2 K22_1 = ((2*k12_1 + q2)*((R1*R2*(2*k12_2 + q2)^2)
    % /(b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2))/(2*k12_2 + q2)
    
    % Ans1 K22_2 =  -((R1*R2*(2*k12_2 + q2)^2)/(b^2*
    % (2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2)

    % Ans1 K22_2 = ((R1*R2*(2*k12_2 + q2)^2)/
    % (b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2)
    
    k22_1 = zeros(1, 2);
    k22_2 = zeros(1, 2);
    valid22 = [true; true]; % for validation in complex number
    if ((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2))) < 0 
        valid22(i) = false;
    else
        k22_1(1) = -((2*k12_1(i) + q2)*((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2))/(2*k12_2(i) + q2);
    end
    if ((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2))) < 0
        valid22(i) = false;
    else
        k22_1(2) =  ((2*k12_1(i) + q2)*((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2))/(2*k12_2(i) + q2);
    end
    if ((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2))) < 0
        valid22(i) = false;
    else
        k22_2(1) = -((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2);
        k22_2(2) =  ((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2);
    end
    for j = 1:length(k22_1)
        if valid22(i) == false
            continue
        end
        % Last equation 
        % 1 (b^2*k12_1*k22_1)/R1 - a*k22_1 - k11_1 + (b^2*k12_2*k22_1)/R2
        % Ans k11_1 = (b^2*k12_1*k22_1)/R1 - a*k22_1 + (b^2*k12_2*k22_1)/R2
        % Ans k11_2 = (b^2*k12_1*k22_1)/R1 - a*k22_1 + (b^2*k12_2*k22_1)/R2
        k11_1 = (b^2*k12_1(i)*k22_1(j))/R1 - a*k22_1(j) + (b^2*k12_2(i)*k22_1(j))/R2;
        k11_2 = (b^2*k12_1(i)*k22_2(j))/R1 - a*k22_2(j) + (b^2*k12_2(i)*k22_2(j))/R2;
        temp_K_1 = zeros(2, 2);
        temp_K_1(1, 1) = k11_1;
        temp_K_1(1, 2) = k12_1(i);
        temp_K_1(2, 1) = k12_1(i);
        temp_K_1(2, 2) = k22_1(j);
        temp_K_2 = zeros(2, 2);
        temp_K_2(1, 1) = k11_2;
        temp_K_2(1, 2) = k12_2(i);
        temp_K_2(2, 1) = k12_2(i);
        temp_K_2(2, 2) = k22_2(j);
        if all(eig(A + (-B*R1_inv*B'*temp_K_1 - B*R2_inv*B'*temp_K_2)) < 0)
            k1_ans = temp_K_1;
            k2_ans = temp_K_2;
            valid_ans = true;
            break;
        end
        if valid_ans == true
            break;
        end
    end
    if valid_ans == true
        break;
    end
end
LQDG_gain = R1_inv*B'*k1_ans
% u2 = (R1_inv*B'*k1_ans + R2_inv*B'*k2_ans) *pitch;