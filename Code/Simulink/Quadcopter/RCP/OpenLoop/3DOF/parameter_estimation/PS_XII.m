load('../Scenario_XII');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_XII = Omega(1, :);
tIme_step = 0.02;
data_XII = AHRS(330:340, :);
init_XII = data_XII(1, :);
