load('../Scenario_III');
AHRS = -AHRS;
Omega_III = Omega(1, :);
time_step = 0.02;
data_III = AHRS(341:341+10, :);