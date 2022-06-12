load('11-Jun-2022-12-04-56-noise_ite_Roll_LQR_no1000.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_LQR_Model');

subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_state(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQR Controller', 'Location','northeast');
subplot(2,1,2);
plot(out.tout, out.u*J_xx);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('Control Command (Moment)', 'interpreter', 'latex', 'FontSize', 12);

print('../../../../../../../../Figures/MIL/LQR/Roll/lqr_roll.png','-dpng','-r400');