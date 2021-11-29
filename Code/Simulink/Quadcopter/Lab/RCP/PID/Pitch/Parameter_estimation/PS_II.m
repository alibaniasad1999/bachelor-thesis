clear;
clc;
load_data;
% saved data %
load('Scenario_II.mat');
sample_time = .02;
time = 0:sample_time:15;
time = time';
AHRS_RCP  =  AHRS(251:end, :) * pi / 180; % deg to rad
Omega_RCP = Omega(251:end, :);