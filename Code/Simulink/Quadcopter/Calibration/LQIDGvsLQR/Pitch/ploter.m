clear;
clc;
%% plot data %%
time = 0:0.02:10; % set time from start
sim_time = 0:0.02:20;
load('pitch_LQIDG.mat') % load data
% sim_time = 0:0.02:20;
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, 180/pi*pitch_LQIDG(find(sim_time == 5):find(sim_time == 15), 1)+0.5, '--k', 'linewidth', 2);
% hold off;
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
% legend('Setpoint', 'LQIR-DGC', 'Location','northeast', 'FontSize', 20);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_pitch.png','-dpng','-r400');
% plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
% hold on;
% plot(time, pitch_LQIDG(find(sim_time == 5):find(sim_time == 15), 1), 'k', 'linewidth', 2);
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('$\theta_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

load('pitch_LQR.mat')
sim_time = 0:0.02:15;

plot(time, 180/pi*pitch_LQR.signals.values(find(sim_time == 5):end, 1), '--b', 'linewidth', 2);
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('$\theta_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

legend('Setpoint', 'LQIR-DG', 'LQR', 'Location','northeast', 'FontSize', 20);
axis([0 10 -60 40])
print('../../../../../../Figures/Calibration/LQIDGvsLQR/Pitch/lqidgvslqr_pitch.png','-dpng','-r400');
