clear;
clc;
%% plot data %%
load('data_film_weight_4.mat')
time = linspace(0, 100, length(simout));

% pitch
% subplot(2,1,1);
set(gca, 'FontSize', 16)
plot(time -8, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -8, 180/pi*simout(:, 1), '--k', 'linewidth', 2);
hold off;
axis([0 20 -20 50])
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
% axis([0 100 -40 20])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../English_Journal/Figure/implementation/weight/lqidg_roll','-depsc');
% % pitch rate q
% subplot(2,1,2);
% plot(time -7, zeros(1, length(time)), 'r', 'linewidth', 2);
% hold on;
% plot(time -7, pitch_LQIDG(find(sim_time == 5):end, 2), '--k', 'linewidth', 2);
% hold off;
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 20);
% ylabel('pitch rate$_{(rpm)}$', 'interpreter', 'latex', 'FontSize', 20);
% legend('Setpoint', 'LQIR-DG', 'Location','northeast');
% print('../../../../../../English_Journal/Figure/implementation/lqidg_roll.png','-dpng','-r400');

plot(time -8, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -8, 180/pi*simout(:, 2), '--k', 'linewidth', 2);
hold off;
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 20 -30 30])
print('../../../../../../English_Journal/Figure/implementation/weight/lqidg_pitch','-depsc');

plot(time -8, zeros(1, length(time)), 'r', 'linewidth', 2);
hold on;
plot(time -8, 180/pi*simout(:, 3), '--k', 'linewidth', 2);
hold off;
axis([0 20 -80 40])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\psi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
print('../../../../../../English_Journal/Figure/implementation/weight/lqidg_yaw','-depsc');


% plot(time -7, -180/pi*simout(find(sim_time == 5):end, 1), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Roll', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_roll_e.png','-dpng','-r400');

% 
% plot(time -7, -180/pi*simout(find(sim_time == 5):end, 2), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Pitch', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_pitch_e.png','-dpng','-r400');
% 
% plot(time -7, -180/pi*simout(find(sim_time == 5):end, 3), 'k', 'linewidth', 2);
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('Error of Yaw', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_yaw_e.png','-dpng','-r400');

% 
% plot(time -7, 60/2/pi*simout1(find(sim_time == 5):end, 1), 'k');
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('$\Omega_{1}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_Omega_1.png','-dpng','-r400');
% 
% plot(time -7, 60/2/pi*simout1(find(sim_time == 5):end, 2), 'k');
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('$\Omega_{2}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_Omega_2.png','-dpng','-r400');
% 
% plot(time -7, 60/2/pi*simout1(find(sim_time == 5):end, 3), 'k');
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('$\Omega_{3}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_Omega_3.png','-dpng','-r400');
% 
% plot(time -7, 60/2/pi*simout1(find(sim_time == 5):end, 4), 'k');
% set(gca, 'FontSize', 16)
% xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
% ylabel('$\Omega_{4}$(rpm)', 'interpreter', 'latex', 'FontSize', 24);
% print('../../../../../../English_Journal/Figure/implementation/lqidg_Omega_4.png','-dpng','-r400');