clc; clear;
load('11-Jan-2022-14-52-17-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
OpenLoop_LQDG_riccati_solver_roll;