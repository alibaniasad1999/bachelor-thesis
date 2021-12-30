load('../Scenario_IX');
AHRS = -AHRS;
Omega_IX = Omega(1, :);
tIme_step = 0.02;
data_IX = AHRS(340:364, :);
tIme_IX = 0:tIme_step:(length(data_IX)-1)*tIme_step;
InIt_IX = data_IX(1, :);
tIme_IX = tIme_IX';
