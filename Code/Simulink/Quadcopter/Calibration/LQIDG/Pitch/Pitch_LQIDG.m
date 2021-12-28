clc; clear;
load('28-Dec-2021-14-26-17-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
weighting_matrix(3) = 1.8;
OpenLoop_LQDG_riccati_solver_pitch;