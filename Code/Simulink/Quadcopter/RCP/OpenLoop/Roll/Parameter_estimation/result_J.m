% parameter estimation figure result
load_data;
load('result.mat');
%% scenario IV
% subplot(2,1,1);
% roll
plot(time, out.scenario_IV(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll/roll','-depsc');


