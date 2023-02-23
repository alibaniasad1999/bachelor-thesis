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
load('Quad_Nonlinear_Pitch_OL_spesession.mat')
B3_array = zeros(1, 3);
B3_array(1) = B3;
B3_array(2) = (B3 + SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value)/2;
B3_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
B3_array(4) = (SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value + B3_array(3))/2;
B3_array(5) = (SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value);

plot(0:length(B3_array)-1, B3_array, '*k', 'markersize', 10)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_6$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/pitch/pitch_parameter','-depsc');
