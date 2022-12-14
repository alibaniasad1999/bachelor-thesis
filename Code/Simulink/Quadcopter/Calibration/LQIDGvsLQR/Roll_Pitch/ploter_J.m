clear;
clc;

clear;
clc;
%% plot data %%
load('roll_pitch.mat')
load('LQIR_roll_pitch_data.mat')
load('LQR_roll_pitch_data.mat')
load('PID_roll_pitch_data.mat')
time = 0:0.02:15;
time_new = 0:0.02:25;

% roll
% subplot(2,1,1);
set(gca, 'FontSize', 16)
plot(time-5, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time-5, 180/pi*(roll_pitch_LQIDG(:, 1)+0.0230), '--k', 'linewidth', 2);
plot(time_new-5, 180/pi*LQIR_roll_pitch(:, 1), '--r', 'linewidth', 2);
plot(time_new-5, -180/pi*roll_pitch_LQR.signals.values(:, 1), '--b', 'linewidth', 2);
plot(time_new-5, -180/pi*roll_pitch_PID(:, 1), '--g', 'linewidth', 2);

hold off;
legend('Setpoint', 'LQIR-DG', 'LQIR', 'LQR', 'PID', 'Location','northeast', 'FontSize', 20);
axis([0 10 -20 30])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../English_Journal/Figure/implementation/lqidgvslqr/roll','-depsc');


roll_pitch_LQIDG(1, 2) = roll_pitch_LQIDG(2, 2);
LQIR_roll_pitch(1, :) = LQIR_roll_pitch(2, :);
set(gca, 'FontSize', 16)
plot(time-5, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time-5, 180/pi*roll_pitch_LQIDG(:, 2), '--k', 'linewidth', 2);
plot(time_new-5, -180/pi*LQIR_roll_pitch(:, 2), '--r', 'linewidth', 2);
plot(time_new-5, 180/pi*roll_pitch_LQR.signals.values(:, 2), '--b', 'linewidth', 2);
plot(time_new-5, 180/pi*roll_pitch_PID(:, 2), '--g', 'linewidth', 2);
hold off;
axis([0 10 -60 60])
legend('Setpoint', 'LQIR-DG', 'LQIR', 'LQR', 'PID', 'Location','northeast', 'FontSize', 20);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);

print('../../../../../../English_Journal/Figure/implementation/lqidgvslqr/pitch','-depsc');

