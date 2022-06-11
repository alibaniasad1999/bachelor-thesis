load('../scenario_II');
AHRS = -AHRS;
AHRS = lowpass(AHRS, 50, 1e3);
Omega_II = Omega(1, :);
time_step = 0.02;
data_II = AHRS(355:355+10, :);
init_II = data_II(1, :);