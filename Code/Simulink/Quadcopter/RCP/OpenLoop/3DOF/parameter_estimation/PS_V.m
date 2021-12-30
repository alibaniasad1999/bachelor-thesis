load('../Scenario_V');
AHRS = -AHRS;
Omega_V = Omega(1, :);
time_step = 0.02;
data_V = AHRS(320:332, :);
time_V = 0:time_step:(length(data_V)-1)*time_step;
init_V = data_V(1, :);
time_V = time_V';
