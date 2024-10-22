clc;
clear;
load('06-Jul-2022-16-52-39-LQIDG_3DOF_MIMO1500.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Openloop_LQIDG');
% roll
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state(:, 4), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll.png','-dpng','-r400');

% pitch
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state(:, 2)+2*pi/180, 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state(:, 5), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_pitch.png','-dpng','-r400');

% yaw
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state(:, 3), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.state(:, 6), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_yaw.png','-dpng','-r400');

plot(out.tout, out.omega(:, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_omega_1.png','-dpng','-r400');
plot(out.tout, out.omega(:, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_omega_2.png','-dpng','-r400');
plot(out.tout, out.omega(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_omega_3.png','-dpng','-r400');
plot(out.tout, out.omega(:, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/MIMO/lqidg_roll_pitch_omega_4.png','-dpng','-r400');