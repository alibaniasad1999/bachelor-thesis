load('../Scenario_III');
AHRS = -AHRS;
Omega_III = Omega(1, :);
time_step = 0.02;
data_III = AHRS(341:364, :);
time_III = 0:time_step:(length(data_III)-1)*time_step;
init_III = data_III(1, :);
time_III = time_III';