clear
Iteration = 0;
MaxFE = 25;
%a = 1;
%b = 100;
[XOpt FOpt nFE] = TCACS('Cost', [1; 10], MaxFE, 1e-4);