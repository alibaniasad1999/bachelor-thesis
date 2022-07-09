clear;
clc;
%% plot data %%
time = 0:0.02:10; % set time from start
load('pitch_LQR1.mat') % load data
sim_time = 0:0.02:15;
% pitch
% subplot(2,1,1);
plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
hold on;
plot(time, pitch_LQR.signals.values(find(sim_time == 5):end, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\theta_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
% pitch rate q
% subplot(2,1,2);
% plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
% hold on;
% plot(time, pitch_LQIDG(find(sim_time == 5):end, 2), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQR/Pitch/lqr_pitch.png','-dpng','-r400');
plot(time, Omega.signals.values(find(sim_time == 5):end, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQR/Pitch/lqr_pitch_Omega_1.png','-dpng','-r400');

plot(time, Omega.signals.values(find(sim_time == 5):end, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQR/Pitch/lqr_pitch_Omega_3.png','-dpng','-r400');