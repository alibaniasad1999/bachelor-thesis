% parameter estimation figure result
load_data;
load('result.mat');
%% scenario I
subplot(2,1,1);
% roll
plot(time, out.scenario_I(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_I(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
subplot(2,1,2); 
plot(time, out.scenario_I(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_I(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_parameter_estimation/RCP_roll_S1.png',...
    '-dpng','-r400');
%% scenario II
subplot(2,1,1);
% roll
plot(time, out.scenario_II(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
subplot(2,1,2); 
plot(time, out.scenario_II(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_parameter_estimation/RCP_roll_S2.png',...
    '-dpng','-r400');
%% scenario III
subplot(2,1,1);
% roll
plot(time, out.scenario_III(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
subplot(2,1,2); 
plot(time, out.scenario_III(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_parameter_estimation/RCP_roll_S3.png',...
    '-dpng','-r400');
%% scenario IV
subplot(2,1,1);
% roll
plot(time, out.scenario_IV(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
subplot(2,1,2); 
plot(time, out.scenario_IV(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_parameter_estimation/RCP_roll_S4.png',...
    '-dpng','-r400');
%% scenario V
subplot(2,1,1);
% roll
plot(time, out.scenario_V(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
subplot(2,1,2); 
plot(time, out.scenario_V(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_parameter_estimation/RCP_roll_S5.png',...
    '-dpng','-r400');