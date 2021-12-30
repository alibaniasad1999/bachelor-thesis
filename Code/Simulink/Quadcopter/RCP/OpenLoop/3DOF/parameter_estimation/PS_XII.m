load('../Scenario_XII');
AHRS = -AHRS;
Omega_XII = Omega(1, :);
tIme_step = 0.02;
data_XII = AHRS(330:347, :);
tIme_XII = 0:tIme_step:(length(data_XII)-1)*tIme_step;
InIt_XII = data_XII(1, :);
tIme_XII = tIme_XII';
