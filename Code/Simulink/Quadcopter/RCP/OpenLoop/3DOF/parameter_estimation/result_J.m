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

