clear;
clc;
%% plot data %%
time = 0:0.02:25; % set time from start
load('3DOF_LQIDG.mat') % load data
sim_time = 0:0.02:30;
% pitch
% subplot(2,1,1);
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, 180/pi*simout(find(sim_time == 5):end, 1), '--k', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(deg)}$', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIDG Controller', 'Location','southeast', 'FontSize', 16);
axis([0 25 -1*180/pi 0.2*180/pi])
% % pitch rate q
% subplot(2,1,2);
% plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
% hold on;
% plot(time, pitch_LQIDG(find(sim_time == 5):end, 2), '--k', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(RPM)}$', 'interpreter', 'latex', 'FontSize', 24);
% legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_roll.png','-dpng','-r400');

plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, 180/pi*simout(find(sim_time == 5):end, 2), '--k', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\theta_{(deg)}$', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DGC', 'Location','northeast', 'FontSize', 16);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_pitch.png','-dpng','-r400');

plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, 180/pi*simout(find(sim_time == 5):end, 3), '--k', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\psi_{(deg)}$', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast', 'FontSize', 16);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_yaw.png','-dpng','-r400');


plot(time, -180/pi*simout(find(sim_time == 5):end, 1), 'b', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(error)}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_roll_e.png','-dpng','-r400');


plot(time, -180/pi*simout(find(sim_time == 5):end, 2), 'b', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\theta_{(error)}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_pitch_e.png','-dpng','-r400');

plot(time, -180/pi*simout(find(sim_time == 5):end, 3), 'b', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\psi_{(error)}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_yaw_e.png','-dpng','-r400');


plot(time, 60/2/pi*simout1(find(sim_time == 5):end, 1), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{1_{(RPM)}}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_Omega_1.png','-dpng','-r400');

plot(time, 60/2/pi*simout1(find(sim_time == 5):end, 2), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(RPM)}}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_Omega_2.png','-dpng','-r400');

plot(time, 60/2/pi*simout1(find(sim_time == 5):end, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{3_{(RPM)}}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_Omega_3.png','-dpng','-r400');

plot(time, 60/2/pi*simout1(find(sim_time == 5):end, 4), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(RPM)}}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/3DOF/lqidg_Omega_4.png','-dpng','-r400');
