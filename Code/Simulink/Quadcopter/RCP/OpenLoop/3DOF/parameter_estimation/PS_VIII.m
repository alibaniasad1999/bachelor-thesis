load('../Scenario_VIII');
AHRS = -AHRS;
Omega_VIII = Omega(1, :);
tIme_step = 0.02;
data_VIII = AHRS(342:378, :);
tIme_VIII = 0:tIme_step:(length(data_VIII)-1)*tIme_step;
InIt_VIII = data_VIII(1, :);
tIme_VIII = tIme_VIII';
