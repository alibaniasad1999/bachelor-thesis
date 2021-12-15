% parameter estimation figure result
load_data;
load('result.mat');
%% scenario I
subplot(2,1,1);
% theta
plot(time, out.scenario_I(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_I(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('theta$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,1,2); 
plot(time, out.scenario_I(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_I(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/pitch_parameter_estimation/RCP_pitch_S1.png',...
    '-dpng','-r400');
%% scenario II
subplot(2,1,1);
% theta
plot(time, out.scenario_II(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('theta$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,1,2); 
plot(time, out.scenario_II(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/pitch_parameter_estimation/RCP_pitch_S2.png',...
    '-dpng','-r400');
%% scenario III
subplot(2,1,1);
% theta
plot(time, out.scenario_III(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('theta$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,1,2); 
plot(time, out.scenario_III(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/pitch_parameter_estimation/RCP_pitch_S3.png',...
    '-dpng','-r400');