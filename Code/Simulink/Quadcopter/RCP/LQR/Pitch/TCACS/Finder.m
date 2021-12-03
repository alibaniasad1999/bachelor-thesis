warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 10000;
%         pitch       q 
min = [     -6,        -6];
max = [      6,         6];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', string(nFE)), 'XOpt', 'FOpt', 'nFE')