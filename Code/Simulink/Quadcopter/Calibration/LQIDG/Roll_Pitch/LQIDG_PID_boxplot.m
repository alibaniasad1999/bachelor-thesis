clear;
clc;
load('PID_cost.mat')
cost_pid = cost;
load('LQIDG_cost.mat')
cost_lqidg = cost;

cost = [cost_lqidg(1, 6:end); cost_pid(1, 6:end)];
cost = cost';
boxplot(cost);
boxplot(cost, {'LQIR-DG controller', 'PID controller'})
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
ylabel('Quadratic Cost', 'interpreter', 'latex', 'FontSize', 24);

print('../../../../../../English_Journal/Figure/implementation/box_plot/lqidgvsboxplot','-depsc');