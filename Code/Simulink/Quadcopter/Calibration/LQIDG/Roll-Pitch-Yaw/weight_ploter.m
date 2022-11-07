clear;
clc;
%% plot data %%
% time-5 = 0:0.02:195; % set time-5 from start
load('weight.mat') % load data
% sim_time-5 = 0:0.02:200;
time = linspace(0,200, length(simout));
% pitch
% subplot(2,1,1);
set(gca, 'FontSize', 16)
plot(time-5, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time-5, 180/pi*simout(:, 1), '--k', 'linewidth', 2);
hold off;
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 20 -0.8*180/pi 1*180/pi])
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
% % pitch rate q
% subplot(2,1,2);
% plot(time-5, zeros(1, length(time-5)), 'r', 'linewidth', 2);
% hold on;
% plot(time-5, pitch_LQIDG(:, 2), '--k', 'linewidth', 2);
% hold off;
% xlabel('time-5($\sec)$', 'interpreter', 'latex', 'FontSize', 20);
% ylabel('pitch rate$_{(rpm)}$', 'interpreter', 'latex', 'FontSize', 20);
% legend('Setpoint', 'LQIR-DG', 'Location','northeast');
print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_roll.png','-dpng','-r400');

plot(time-5, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time-5, 180/pi*simout(:, 2), '--k', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 20 -0.8*180/pi 0.8*180/pi])
print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_pitch.png','-dpng','-r400');

plot(time-5, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time-5, 180/pi*simout(:, 3), '--k', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\psi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 20 -0.8*180/pi 0.8*180/pi])
print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_yaw.png','-dpng','-r400');


% plot(time-5, -180/pi*simout(:, 1), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time-5($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Roll', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_roll_e.png','-dpng','-r400');
% 
% 
% plot(time-5, -180/pi*simout(:, 2), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time-5($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Pitch', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_pitch_e.png','-dpng','-r400');
% 
% plot(time-5, -180/pi*simout(:, 3), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time-5($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Yaw', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_yaw_e.png','-dpng','-r400');
