% Distance between rotor center to quad center (m)
% d_cg = 0.2;
d_cg = 0.188784917589608;
% Distance between D point to quad center (m)
% h_cg = 0.02;
h_cg = 0.0214314682456477;
% Thrust factor (non dimensional)
% b = 1.10794e-5;
b = 1.04061705426176e-05;
% Rotor torque drag factor (non dimensional)
d = 3.2e-6;
% Total mass (kg)
% m_tot = 1.074;
m_tot = 1.15566743590416;
% Quad Moment of inertia respect to axix X Body (kg.m^2)
J_xx = 0.02839;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
% J_yy = 0.03066;
J_yy = 0.0297849273038844;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
J_zz = 0.0439;
% Quad blade Moment (kg.m^2)
J_R = 4.439e-5;
% Mass on X axis bearing (kg)
m1 = 1.272;
% Mass on Y axis bearing (kg)
% m2 = 1.074;
m2 = 1.32156818890849;
% Mass on Z axis bearing (kg)
m3 = 1.693;
% Bearing radius in X axix (m)
r_x = 0.01;
% Bearing radius in Y axix (m)
% r_y = 0.01;
r_y = 0.0122602709267595;
% Bearing radius in Z axix (m)
r_z = 0.025;
% Static bearing friction (non dimensional)
miu_s = 0.003;
% Dynamic bearing friction (non dimensional)
% miu_k = 0.002;
miu_k = 0.00246114046735677;
% Motor constant (non dimensional)
tau = 0.15;
% Delay of motor (sec)
T_d = 0.02;
% Gravity force (m/s^2)
g = 9.81;