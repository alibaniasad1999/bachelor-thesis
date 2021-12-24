warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 10000;
%          Q_1     Q_2    Q_3     Q_4        R 
min = [    -10,     -10,    -10,     -10,       -10];
max = [     10,      10,     10,      10,        10];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'noise_ite_Pitch_LQIR_no_i', string(nFE)), 'XOpt', 'FOpt', 'nFE');