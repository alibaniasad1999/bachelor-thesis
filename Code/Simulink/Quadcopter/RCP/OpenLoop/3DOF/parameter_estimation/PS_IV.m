load('../scenario_IV');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_IV = Omega(1, :);
time_step = 0.02;
data_IV = AHRS(305:305+10, :);
init_IV = data_IV(1, :);
