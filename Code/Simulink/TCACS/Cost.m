function JCost = Cost(Q)
warning off all;
close all;
% assign G to workspace
assignin('base', 'Q', Q);
% Run Simulink
try
    RefrenceError = 0;
	sim('MBKwithLQR.slx');
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