clear;
clc;
%% plot data %%
time = 0:0.02:95; % set time from start
load('disturbance.mat') % load data
sim_time = 0:0.02:100;
% pitch
% subplot(2,1,1);
plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 1)*180/pi, '--k', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi_{(deg)}$', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
% axis([0 10 -1 0.2])
xlim([0 80])
% % pitch rate q
% subplot(2,1,2);
% print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_roll.png','-dpng','-r400');
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_roll','-depsc');


plot(time, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG_distubance(find(sim_time == 5):end, 2)*180/pi, '--k', 'linewidth', 2);
hold off;
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta_{(deg)}$', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG Controller', 'Location','northeast');
% print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_pitch.png','-dpng','-r400');
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_pitch','-depsc');


disturbance_generator;

subplot(2, 1, 1)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
plot(time, omega_1_d, 'k', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{1}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');


subplot(2, 1, 2)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
plot(time, omega_3_d, 'k', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{3}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');

print('../../../../../../../English_Journal/Figure/implementation/disturbance/d_pitch','-depsc');

subplot(2, 1, 1)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
plot(time, omega_2_d, 'k', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{2}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
subplot(2, 1, 2)
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
plot(time, omega_4_d, 'k', 'linewidth', 2);
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{4}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
print('../../../../../../../English_Journal/Figure/implementation/disturbance/d_roll','-depsc');



%% omega %%
load('omega_disturbance.mat')
time = 0:0.02:100;
time =  time';
plot(time , 60/2/pi*out.omega.Data(:, 1), 'k');
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{1}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% xlim([0 80])
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_omega_1','-depsc');

plot(time , 60/2/pi*out.omega.Data(:, 2), 'k');
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{2}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% xlim([0 80])
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_omega_2','-depsc');

plot(time , 60/2/pi*out.omega.Data(:, 3), 'k');
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{3}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% xlim([0 80])
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_omega_3','-depsc');

plot(time , 60/2/pi*out.omega.Data(:, 4), 'k');
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\Omega_{4}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% xlim([0 80])
print('../../../../../../../English_Journal/Figure/implementation/disturbance/lqidg_omega_4','-depsc');


