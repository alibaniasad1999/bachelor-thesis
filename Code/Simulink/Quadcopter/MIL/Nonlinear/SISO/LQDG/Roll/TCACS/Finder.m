warning off all;
close all;
bdclose;
clear
clc
clear
Iteration =    0;
MaxFE     = 1000;
%          Q_1       Q_2        R_2      
min = [     4,        2.5,      0.5];
max = [     5,        3.5,      1.5];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'noise_ite_Roll_LQDG', string(nFE)), 'XOpt', 'FOpt', 'nFE');