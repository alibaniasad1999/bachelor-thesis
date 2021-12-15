load('Scenario_IV.mat', 'AHRS', 'AHRS_rate', 'Omega');
time = 0:0.02:0.5;
time = time';
data = [AHRS(280:280+25,3), AHRS_rate(280:280+25,3)]*pi/180;
Omega_data = Omega(1, :);