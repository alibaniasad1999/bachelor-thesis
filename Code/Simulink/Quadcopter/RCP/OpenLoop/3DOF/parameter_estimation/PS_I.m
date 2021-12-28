load('../Scenario_I');
AHRS = -AHRS;
Omega_I = Omega(1, :);
time_step = 0.02;
data_I = AHRS(315:340, :);
time_I = 0:time_step:(length(data_I)-1)*time_step;
init_I = data_I(1, :);
time_I = time_I';