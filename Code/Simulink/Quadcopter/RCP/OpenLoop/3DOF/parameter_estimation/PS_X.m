load('../Scenario_X');
AHRS = -AHRS;
Omega_X = Omega(1, :);
tIme_step = 0.02;
data_X = AHRS(300:310, :);
