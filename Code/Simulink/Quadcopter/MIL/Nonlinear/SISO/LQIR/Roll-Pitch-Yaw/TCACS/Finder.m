warning off all;
close all;
clear
clc
clear
Iteration =     0;
MaxFE     = 10000;
% roll
%           Q1  Q2  Q3  Q4
min_roll = [-9, -9, -9, -9];
max_roll = [ 6,  6,  6,  6];
% pitch
%            Q1  Q2  Q3  Q4
min_pitch = [-9, -9, -9, -9];
max_pitch = [ 6,  6,  6,  6];
% yaw
%          Q1  Q2  Q3  Q4
min_yaw = [-9, -9, -9, -9];
max_yaw = [ 6,  6,  6,  6];
% R2
min_R =  0;
max_R =  6;
min = [min_roll, min_pitch, min_yaw, min_R];
max = [max_roll, max_pitch, max_yaw, max_R];
tic
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 2);
toc
savedata = {XOpt, FOpt, nFE};
now_time = string(datetime('now'));
str_now_time = now_time{1};
str_now_time(12) = '-';
str_now_time(15) = '-';
str_now_time(18) = '-';
save(append(str_now_time, '-', 'noise_ite', string(nFE)), 'XOpt', 'FOpt', 'nFE');