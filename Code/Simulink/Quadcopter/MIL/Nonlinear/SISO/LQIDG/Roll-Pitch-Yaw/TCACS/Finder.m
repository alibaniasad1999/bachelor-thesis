warning off all;
close all;
clear
clc
clear
Iteration =    0;
MaxFE     = 1000;
% roll
%           Q1  Q2  Q3  Q4
min_roll = [-4, -4, -4, -4];
max_roll = [ 4,  4,  4,  4];
% pitch
%            Q1  Q2  Q3  Q4
min_pitch = [-4, -4, -4, -4];
max_pitch = [ 4,  4,  4,  4];
% yaw
%          Q1  Q2  Q3  Q4
min_yaw = [-6, -6, -6, -6];
max_yaw = [ 3,  3,  3,  3];
% R2
min_R = -3;
max_R =  3;
min = [min_roll, min_pitch, min_yaw, min_R];
max = [max_roll, max_pitch, max_yaw, max_R];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'LQIDG_3DOF', string(nFE)), 'XOpt', 'FOpt', 'nFE');
f = msgbox('Operation Completed','J.A.R.V.I.S');