load('../Scenario_VI');
roll  = AHRS(:, 1);
AHRS = -AHRS;
pitch = AHRS(:, 2);
p     = AHRS(:, 4);
q     = AHRS(:, 5);
data = [roll ,pitch ,p ,q];
Omega_VI = Omega(1, :);
data_VI = data(346:360, :);
init_VI = data_VI(1, :);
time_step = 0.02;
time_VI = 0:time_step:(length(data_VI)-1)*time_step;
time_VI = time_VI';