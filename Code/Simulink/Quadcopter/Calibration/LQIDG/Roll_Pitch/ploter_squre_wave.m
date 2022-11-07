load('test6.mat');
time = linspace(0, 200, length(pitch_LQIDG));
refrence(7946, :) = -20;


plot(time-60, -refrence(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time-60, pitch_LQIDG(:, 1)*180/pi, '--k', 'linewidth', 2);
hold off;
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 100 -40 50])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Square/lqidg_roll.pdf','-desp');

plot(time-60, refrence(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time-60, -pitch_LQIDG(:, 2)*180/pi, '--k', 'linewidth', 2);
hold off;
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 100 -40 50])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Square/lqidg_pitch.pdf','-dpng','-r400');
