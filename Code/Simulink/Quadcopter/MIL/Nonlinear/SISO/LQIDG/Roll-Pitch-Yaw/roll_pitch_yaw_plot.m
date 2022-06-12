clc;
clear;
load('31-Mar-2022-21-41-01-LQIDG_3DOF10005.mat');
weighting_matrix = XOpt;
out = sim('Quadcopter_nonlinear_LQIDG');
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

print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_roll.png','-dpng','-r400');

% pitch
% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.state(:, 2), 'r', 'linewidth', 2);
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

print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_pitch.png','-dpng','-r400');

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

print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_yaw.png','-dpng','-r400');

plot(out.tout, out.Omega(:, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_roll_pitch_Omega_1.png','-dpng','-r400');
plot(out.tout, out.Omega(:, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_roll_pitch_Omega_2.png','-dpng','-r400');
plot(out.tout, out.Omega(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_roll_pitch_Omega_3.png','-dpng','-r400');
plot(out.tout, out.Omega(:, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/3DOF/lqidg_roll_pitch_Omega_4.png','-dpng','-r400');