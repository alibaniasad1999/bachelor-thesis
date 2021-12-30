load('../Scenario_V');
AHRS = -AHRS;
Omega_V = Omega(1, :);
time_step = 0.02;
data_V = AHRS(320:330, :);
