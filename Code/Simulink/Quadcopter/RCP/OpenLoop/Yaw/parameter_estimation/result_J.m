% parameter estimation figure result
load_data;
load('result.mat');

%% scenario II
% subplot(2,1,1);
% yaw
plot(time, out.scenario_II(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\psi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/yaw/yaw','-depsc');
%% trajectory %%
load('Yaw_RP_v01.mat')
C2_array = zeros(1, 11);
C2_array(1) = Gamma11;
C2_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
C2_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value;
C2_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters.Value;
C2_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters.Value;
C2_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters.Value;
C2_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters.Value;
C2_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters.Value;
C2_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters.Value;
C2_array(10) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_9.Parameters.Value;
C2_array(11) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_10.Parameters.Value;



plot(0:length(C2_array)-1, C2_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_{11}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/yaw/yaw_parameter','-depsc');

