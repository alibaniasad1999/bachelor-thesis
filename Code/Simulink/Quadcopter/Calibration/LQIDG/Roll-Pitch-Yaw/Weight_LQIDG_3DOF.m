% LQIDG Solver for 3DOF SISO
clc;
clear;
% load('11-Jan-2022-15-55-56-LQIDG_noise_ite1005.mat');
% weighting_matrix = XOpt;
% Roll_OpenLoop_LQIDG_solver;
% Pitch_OpenLoop_LQIDG_solver;
% load('21-Feb-2022-16-37-47-LQIDG_3DOF1005.mat');
% 
% 
% weighting_matrix = XOpt;
% 
weighting_matrix = [
    2.6085
    1.8193
    1.9193
   -5.6310
    1.7385
    2.6193
    2.6193
   -5.6310
   -3.4428
  -12.9000
   -0.8761
   -0.0107
    0.1060];

% weighting_matrix(10) = 0.1;
% weighting_matrix(11) = -3.2761;
% weighting_matrix(end) = weighting_matrix(end) + 1;
Roll_OpenLoop_LQIDG_solver;
Pitch_OpenLoop_LQIDG_solver;
Yaw_OpenLoop_LQIDG_solver;