% Distance between rotor center to quad center (m)
% d_cg = 0.2;
d_cg = 0.207098413843917;
% d_cg = 0.250894111568455;
% Distance between D point to quad center (m)
% h_cg = 0.02;
h_cg = 0.00425905946163903;
% 0.0259999235890571
% Thrust factor (non dimensional)
% b = 3.13e-5;
b = 4.06931591902712e-05;
% b = 6.06960130169355e-05
% Rotor torque drag factor (non dimensional)
d = 3.2e-6;
% Total mass (kg)
% m_tot = 0.638;
m_tot = 0.852034403932799;
% 0.670384898556888
% Quad Moment of inertia respect to axix X Body (kg.m^2)
% J_xx = 0.02839;
J_xx = 0.0458596142145294;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
% J_yy = 0.03066;
J_yy = 0.00862342271204996;
% Quad Moment of inertia respect to axix Y Body (kg.m^2)
J_zz = 0.0439;
% % Quad blade Moment (kg.m^2)
J_R = 4.439e-5;
% % Mass on X axis bearing (kg)
m1 = 0;
% % Mass on Y axis bearing (kg)
m2 = 0;
% % Mass on Z axis bearing (kg)
m3 = 0;
% % Bearing radius in X axix (m)
r_x = 0.00;
% % Bearing radius in Y axix (m)
r_y = 0.00;
% % Bearing radius in Z axix (m)
r_z = 0.00;
% % Static bearing friction (non dimensional)
miu_s = 0.00;
% % Dynamic bearing friction (non dimensional)
miu_k = 0.00;
% % Motor constant (non dimensional)
% tau = 0.15;
% % Delay of motor (sec)
T_d = 0.02;
% % Gravity force (m/s^2)
% roll moment
r_m = 0.625667257052261;
g = 9.81;