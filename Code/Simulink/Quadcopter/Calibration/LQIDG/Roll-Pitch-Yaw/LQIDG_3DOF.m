% LQIDG Solver for 3DOF SISO
clc;
clear;
load('11-Jan-2022-15-55-56-LQIDG_noise_ite1005.mat');
weighting_matrix = XOpt;
Roll_OpenLoop_LQIDG_solver;
Pitch_OpenLoop_LQIDG_solver;
load('21-Feb-2022-16-37-47-LQIDG_3DOF1005.mat');
weighting_matrix = XOpt;
% weighting_matrix(end) = weighting_matrix(end) + 1;
Yaw_OpenLoop_LQIDG_solver;