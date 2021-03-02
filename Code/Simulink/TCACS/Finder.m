warning off
clear all
Iteration = 0;
MaxFE = 100;
a = 1;
b = 100;
[XOpt, FOpt, nFE] = TCACS('Cost', [1; 50], MaxFE, 1e-4);