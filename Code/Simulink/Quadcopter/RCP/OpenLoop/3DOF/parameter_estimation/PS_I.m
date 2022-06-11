load('../scenario_I');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_I = Omega(1, :);
time_step = 0.02;
data_I = AHRS(315:315+10, :);
init_I = data_I(1, :);