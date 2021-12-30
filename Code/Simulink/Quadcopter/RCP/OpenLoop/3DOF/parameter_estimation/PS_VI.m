load('../Scenario_VI');
AHRS = -AHRS;
Omega_VI = Omega(1, :);
tIme_step = 0.02;
data_VI = AHRS(330:340, :);

