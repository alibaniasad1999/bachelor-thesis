function JCost = Cost(Q_weight)
warning off all;
close all;
% assign G to workspace
assignin('base', 'Q_weight', Q_weight);
% Run Simulink
try
	simout = sim('Quad_Nonlinear_Openloop_LQDG.slx');
% 	VCost = RefrenceError(:, 1)' * RefrenceError(:, 1);
% 	XCost = RefrenceError(:, 2)' * RefrenceError(:, 2);
	JCost = simout.ITAE.Data(end);
catch
	JCost = 1e5;
end
Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1
assignin('base', 'Iteration', Iteration);
end