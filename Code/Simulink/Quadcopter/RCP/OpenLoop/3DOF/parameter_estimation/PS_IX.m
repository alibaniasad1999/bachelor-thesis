load('../Scenario_IX');
AHRS = -AHRS;
Omega_IX = Omega(1, :);
tIme_step = 0.02;
data_IX = AHRS(340:340+10, :);
