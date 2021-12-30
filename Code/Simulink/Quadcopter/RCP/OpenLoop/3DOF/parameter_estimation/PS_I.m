load('../Scenario_I');
AHRS = -AHRS;
Omega_I = Omega(1, :);
time_step = 0.02;
data_I = AHRS(315:315+10, :);