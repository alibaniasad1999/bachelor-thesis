load('Scenario_I.mat', 'AHRS', 'AHRS_rate', 'Omega');
AHRS_RCP = [AHRS(251:end, 3), AHRS_rate(251:end, 3)];
time = 0:0.02:5;
time = time';