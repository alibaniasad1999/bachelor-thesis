warning off all;
close all;
clear
clc
clear
Iteration =    0;
MaxFE     = 500;
%          Q1        Q2     Q3     Q4     R1     R2
min = [    -6,       -6,    -6,    -6,    -6,   -6];
max = [     3,        3,     3,     3,     3,    3];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'LQIDG_stable_point', string(nFE)), 'XOpt', 'FOpt', 'nFE');