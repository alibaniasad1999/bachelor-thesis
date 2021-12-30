load('../Scenario_XII');
AHRS = -AHRS;
Omega_XII = Omega(1, :);
tIme_step = 0.02;
data_XII = AHRS(330:340, :);
init_XII = data_XII(1, :);
