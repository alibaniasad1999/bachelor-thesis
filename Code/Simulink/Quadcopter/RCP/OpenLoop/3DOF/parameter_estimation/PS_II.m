load('../Scenario_II');
AHRS = -AHRS;
Omega_II = Omega(1, :);
time_step = 0.02;
data_II = AHRS(355:380, :);
time_II = 0:time_step:(length(data_II)-1)*time_step;
init_II = data_II(1, :);
time_II = time_II';