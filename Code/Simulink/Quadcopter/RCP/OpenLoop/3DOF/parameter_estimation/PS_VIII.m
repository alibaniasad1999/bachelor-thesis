load('../Scenario_VIII');
AHRS = -AHRS;
Omega_VIII = Omega(1, :);
tIme_step = 0.02;
data_VIII = AHRS(342:352, :);
init_VIII = data_VIII(1, :);
