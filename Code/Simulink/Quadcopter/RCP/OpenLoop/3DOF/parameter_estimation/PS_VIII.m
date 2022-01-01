load('../Scenario_VIII');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_VIII = Omega(1, :);
tIme_step = 0.02;
data_VIII = AHRS(342:352, :);
init_VIII = data_VIII(1, :);
