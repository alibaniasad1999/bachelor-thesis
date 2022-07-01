clc;
clear;
load('12-Jun-2022-15-09-03-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_LQIDG_Model');

% subplot(2,1,1);
plot(out.tout, zeros(1, length(out.tout)), '--k', 'linewidth', 2);
hold on;
plot(out.tout, out.roll_state(:, 1), 'r', 'linewidth', 2);
hold off;
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
legend('Setpoint', 'LQIDG Controller', 'Location','northeast');
print('../../../../../../../../Figures/MIL/LQIDG/Roll/lqidg_roll.png','-dpng','-r400');
% subplot(2,1,2);
out.u = out.u/A3;
omega_2 = sqrt((4*(2000*2*pi/60)^2 + 2*out.u)/4);
omega_2 = real(omega_2);
omega_2 = (6000*2*pi/60>omega_2).*(omega_2>=1300*2*pi/60).* omega_2 +...
    (omega_2<1300*2*pi/60)*1300*2*pi/60 + (omega_2>6000*2*pi/60)*6000*2*pi/60;
% omega_2 = (omega_2==0)*1300*2*pi/60 + omega_2;
omega_4 = sqrt((4*(2000*2*pi/60)^2 - 2*out.u)./4);
omega_4 = real(omega_4);
omega_4 = (6000*2*pi/60>omega_4).*(omega_4>=1300*2*pi/60).* omega_4 +...
    (omega_4<1300*2*pi/60)*1300*2*pi/60 + (omega_4>6000*2*pi/60)*6000*2*pi/60;
% omega_2 = (omega_2==0)*1300*2*pi/60 + omega_2;
plot(out.tout, omega_2, 'k');
% plot(out.tout, out.Omega(:, 3), 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{2_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll/lqidg_roll_omega_2.png','-dpng','-r400');
plot(out.tout, omega_4, 'k');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('$\omega_{4_{(rad/\sec)}}$', 'interpreter', 'latex', 'FontSize', 18);
print('../../../../../../../../Figures/MIL/LQIDG/Roll/lqidg_roll_omega_4.png','-dpng','-r400');
