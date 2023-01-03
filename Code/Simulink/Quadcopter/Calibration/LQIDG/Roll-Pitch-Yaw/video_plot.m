clear;
clc;

load('data_film_1.mat')
time = linspace(0, 100, length(simout));


set(gca, 'FontSize', 16)
plot(time-3.5, zeros(1, length(time)), 'r', 'linewidth', 2);
axis([0 20 -30 30])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);
hold on;
% F = zeros(1, length(1:10:length(time)));
counter = 1;
for i = 1:length(time)
    if time(i) < 3.5
        continue;
    end
    if time(i) > 24
        break
    end
    plot(time(1:i)-3.5, 180/pi*simout(1:i, 1), '--k', 'linewidth', 2);
    legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
    F_data(counter) = getframe(gcf);
    counter = counter + 1;
    fprintf('%d\n', i);
end
hold off
%% video maker %%
writeObj = VideoWriter('roll_video');
writeObj.FrameRate = length(F_data)/20;
open(writeObj);
for i=1:length(F_data)
    frame = F_data(i);
    writeVideo(writeObj, frame)
end
close(writeObj)