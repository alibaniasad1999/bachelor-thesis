clear
Iteration = 0;
MaxFE = 25;
a = 1;
b = 100;
c = 1;
d = 100;
[XOpt, FOpt, nFE] = TCACS('Cost', [a c; b d], MaxFE, 1e-4);