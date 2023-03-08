clear;
clc;
load('PID_cost.mat')
cost_pid = cost;
load('LQIDG_cost.mat')
cost_lqidg = cost;
load('LQR_cost.mat')
cost_lqr = cost;
load('LQIR_cost.mat')
cost_lqir = cost;

cost = [cost_lqidg(1, 6:end); cost_pid(1, 6:end); cost_lqir(1, :);...
    cost_lqr(1, :)];
cost = cost';
boxplot(cost);
boxplot(cost, {'LQIR-DG controller', 'PID controller', 'LQIR controller', ...
    'LQR controller'})
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
ylabel('Cost Function', 'interpreter', 'latex', 'FontSize', 24);


print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/lqidgvsboxplot','-depsc');