load('../Scenario_V');
AHRS = -AHRS;
Omega_V = Omega(1, :);
time_step = 0.02;
data_V = AHRS(323:333, :);
init_V = data_V(1, :);
