% parameter estimation figure result
load_data;
load('result.mat');
%% scenario I
% subplot(2,1,1);
% pitch
plot(time, out.scenario_I(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_I(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
axis([0, 0.5 -15, 45])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
% hold off;
print('../../../../../../../English_Journal/Figure/parameter_estimation/pitch/pitch','-depsc');