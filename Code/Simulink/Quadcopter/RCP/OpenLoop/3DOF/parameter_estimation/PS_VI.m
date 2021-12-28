load('../Scenario_VI');
AHRS = -AHRS;
Omega_VI = Omega(1, :);
tIme_step = 0.02;
data_VI = AHRS(330:347, :);
tIme_VI = 0:tIme_step:(length(data_VI)-1)*tIme_step;
InIt_VI = data_VI(1, :);
tIme_VI = tIme_VI';
