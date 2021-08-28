warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 1000;
min = [0, 0, 0, 0, 0, 0, 0]; % add R2
max = [9, 9, 9, 9, 9, 9, 9];
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
now_time(12) = '-';
now_time(15) = '-';
now_time(18) = '-';
save(now_time, 'savedata')