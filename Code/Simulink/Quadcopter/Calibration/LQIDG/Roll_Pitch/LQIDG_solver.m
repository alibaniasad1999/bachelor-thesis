% roll pitch LQIDG
clc; clear;
% load('11-Jan-2022-15-55-56-LQIDG_noise_ite1005.mat');
% weighting_matrix = XOpt;
weighting_matrix = [
    2.6385
    2.4193
    2.4193
   -5.6310
   -1.7615
    1.8193
    1.9193
   -5.6310
    0.1060
    ];
QuadConstants;
OpenLoop_LQDG_riccati_solver_roll;
OpenLoop_LQDG_riccati_solver_pitch;
