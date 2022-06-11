load('../scenario_III');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_III = Omega(1, :);
time_step = 0.02;
data_III = AHRS(341:341+10, :);
init_III = data_III(1, :);