function JCost = Cost(PID)
warning off all;
close all;
% assign weighting_matrix weights(q1-q6 and R2_1-R2_4) to workspace
KP_Pitch = 10^PID(1);
KI_Pitch = 10^PID(2);
KD_Pitch = 10^PID(3);
assignin('base', 'KP_Pitch', KP_Pitch);
assignin('base', 'KI_Pitch', KI_Pitch);
assignin('base', 'KD_Pitch', KD_Pitch);
KP_Roll = 10^PID(4);
KI_Roll = 10^PID(5);
KD_Roll = 10^PID(6);
assignin('base', 'KP_Roll', KP_Roll);
assignin('base', 'KI_Roll', KI_Roll);
assignin('base', 'KD_Roll', KD_Roll);
% Run Simulink
try
	simout = sim('Quad_Nonlinear_PID_Roll_Pitch.slx');
% 	VCost = RefrenceError(:, 1)' * RefrenceError(:, 1);
% 	XCost = RefrenceError(:, 2)' * RefrenceError(:, 2);
	JCost = simout.ITAE.Data(end);
catch
	JCost = 1e5;
    fprintf('Ooooooooops');
end
Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
fprintf('num of ite: %d\n', Iteration);
assignin('base', 'Iteration', Iteration);
end