load('../Scenario_IV');
AHRS = -AHRS;
Omega_IV = Omega(1, :);
time_step = 0.02;
data_IV = AHRS(309:322, :);
time_IV = 0:time_step:(length(data_IV)-1)*time_step;
init_IV = data_IV(1, :);
time_IV = time_IV';