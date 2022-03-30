clc;
clear;
load('11-Jan-2022-17-51-07-LQIDG_noise_ite1500.mat');
weighting_matrix = XOpt;
weighting_matrix(7) = 0.6265; % change by me
out = sim('Roll_Pitch_LQIDG');

subplot(2,2,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_pitch_state(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
subplot(2,2,2);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_pitch_state(:, 2), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');
subplot(2,2,3);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on
plot(out.tout, out.roll_pitch_state(:, 3), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
subplot(2,2,4);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on
plot(out.tout, out.roll_pitch_state(:, 4), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast');


print('../../../../../../../../Figures/MIL/LQIDG/Roll_Pitch/lqidg_roll_pitch.png','-dpng','-r400');