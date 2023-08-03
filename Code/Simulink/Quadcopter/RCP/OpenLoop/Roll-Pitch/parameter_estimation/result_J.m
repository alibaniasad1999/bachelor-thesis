% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
load('result.mat');

%% scenario V (only valid scenario)
% subplot(2,1,1);
% roll
plot(time, SDOSimTest_Log.simout3(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
axis([0 0.2 0 45])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/roll','-depsc');
% pitch
% subplot(2,1,2); 
plot(time, SDOSimTest_Log.simout3(:, 2)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 2)*180/pi, 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
hold off;
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/pitch','-depsc');
%% trajectory %%
load('Quadcopter_nonlinear_Roll_Pitch_spesession_V.mat')
A4_array = zeros(1, 4);
B4_array = zeros(1, 4);

A4_array(1) = A4;
B4_array(1) = B4;

[A4_array(2), B4_array(2)] = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
[A4_array(3), B4_array(3)] = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value;
[A4_array(4), B4_array(4)] = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters.Value;

plot(0:length(A4_array)-1, A4_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_2$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/roll_parameter','-depsc');

plot(0:length(A4_array)-1, B4_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_5$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/pitch_parameter','-depsc');
