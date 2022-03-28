load('28-Mar-2022-21-13-33-noise_ite_Roll_LQR_no1000.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_LQR_Model');

subplot(2,1,1);
plot(out.tout, out.roll_state(:, 1))
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);

subplot(2,1,2);
plot(out.tout, out.roll_state(:, 2))
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);

print('../../../../../../../../Figures/MIL/LQR/Roll/lqr_roll.png','-dpng','-r400');