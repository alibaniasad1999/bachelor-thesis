clc;
clear;
load('08-Jul-2022-18-17-17-LQIDG_3DOF_MIMO1500.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Openloop_LQIDG');
% roll
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state_nn(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state_nn(:, 4), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_nn.png','-dpng','-r400');

% pitch
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state_nn(:, 2)+2*pi/180, 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state_nn(:, 5), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_pitch_nn.png','-dpng','-r400');

% yaw
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state_nn(:, 3), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state_nn(:, 6), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_yaw_nn.png','-dpng','-r400');

plot(out.tout, out.omega_nn(:, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_Omega1_nn.png','-dpng','-r400');
plot(out.tout, out.omega_nn(:, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_Omega2_nn.png','-dpng','-r400');
plot(out.tout, out.omega_nn(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_Omega3_nn.png','-dpng','-r400');
plot(out.tout, out.omega_nn(:, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_Omega4_nn.png','-dpng','-r400');