load('../Scenario_VII');
AHRS = -AHRS;
roll  = AHRS(:, 1);
pitch = AHRS(:, 2);
p     = AHRS(:, 4);
q     = AHRS(:, 5);
data = [roll ,pitch ,p ,q];
Omega_VII = Omega(1, :);
data_VII = data(371:385, :);
init_VII = data_VII(1, :);
time_step = 0.02;
time_VII = 0:time_step:(length(data_VII)-1)*time_step;
time_VII = time_VII';