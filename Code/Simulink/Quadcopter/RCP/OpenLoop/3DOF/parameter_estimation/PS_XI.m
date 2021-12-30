load('../Scenario_XI');
AHRS = -AHRS;
Omega_XI = Omega(1, :);
tIme_step = 0.02;
data_XI = AHRS(321:331, :);
