load('../Scenario_II');
AHRS = -AHRS;
Omega_II = Omega(1, :);
time_step = 0.02;
data_II = AHRS(355:355+10, :);