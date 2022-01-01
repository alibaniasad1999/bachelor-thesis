load('../Scenario_VI');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_VI = Omega(1, :);
tIme_step = 0.02;
data_VI = AHRS(330:340, :);
init_VI = data_VI(1, :);