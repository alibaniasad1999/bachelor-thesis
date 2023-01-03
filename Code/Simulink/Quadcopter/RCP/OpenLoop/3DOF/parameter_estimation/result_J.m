% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
load('result.mat');
%% scenario V (only valid scenario)
% subplot(3,1,1);
% roll
plot(time, out.simout4(:, 1)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 1)*180/pi, 'r', 'linewidth', 2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
hold off;
axis([0, 0.2, 0, 45])
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/roll','-depsc');
% pitch
% subplot(3,1,2); 
plot(time, out.simout4(:, 2)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 2)*180/pi, 'r', 'linewidth', 2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
hold off;
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/pitch','-depsc');

% subplot(3,1,3);
% yaw
plot(time, out.simout4(:, 3)*180/pi, 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 3)*180/pi, 'r', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
axis([0, 0.2, -3*180/pi, -2*180/pi])
legend('Simulated', 'Measured', 'FontSize', 20);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\psi_{(\textrm{deg})}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/yaw','-depsc');
%% trajectory %%
load('Quadcopter_nonlinear_spesession_parameter.mat')
A2_array = zeros(1, 4);
B2_array = zeros(1, 4);
C1_array = zeros(1, 4);
A2_array(1) = A2;
B2_array(1) = B2;
C1_array(1) = C1;

[A2_array(2), B2_array(2), C1_array(2)] =  SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
[A2_array(3), B2_array(3), C1_array(3)] =  SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value;
[A2_array(4), B2_array(4), C1_array(4)] =  SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters.Value;
% [A2_array(5), B2_array(5), C1_array(5)] =  SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters.Value;

figure
plot(0:length(A2_array)-1, A2_array, '*k', 'markersize', 10)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Value of $\Gamma_1$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/roll_parameter','-depsc');


figure
plot(0:length(B2_array)-1, B2_array, '*k', 'markersize', 10)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Value of $\Gamma_4$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/pitch_parameter','-depsc');


figure
plot(0:length(C1_array)-1, C1_array, '*k', 'markersize', 10)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Value of $\Gamma_7$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/yaw_parameter','-depsc');









