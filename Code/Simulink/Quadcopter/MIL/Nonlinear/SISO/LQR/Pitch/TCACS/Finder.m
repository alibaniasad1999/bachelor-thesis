warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 1000;
%          Q_1       Q_2        R
min = [    -6,       -6,       -6];
max = [    20,       20,       20];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 2);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'noise_ite_Pitch_LQR', string(nFE)), 'XOpt', 'FOpt', 'nFE');