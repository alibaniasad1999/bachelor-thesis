function JCost = Cost(weighting_matrix)
warning off all;
close all;
% assign weighting_matrix weights(q1-q6 and R2_1-R2_4) to workspace
assignin('base', 'weighting_matrix', weighting_matrix);
% Run Simulink
try
	simout = sim('Quad_Nonlinear_Pitch_Model.slx');
% 	VCost = RefrenceError(:, 1)' * RefrenceError(:, 1);
% 	XCost = RefrenceError(:, 2)' * RefrenceError(:, 2);
	JCost = simout.ITAE.Data(end);
catch
	JCost = 1e40;
    fprintf('Ooooooooops');
end
Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
fprintf('num of ite: %d\nCost:%f\n', Iteration, JCost);
assignin('base', 'Iteration', Iteration);
end