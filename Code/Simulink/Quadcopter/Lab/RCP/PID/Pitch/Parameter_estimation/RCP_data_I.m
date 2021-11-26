% preapare data for RCP
% PID %
load('18-Nov-2021-15-54-05-PID_Pitch1070.mat');
KP_Pitch = 10^savedata{1}(1)/25;
KI_Pitch = 10^savedata{1}(2)*10;
KD_Pitch = 10^savedata{1}(3)/15;
% saved data %
load('Scenario_I.mat');
sample_time = .02;
time = 0:sample_time:15;
time = reshape(length(time), 2);
AHRS_RCP  =  AHRS(251:end, :) * pi / 180; % deg to rad
Omega_RCP = Omega(251:end, :);