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
%% trajectory %%
load('Pitch_RP_v01.mat');
Gamma8_array = zeros(1, 9);
Gamma8_array(1) = 1/Iyy;
Gamma8_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(1).Value;
Gamma8_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(1).Value;
Gamma8_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(1).Value;
Gamma8_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(1).Value;
Gamma8_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(1).Value;
Gamma8_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(1).Value;
Gamma8_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters(1).Value;
Gamma8_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters(1).Value;


plot(0:length(Gamma8_array)-1, Gamma8_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_8$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/pitch/pitch_paramete_Gamma8','-depsc');



Gamma9_array = zeros(1, 9);
Gamma9_array(1) = I_rotor/Iyy;
Gamma9_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(2).Value;
Gamma9_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(2).Value;
Gamma9_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(2).Value;
Gamma9_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(2).Value;
Gamma9_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(2).Value;
Gamma9_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(2).Value;
Gamma9_array(8) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters(2).Value;
Gamma9_array(9) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_8.Parameters(2).Value;

plot(0:length(Gamma9_array)-1, Gamma9_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_9$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/pitch/pitch_paramete_Gamma9','-depsc');

