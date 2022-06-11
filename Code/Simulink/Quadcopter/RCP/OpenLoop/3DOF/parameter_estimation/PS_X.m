load('../scenario_X');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_X = Omega(1, :);
tIme_step = 0.02;
data_X = AHRS(300:310, :);
init_X = data_X(1, :);
