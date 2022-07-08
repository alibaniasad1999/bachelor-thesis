load('11-Jun-2022-12-19-13-noise_ite_Roll_LQDG500.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_Model_LQDG');

% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_state_nn(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\phi_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQDG Controller', 'Location','northeast');
print('../../../../../../../../Figures/MIL/LQDG/Roll/lqdg_roll_nn.png','-dpng','-r400');
% subplot(2,1,2);
out.u_nn = out.u_nn/A3;
omega_2 = sqrt((4*(2000*2*pi/60)^2 + 2*out.u_nn)/4);
omega_2 = real(omega_2);
omega_2 = (6000*2*pi/60>omega_2).*(omega_2>=1300*2*pi/60).* omega_2 +...
    (omega_2<1300*2*pi/60)*1300*2*pi/60 + (omega_2>6000*2*pi/60)*6000*2*pi/60;
% omega_2 = (omega_2==0)*1300*2*pi/60 + omega_2;
omega_4 = sqrt((4*(2000*2*pi/60)^2 - 2*out.u_nn)./4);
omega_4 = real(omega_4);
omega_4 = (6000*2*pi/60>omega_4).*(omega_4>=1300*2*pi/60).* omega_4 +...
    (omega_4<1300*2*pi/60)*1300*2*pi/60 + (omega_4>6000*2*pi/60)*6000*2*pi/60;
% omega_2 = (omega_2==0)*1300*2*pi/60 + omega_2;
plot(out.tout, omega_2, 'k');
% plot(out.tout, out.Omega(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQDG/Roll/lqdg_roll_omega_2_nn.png','-dpng','-r400');
plot(out.tout, omega_4, 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQDG/Roll/lqdg_roll_omega_4_nn.png','-dpng','-r400');
% hold off;

% subplot(2,1,1);
% plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
% hold on;
% plot(out.tout, out.roll_state(:, 1), 'r', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('$\phi_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% legend('Setpoint', 'LQDG Controller', 'Location','northeast');
% subplot(2,1,2);
% plot(out.tout, out.u_nn*J_xx);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('Control Command (Moment)', 'interpreter', 'latex', 'FontSize', 12);
% 
% print('../../../../../../../../Figures/MIL/LQDG/Roll/lqdg_roll_nn.png','-dpng','-r400');