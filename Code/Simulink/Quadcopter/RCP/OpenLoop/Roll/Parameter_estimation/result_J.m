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
%% trajectory %%
load('Roll_RP_v01.mat');
Gamma3_array = zeros(1, 9);
Gamma3_array(1) = Izz/Gamma;
Gamma3_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(2).Value;
Gamma3_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(2).Value;
Gamma3_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(2).Value;
Gamma3_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(2).Value;
Gamma3_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(2).Value;
Gamma3_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(2).Value;
Gamma3_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters(2).Value;
Gamma3_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters(2).Value;


plot(0:length(Gamma3_array)-1, Gamma3_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_3$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll/roll_parameter_Gamma3','-depsc');

Gamma5_array = zeros(1, 9);
Gamma5_array(1) = I_rotor/Ixx;
Gamma5_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(1).Value;
Gamma5_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(1).Value;
Gamma5_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(1).Value;
Gamma5_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(1).Value;
Gamma5_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(1).Value;
Gamma5_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(1).Value;
Gamma5_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters(1).Value;
Gamma5_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters(1).Value;


plot(0:length(Gamma5_array)-1, Gamma5_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_5$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll/roll_parameter_Gamma5','-depsc');


