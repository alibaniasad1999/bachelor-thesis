clc;
clear;
load('11-Jan-2022-17-51-07-LQIDG_noise_ite1500.mat');
weighting_matrix = XOpt;
weighting_matrix(7) = 0.6265; % change by me
out = sim('Roll_Pitch_LQIDG');

% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_pitch_state_nn(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_nn.png','-dpng','-r400');
% subplot(2,1,2);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_pitch_state_nn(:, 2), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_pitch_nn.png','-dpng','-r400');
% subplot(2,1,2);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on
% plot(out.tout, out.roll_pitch_state_nn(:, 3), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
% subplot(2,2,4);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on
% plot(out.tout, out.roll_pitch_state_nn(:, 4), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch_nn.png','-dpng','-r400');

plot(out.tout, out.Omega_nn(:, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch_Omega_1_nn.png','-dpng','-r400');
plot(out.tout, out.Omega_nn(:, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch_Omega_2_nn.png','-dpng','-r400');
plot(out.tout, out.Omega_nn(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch_Omega_3_nn.png','-dpng','-r400');
plot(out.tout, out.Omega_nn(:, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch_Omega_4_nn.png','-dpng','-r400');