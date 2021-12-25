warning off all;
close all;
clear
clc
clear
Iteration =    0;
MaxFE     = 1000;
%          Q_1     Q_2    Q_3     Q_4        R 
min = [    -3,     -3,    -3,     -3,       -3];
max = [     3,      3,     3,      3,        3];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'noise_Yaw_LQR_ite_', string(nFE)), 'XOpt', 'FOpt', 'nFE');