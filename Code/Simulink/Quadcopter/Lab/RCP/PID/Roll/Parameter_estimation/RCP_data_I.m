% preapare data for RCP
% PID %
load('18-Nov-2021-14-14-05-PID_Roll1910.mat');
KP_Roll = 10^savedata{1}(1)/25;
KI_Roll = 10^savedata{1}(2)*10;
KD_Roll = 10^savedata{1}(3)/15;
% saved data %
load('Scenario_I.mat');
sample_time = .02;
time = 0:sample_time:15;
time = time';
AHRS_RCP  =  AHRS(251:end, :) * pi / 180; % deg to rad
Omega_RCP = Omega(251:end, :);