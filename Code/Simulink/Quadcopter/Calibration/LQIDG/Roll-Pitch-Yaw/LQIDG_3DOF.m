% LQIDG Solver for 3DOF SISO
clc;
clear;
load('20-Feb-2022-21-07-59-LQIDG_3DOF4995.mat');
weighting_matrix = XOpt;
Roll_OpenLoop_LQIDG_solver;
Pitch_OpenLoop_LQIDG_solver;
Yaw_OpenLoop_LQIDG_solver;