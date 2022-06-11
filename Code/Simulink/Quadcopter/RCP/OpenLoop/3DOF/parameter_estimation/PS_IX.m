load('../scenario_IX');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_IX = Omega(1, :);
tIme_step = 0.02;
data_IX = AHRS(340:340+10, :);
init_IX = data_IX(1, :);
