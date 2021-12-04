clear;
clc;
load_data;
% saved data %
load('Scenario_I.mat');
sample_time = .02;
time = 0:sample_time:14.6;
time = time';
AHRS_RCP  =  AHRS(271:end, :); % deg to rad