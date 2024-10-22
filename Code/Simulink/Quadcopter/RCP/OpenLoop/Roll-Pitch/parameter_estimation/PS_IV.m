load('../scenario_IV');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
roll  = AHRS(:, 1);
pitch = AHRS(:, 2);
p     = AHRS(:, 4);
q     = AHRS(:, 5);
data = [roll ,pitch ,p ,q];
Omega_IV = Omega(1, :);
data_IV = data(349:359, :);
init_IV = data_IV(1, :);
time_step = 0.02;
time_IV = 0:time_step:(length(data_IV)-1)*time_step;
time_IV = time_IV';
