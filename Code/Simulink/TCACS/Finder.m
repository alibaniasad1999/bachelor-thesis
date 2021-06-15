warning off all;
clear
clc
clear
Iteration = 0;
MaxFE = 25;
a = [ 1  ,  1];
b = [100, 100];
[XOpt, FOpt, nFE] = TCACS('Cost', [a; b], MaxFE, 1e-4);