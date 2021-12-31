load('Scenario_III.mat', 'Omega_S1', 'AHRS_rate_S1', 'AHRS_S1');
Omega = Omega_S1(1, :);
time = 0:.02:.5;
time = time';
data = [AHRS_S1(300:325, 2), AHRS_rate_S1(300:325, 2)]*pi/180;
init = data(1, :);