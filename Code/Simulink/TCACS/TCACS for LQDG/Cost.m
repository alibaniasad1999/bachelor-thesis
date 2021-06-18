function JCost = Cost(X)
warning off all;
close all;
% assign G to workspace
assignin('base', 'X', X);
% Run Simulink
try
    RefrenceError = 0;
	sim('MBKwithLQDG_TCACS.slx');
	VCost = RefrenceError(:, 1)' * RefrenceError(:, 1);
	XCost = RefrenceError(:, 2)' * RefrenceError(:, 2);
	JCost = VCost + XCost;
catch
	JCost = 1e5;
end
Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
assignin('base', 'Iteration', Iteration);
end