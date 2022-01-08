load('Scenario_I.mat', 'Omega_S1', 'AHRS_rate_S1', 'AHRS_S1');
Omega = Omega_S1(1, :);
time = 0:.02:.5;
time = time';
AHRS_S1 = lowpass(AHRS_S1, 50, 1e3);
AHRS_rate_S1 = lowpass(AHRS_rate_S1, 50, 1e3);
data = [AHRS_S1(345:370, 2), AHRS_rate_S1(345:370, 2)]*pi/180;
init = data(1, :);