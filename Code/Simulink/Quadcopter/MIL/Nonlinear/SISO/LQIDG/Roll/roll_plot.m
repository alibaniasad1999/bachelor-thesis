clc;
clear;
load('11-Jan-2022-17-02-26-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_LQIDG_Model');

subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_state(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
subplot(2,1,2);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on
plot(out.tout, out.roll_state(:, 2), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');

print('../../../../../../../../Figures/MIL/LQIDG/Roll/lqidg_roll.png','-dpng','-r400');