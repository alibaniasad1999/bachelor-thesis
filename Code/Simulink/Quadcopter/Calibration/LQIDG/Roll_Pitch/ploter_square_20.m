clc
clear;

load('data_film_squre_20.mat');
time = 0:0.02:100;


% square wave 
freq=0.025;
offset=0;
amp=20;
duty=50;

sq_wav=offset+amp*square(2*pi*freq.*time,duty);
sq_wav(end) = sq_wav(end-1);

refrence = sq_wav;
plot(time, refrence, 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG(:, 1)*180/pi, '--k', 'linewidth', 2);
hold off;

legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 100 -40 50])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Square/lqidg_roll_20','-depsc');


plot(time, -refrence, 'r', 'linewidth', 2);
hold on;
plot(time, roll_pitch_LQIDG(:, 2)*180/pi, '--k', 'linewidth', 2);
hold off;

set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);
print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/Square/lqidg_pitch_20','-depsc');
