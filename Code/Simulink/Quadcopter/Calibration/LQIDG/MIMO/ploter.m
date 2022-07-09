clear;
clc;
%% plot data %%
time = 0:0.02:10; % set time from start
load('MIMO_LQIDG1.mat') % load data
sim_time = 0.02:0.02:30;
simout(:,3) = simout(:,3) + 2.3474;
simout(:,2) = simout(:,2) + 0.0203;
% pitch
% subplot(2,1,1);
plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
hold on;
plot(time, simout(find(sim_time == 20):end, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
axis([0 10 -1 0.2])
% % pitch rate q
% subplot(2,1,2);
% plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
% hold on;
% plot(time, pitch_LQIDG(find(sim_time == 5):end, 2), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_roll.png','-dpng','-r400');

plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
hold on;
plot(time, simout(find(sim_time == 20):end, 2), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\theta_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_pitch.png','-dpng','-r400');

plot(time, zeros(1, length(time)), '--k', 'linewidth', 2);
hold on;
plot(time, simout(find(sim_time == 20):end, 3), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\psi_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_yaw.png','-dpng','-r400');


plot(time, simout1(find(sim_time == 20):end, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_Omega_1.png','-dpng','-r400');

plot(time, simout1(find(sim_time == 20):end, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_Omega_2.png','-dpng','-r400');

plot(time, simout1(find(sim_time == 20):end, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_Omega_3.png','-dpng','-r400');

plot(time, simout1(find(sim_time == 20):end, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../Figures/Calibration/LQIDG/MIMO/lqidg_Omega_4.png','-dpng','-r400');
