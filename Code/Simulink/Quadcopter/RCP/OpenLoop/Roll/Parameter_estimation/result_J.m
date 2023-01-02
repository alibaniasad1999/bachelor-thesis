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
load('Quad_Nonlinear_Roll_PS_spesession.mat');
A3_array = zeros(1, 10);
A3_array(1) = A3;
A3_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
A3_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value;
A3_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters.Value;
A3_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters.Value;
A3_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters.Value;
A3_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters.Value;
A3_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters.Value;
A3_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters.Value;
A3_array(10) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_9.Parameters.Value;


plot(0:length(A3_array)-1, A3_array, '*k', 'markersize', 10)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Value of $\Gamma_1$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll/roll_parameter','-depsc');


