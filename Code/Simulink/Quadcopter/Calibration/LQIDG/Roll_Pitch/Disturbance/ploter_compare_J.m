clear;
clc;
%% plot data %%
time = 0:0.02:95; % set time from start
load('disturbance.mat') % load data
load('disturbance_ADRC.mat')
load('disturbance_DOBC.mat')
sim_time = 0:0.02:100;
%%
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 1)*180/pi, '--k', 'linewidth', 2);
plot(time, roll_pitch_ADRC_distubance(find(sim_time == 5):end, 1)*180/pi,...
    '.b', 'linewidth', 1);
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'ADR Controller', 'Location','northeast');

print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_dis_ADR_roll','-depsc');
%%
hold off;
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 1)*180/pi, '--k', 'linewidth', 2);
plot(time, roll_pitch_DOBC_distubance(find(sim_time == 5):end, 1)*180/pi,...
    '.b', 'linewidth', 1);
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'DOB Controller', 'Location','northeast');





% axis([0 10 -1 0.2])
xlim([0 80])
% % pitch rate q
% subplot(2,1,2);
% print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_roll.png','-dpng','-r400');
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_dis_DOB_roll','-depsc');

%%
hold off;
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 2)*180/pi, '--k', 'linewidth', 2);
plot(time, roll_pitch_ADRC_distubance(find(sim_time == 5):end, 2)*180/pi,...
    '.b', 'linewidth', 1);
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'ADR Controller', 'Location','southwest');

print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_dis_ADR_pitch','-depsc');
%%
hold off;
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 2)*180/pi, '--k', 'linewidth', 2);
plot(time, roll_pitch_DOBC_distubance(find(sim_time == 5):end, 2)*180/pi,...
    '.b', 'linewidth', 1);
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'DOB Controller', 'Location','northeast');





% axis([0 10 -1 0.2])
xlim([0 80])
% % pitch rate q
% subplot(2,1,2);
% print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_roll.png','-dpng','-r400');
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_dis_DOB_pitch','-depsc');
