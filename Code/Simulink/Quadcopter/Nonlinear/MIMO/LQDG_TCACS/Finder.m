warning off all;
close all;
clear
clc
clear
Iteration =   0;
MaxFE     = 100;
min = [ 10,   10,    100,    10,   10,    100  ];
max = [1000, 1000, 1000000, 1000, 1000, 1000000];
[XOpt, FOpt, nFE] = TCACS('Cost', [min; max], MaxFE, 1e-4);