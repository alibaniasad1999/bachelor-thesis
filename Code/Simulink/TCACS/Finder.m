Iteration = 0;
MaxFE = 1000;
a = 1;
b = 100;
[XOpt, FOpt, nFE] = TCACS('Cost', [a; b], MaxFE, 1e-4);