load('29-Mar-2022-17-17-58-noise_ite_Roll_LQDG1000.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_Model_LQDG');

subplot(2,1,1);
plot(out.tout, out.roll_state(:, 1), 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
subplot(2,1,2);
plot(out.tout, out.roll_state(:, 2), 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);

print('../../../../../../../../Figures/MIL/LQDG/Roll/lqdg_roll.png','-dpng','-r400');