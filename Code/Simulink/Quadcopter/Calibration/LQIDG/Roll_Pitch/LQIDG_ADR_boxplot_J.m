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
load('ADRC_cost.mat')
cost_ADRC = cost;
load('PID_DOBC_cost.mat')
cost_PID_DOBC = cost;

cost = [
    cost_lqidg(1, 6:end);
    % cost_pid(1, 6:end); cost_lqir(1, :);...
    % cost_lqr(1, :);
    cost_ADRC(1, :); cost_PID_DOBC(1, :)
    ];
cost = cost';
boxplot(cost);
boxplot(cost, { ...
    'LQIR-DG controller', 'ADR controller', 'DOB controller' })
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
ylabel('Cost Function', 'interpreter', 'latex', 'FontSize', 24);


% print('../../../../../../Figures/Calibration/LQIDG/Roll_Pitch/lqidgvsboxplot','-depsc');
print('../../../../../../English_Journal/Figure/implementation/box_plot/lqidgvsboxplot_ADR','-depsc');