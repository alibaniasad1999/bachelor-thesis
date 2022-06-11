% parameter estimation figure result 2 3 4 5 7 9 10
load_data;
load('result.mat');
%% scenario I (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_I(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_I(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_I(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% roll rate
% subplot(3,2,2); 
% plot(time, out.simout(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_I(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_I(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % yaw rate
% subplot(3,2,6); 
% plot(time, out.simout(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_I(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S1.png',...
    '-dpng','-r400');
%% scenario II (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout1(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout1(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout1(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_II(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout1(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_II(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout1(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_II(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % yaw rate
% subplot(3,2,6); 
% plot(time, out.simout1(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_II(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S2.png',...
    '-dpng','-r400');
%% scenario III (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout2(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_III(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout2(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_III(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout2(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_III(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout2(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_III(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout2(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_III(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout2(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_III(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S3.png',...
    '-dpng','-r400');
%% scenario V (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout4(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout4(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout4(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_V(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout4(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_V(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout4(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_V(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout4(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_V(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S5.png',...
    '-dpng','-r400');
%% scenario VI (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout5(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VI(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout5(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VI(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout5(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VI(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout5(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VI(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout5(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VI(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout5(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VI(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S6.png',...
    '-dpng','-r400');
%% scenario VII (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout6(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout6(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout6(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VII(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout6(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VII(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout6(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VII(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout6(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VII(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S7.png',...
    '-dpng','-r400');
%% scenario VIII (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout7(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VIII(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout7(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VIII(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout7(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_VIII(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout7(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VIII(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout7(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VIII(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout7(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_VIII(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S8.png',...
    '-dpng','-r400');
%% scenario IX (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout8(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout8(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout8(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_IX(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout8(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_IX(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout8(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_IX(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout8(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_IX(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S9.png',...
    '-dpng','-r400');
%% scenario X (only valid scenario)
subplot(3,1,1);
% roll
plot(time, out.simout9(:, 1), 'k--', 'linewidth', 2);
hold on;
plot(time, data_X(:, 1), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('roll$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% pitch
subplot(3,1,2); 
plot(time, out.simout9(:, 2), 'k--', 'linewidth', 2);
hold on;
plot(time, data_X(:, 2), 'r', 'linewidth', 2);
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('pitch$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
hold off;
subplot(3,1,3);
% yaw
plot(time, out.simout9(:, 3), 'k--', 'linewidth', 2);
hold on;
plot(time, data_X(:, 3), 'r', 'linewidth', 2);
hold off;
legend('Simulated', 'Measured', 'Location','northwest');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
ylabel('yaw$_{(rad)}$', 'interpreter', 'latex', 'FontSize', 18);
% % roll rate
% subplot(3,2,2); 
% plot(time, out.simout9(:, 4), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_X(:, 4), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('roll rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % pitch rate
% subplot(3,2,4); 
% plot(time, out.simout9(:, 5), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_X(:, 5), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('pitch rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
% % roll rate
% subplot(3,2,6); 
% plot(time, out.simout9(:, 6), 'k--', 'linewidth', 2);
% hold on;
% plot(time, data_X(:, 6), 'r', 'linewidth', 2);
% legend('Simulated', 'Measured', 'Location','northwest');
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 16);
% ylabel('yaw rate$_{(rad/\sec)}$', 'interpreter', 'latex', 'FontSize', 18);
% hold off;
print('../../../../../../../Figures/RCP/roll_pitch_yaw_parameter_estimation/RCP_roll_pitch_yaw_S10.png',...
    '-dpng','-r400');