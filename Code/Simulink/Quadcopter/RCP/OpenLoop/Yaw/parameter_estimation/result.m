% parameter estimation figure result
load_data;
load('result.mat');
%% scenario I
% subplot(2,1,1);
% yaw
plot(time, out.scenario_I(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_I(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% yaw rate
% subplot(2,1,2); 
% plot(time, out.scenario_I(:, 2), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_I(:, 2), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/yaw_parameter_estimation/RCP_yaw_S1.png',...
    '-dpng','-r400');
%% scenario II
% subplot(2,1,1);
% yaw
plot(time, out.scenario_II(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% yaw rate
% subplot(2,1,2); 
% plot(time, out.scenario_II(:, 2), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_II(:, 2), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/yaw_parameter_estimation/RCP_yaw_S2.png',...
    '-dpng','-r400');