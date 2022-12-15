clear;
clc;
%% plot data %%
load('data_film_weight_5.mat')
time = linspace(0, 25, length(simout));

% pitch
% subplot(2,1,1);
set(gca, 'FontSize', 16)
plot(time -7, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -7, 180/pi*simout(:, 1), '--k', 'linewidth', 2);
hold off;
axis([0 20 -10 10])
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
% axis([0 100 -40 20])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_roll','-depsc');

figure()
plot(time -7, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -7, 180/pi*simout(:, 2), '--k', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
% axis([0 20 -30 30])
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_pitch','-depsc');

figure()
plot(time -7, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -7, 180/pi*simout(:, 3), '--k', 'linewidth', 2);
hold off;
% axis([0 20 -80 40])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\psi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
% print('../../../../../../Figures/Calibration/LQIDG/3DOF/Weight/lqidg_yaw','-depsc');
