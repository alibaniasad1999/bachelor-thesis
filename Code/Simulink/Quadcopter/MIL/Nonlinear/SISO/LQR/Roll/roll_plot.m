load('28-Mar-2022-21-13-33-noise_ite_Roll_LQR_no1000.mat');
weighting_matrix = XOpt;
out = sim('Quad_Nonlinear_Roll_LQR_Model');
plot(out.roll_state)