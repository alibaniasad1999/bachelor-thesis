% roll pitch LQIDG
clc; clear;
load('11-Jan-2022-15-55-56-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
QuadConstants;
OpenLoop_LQDG_riccati_solver_roll;
OpenLoop_LQDG_riccati_solver_pitch;
