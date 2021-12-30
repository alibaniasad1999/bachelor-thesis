load('../Scenario_X');
AHRS = -AHRS;
Omega_X = Omega(1, :);
tIme_step = 0.02;
data_X = AHRS(300:315, :);
tIme_X = 0:tIme_step:(length(data_X)-1)*tIme_step;
InIt_X = data_X(1, :);
tIme_X = tIme_X';
