% roll pitch LQIDG
clc; clear;
% load('11-Jan-2022-15-55-56-LQIDG_noise_ite1005.mat');
% weighting_matrix = XOpt;
weighting_matrix = [
    2.6085
    1.8193
    1.9193
   -5.6310
    1.7385
    2.6193
    2.6193
   -5.6310
    0.1060
    ];
QuadConstants;
OpenLoop_LQDG_riccati_solver_roll;
Q_roll = Q;
OpenLoop_LQDG_riccati_solver_pitch;
Q_pitch = Q;
