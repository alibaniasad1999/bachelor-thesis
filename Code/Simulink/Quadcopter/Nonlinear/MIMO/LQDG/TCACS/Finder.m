warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 1000;
%     roll pitch yaw  p   q   r  R2_1  R2_2  R2_3  R1_4
min = [ 0,  0,    0,  0,  0,  0,  -2,   -2,   -2,   -2];
max = [ 9,  9,    9,  9,  9,  9,   6,    6,    6,    6];
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(str_now_time+string(nFE), 'savedata')