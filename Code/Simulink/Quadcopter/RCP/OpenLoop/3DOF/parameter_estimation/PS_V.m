load('../Scenario_V');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_V = Omega(1, :);
time_step = 0.02;
data_V = AHRS(323:333, :);
init_V = data_V(1, :);
