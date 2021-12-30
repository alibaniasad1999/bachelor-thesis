load('../Scenario_XI');
AHRS = -AHRS;
Omega_XI = Omega(1, :);
tIme_step = 0.02;
data_XI = AHRS(321:332, :);
tIme_XI = 0:tIme_step:(length(data_XI)-1)*tIme_step;
InIt_XI = data_XI(1, :);
tIme_XI = tIme_XI';
