clc; clear;
load('11-Jan-2022-17-02-26-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
weighting_matrix(1) = -3.6903;
weighting_matrix(2) =  -2.7960;
weighting_matrix(3) = 0.5285;
weighting_matrix(4) = -3.5806;
OpenLoop_LQDG_riccati_solver_roll;