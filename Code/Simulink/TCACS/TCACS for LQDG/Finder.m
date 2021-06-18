warning off all;
close all;
clear
clc
clear
Iteration =  0;
MaxFE     = 10;
%    Q11  Q22    G
a = [ 1  ,  1,  1.1];
b = [100, 100,   20];
[XOpt, FOpt, nFE] = TCACS('Cost', [a; b], MaxFE, 1e-4);