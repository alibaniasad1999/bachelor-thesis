clear;
clc;
load_data;
% saved data %
load('Scenario_II.mat');
sample_time = .02;
time = 0.4:sample_time:15;
time = time';
AHRS_RCP  =  AHRS(271:end, :); % deg to rad