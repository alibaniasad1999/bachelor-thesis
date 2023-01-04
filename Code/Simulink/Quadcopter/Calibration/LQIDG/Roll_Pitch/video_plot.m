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
index_20 = find(time == 20);
sq_wav(index_20-1) = sq_wav(index_20+1);
refrence = sq_wav;
plot(time-20, refrence, 'r', 'linewidth', 2);
hold on;
axis([0 80 -40 50])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);

counter = 1;
for i=1:length(time)
    if time(i) < 20
        continue;
    end
    plot(time(1:i)-20, roll_pitch_LQIDG(1:i, 1)*180/pi, '--k', 'linewidth', 2);
    legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
    F_roll(counter) = getframe(gcf);
    counter = counter + 1;
    fprintf('%d\n', i);
end

hold off

%% video maker %%
writeObj = VideoWriter('roll_square_wave_video');
writeObj.FrameRate = length(F_roll)/80;
open(writeObj);
for i=1:length(F_roll)
    frame = F_roll(i);
    writeVideo(writeObj, frame)
end
close(writeObj)

%% pitch %%
plot(time-20, -refrence, 'r', 'linewidth', 2);
hold on;
xlim([0 80])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);

counter = 1;
for i=1:length(time)
    if time(i) < 20
        continue;
    end
    plot(time(1:i)-20, roll_pitch_LQIDG(1:i, 2)*180/pi, '--k', 'linewidth', 2);
    legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
    F_pitch(counter) = getframe(gcf);
    counter = counter + 1;
    fprintf('%d\n', i);
end

hold off;

%% video maker %%
writeObj = VideoWriter('pitch_square_wave_video');
writeObj.FrameRate = length(F_pitch)/80;
open(writeObj);
for i=1:length(F_pitch)
    frame = F_pitch(i);
    writeVideo(writeObj, frame)
end
close(writeObj)

