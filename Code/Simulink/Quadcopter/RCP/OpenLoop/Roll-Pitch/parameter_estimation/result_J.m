% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
b = 5.475662723335804e-6;
SDOSimTest_Log = sim('Quadcopter_nonlinear_Roll_Pitch.slx');

%% scenario V (only valid scenario)
% subplot(2,1,1);
% roll
plot(time, SDOSimTest_Log.simout(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
axis([0 0.2 -5 15])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/roll','-depsc');
% pitch
% subplot(2,1,2); 
plot(time, SDOSimTest_Log.simout(:, 2)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 2)*180/pi, 'r', 'linewidth', 2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20, 'location', 'northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
hold off;
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/pitch','-depsc');
%% trajectory %%
load('Roll_Pitch_RP_v01.mat');
Gamma7_array = zeros(1, 7);
Gamma7_array(1) = Ixz/Iyy;
Gamma7_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(2).Value;
Gamma7_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(2).Value;
Gamma7_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(2).Value;
Gamma7_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(2).Value;
Gamma7_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(2).Value;
Gamma7_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(2).Value;


plot(0:length(Gamma7_array)-1, Gamma7_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_7$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/pitch_parameter_Gamma7','-depsc');

%%
Gamma1_array = zeros(1, 7);
Gamma1_array(1) = Ixz/Iyy;
Gamma1_array(2) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters(1).Value;
Gamma1_array(3) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters(1).Value;
Gamma1_array(4) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters(1).Value;
Gamma1_array(5) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters(1).Value;
Gamma1_array(6) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters(1).Value;
Gamma1_array(7) = SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters(1).Value;


plot(0:length(Gamma1_array)-1, Gamma1_array, '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_1$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/roll-pitch/pitch_parameter_Gamma1','-depsc');
