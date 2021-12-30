load('../Scenario_VII');
AHRS = -AHRS;
Omega_VII = Omega(1, :);
tIme_step = 0.02;
data_VII = AHRS(311:311+10, :);
init_VII = data_VII(1, :);

