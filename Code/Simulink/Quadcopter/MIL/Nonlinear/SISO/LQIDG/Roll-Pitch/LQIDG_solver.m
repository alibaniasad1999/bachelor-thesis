% roll pitch LQIDG
QuadConstants;
weighting_matrix = zeros(1, 9);
weighting_matrix(1:4) = [3.7678, 2.4933, 1.9232, -4.8786];
weighting_matrix(end) = 0.8889;
OpenLoop_LQDG_riccati_solver_roll;
load('12-Jun-2022-15-27-00-LQIDG_lessnoise_ite1500.mat');
weighting_matrix = XOpt;
weighting_matrix(7) = 1.9;
OpenLoop_LQDG_riccati_solver_pitch;
