clear;
clc;
%% plot data %%
time = 0:0.02:95; % set time from start
load('disturbance result.mat') % load data
sim_time = 0:0.02:100;
% pitch
% subplot(2,1,1);
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 1)*180/pi, '--k', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(deg)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
% axis([0 10 -1 0.2])
% % pitch rate q
% subplot(2,1,2);
print('../../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Disturbance/lqidg_roll.png','-dpng','-r400');

plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 2)*180/pi, '--k', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\theta_{(deg)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Disturbance/lqidg_pitch.png','-dpng','-r400');
