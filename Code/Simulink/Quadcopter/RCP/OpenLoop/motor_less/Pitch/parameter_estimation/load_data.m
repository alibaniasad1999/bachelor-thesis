clear;
clc;
QuadConstants;
load('pitch.mat', 'AHRS')
data_I = AHRS(643:643+20, :);
init_I = data_I(1, :);
data_II = AHRS(1045:1045+20, :);
init_II = data_II(1, :);
data_III = AHRS(1376:1376+20, :);
init_III = data_III(1, :);
data_IV = AHRS(1723:1723+20, :);
init_IV = data_IV(1, :);
data_V = AHRS(2048:2048+20, :);
init_V = data_V(1, :);
time = 0:0.02:20*0.02;
time = time';