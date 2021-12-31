load('Scenario_V.mat', 'Omega_S1', 'AHRS_rate_S1', 'AHRS_S1');
Omega = Omega_S1(1, :);
init = [AHRS_S1(1, 2), AHRS_rate_S1(1, 2)]*pi/180;
time = 0:.02:.5;
time = time';
data = [AHRS_S1(280:280+25, 2), AHRS_rate_S1(280:280+25, 2)]*pi/180;