warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     =  15000;
%     roll and pitch yaw  p and q   r    R2
min = [zeros(1,12), -2];
max = [9*ones(1,12), 6];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'LQIDG_3DOF_MIMO', string(nFE)), 'XOpt', 'FOpt', 'nFE');
f = msgbox('Operation Completed','J.A.R.V.I.S');