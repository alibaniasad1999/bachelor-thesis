% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
load('result.mat');
%% scenario II (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_II(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S1.png',...
    '-dpng','-r400');
%% scenario III (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout1(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout1(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout1(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout1(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_III(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S2.png',...
    '-dpng','-r400');
%% scenario IV (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout2(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout2(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout2(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout2(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_IV(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S3.png',...
    '-dpng','-r400');
%% scenario V (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout3(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout3(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout3(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout3(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_V(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S4.png',...
    '-dpng','-r400');
%% scenario VII (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout4(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout4(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout4(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout4(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S5.png',...
    '-dpng','-r400');
%% scenario IX (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout5(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout5(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout5(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout5(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','southwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S6.png',...
    '-dpng','-r400');
%% scenario X (only valid scenario)
subplot(2,2,1);
% roll
plot(time, SDOSimTest_Log.simout6(:, 1), 'r', 'linewidth', 2);
hold on;
plot(time, data_X(:, 1), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(2,2,2); 
plot(time, SDOSimTest_Log.simout6(:, 2), 'r', 'linewidth', 2);
hold on;
plot(time, data_X(:, 2), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(2,2,3);
% roll rate
plot(time, SDOSimTest_Log.simout6(:, 3), 'r', 'linewidth', 2);
hold on;
plot(time, data_X(:, 3), 'k--', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch rate
subplot(2,2,4); 
plot(time, SDOSimTest_Log.simout6(:, 4), 'r', 'linewidth', 2);
hold on;
plot(time, data_X(:, 4), 'k--', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northeast');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
print('../../../../../../../Figures/RCP/roll_pitch_parameter_estimation/RCP_roll_pitch_S7.png',...
    '-dpng','-r400');