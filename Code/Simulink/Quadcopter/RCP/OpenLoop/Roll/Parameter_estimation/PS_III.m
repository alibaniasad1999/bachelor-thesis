load('Scenario_III.mat', 'Omega', 'AHRS_rate', 'AHRS');
Omega = Omega(1, :);
init = [AHRS(1, 1), AHRS_rate(1, 1)]*pi/180;
time = 0:0.02:0.5;
time = time';
data = [AHRS(261+25:261+50, 1), AHRS_rate(261+25:261+50, 1)]*pi/180;