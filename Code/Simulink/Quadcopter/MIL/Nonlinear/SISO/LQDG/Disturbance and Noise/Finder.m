warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 10000;
%     roll and pitch yaw  p and q   r    R2  Integrator
min = [     0,        0,     0,     0,   -6           ];
max = [    12,       12,    12,    12,    6           ];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'nose_ite', string(nFE)), 'savedata')