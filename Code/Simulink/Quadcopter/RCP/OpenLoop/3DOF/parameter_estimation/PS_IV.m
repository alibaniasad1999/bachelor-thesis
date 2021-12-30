load('../Scenario_IV');
AHRS = -AHRS;
Omega_IV = Omega(1, :);
time_step = 0.02;
data_IV = AHRS(299:299+10, :);
