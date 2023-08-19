% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
b = 6.0147061633484e-6;
d = 9.92814143029149e-8;
out = sim('Quadcopter_nonlinear.slx');

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
axis([0, 0.2, -45, 30])
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
load('3DOF.mat', 'SDOSessionData');
Gamma10_array = zeros(1, 9);
Gamma2_array = zeros(1, 9);
Gamma4_array = zeros(1, 9);
Gamma6_array = zeros(1, 9);
Gamma10_array(1) = (Ixx - Iyy)*Ixx + Ixz^2/Gamma;
Gamma2_array(1) = Izz*(Izz - Iyy) + Ixz^2;
Gamma4_array(1) = Ixz/Gamma;
Gamma6_array(1) = (Izz - Ixx)/Iyy;

[Gamma10_array(2), Gamma2_array(2), Gamma4_array(2), Gamma6_array(2), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_0.Parameters.Value;
[Gamma10_array(3), Gamma2_array(3), Gamma4_array(3), Gamma6_array(3), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_1.Parameters.Value;
[Gamma10_array(4), Gamma2_array(4), Gamma4_array(4), Gamma6_array(4), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_2.Parameters.Value;
[Gamma10_array(5), Gamma2_array(5), Gamma4_array(5), Gamma6_array(5), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_3.Parameters.Value;
[Gamma10_array(6), Gamma2_array(6), Gamma4_array(6), Gamma6_array(6), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_4.Parameters.Value;
[Gamma10_array(7), Gamma2_array(7), Gamma4_array(7), Gamma6_array(7), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_5.Parameters.Value;
[Gamma10_array(8), Gamma2_array(8), Gamma4_array(8), Gamma6_array(8), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_6.Parameters.Value;
[Gamma10_array(9), Gamma2_array(9), Gamma4_array(9), Gamma6_array(9), ~, ~] =...
    SDOSessionData.Data.Workspace.LocalWorkspace.EstimatedParams_7.Parameters.Value;

figure
plot(0:length(Gamma10_array)-2, Gamma10_array(2:end), '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_{10}$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/Gamma10','-depsc');


figure
plot(0:length(Gamma2_array)-2, Gamma2_array(2:end), '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_2$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/Gamma2','-depsc');


figure
plot(0:length(Gamma4_array)-2, Gamma4_array(2:end), '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_4$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/Gamma4','-depsc');


figure
plot(0:length(Gamma6_array)-2, Gamma6_array(2:end), '-*k', 'markersize', 10, 'LineWidth',2);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('Iterations', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Gamma_6$', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../../English_Journal/Figure/parameter_estimation/3DOF/Gamma6','-depsc');









