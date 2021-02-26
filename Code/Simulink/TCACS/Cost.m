function JCost = Cost(G)
% assign G to workspace
assignin('base', 'G', G);
try
    % Run Simulink
    sim('MBK.slx');
    JCost = Error' * Error;
catch
        JCost = 1e5;
end
Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
assignin('base', 'Iteration', Iteration);
end
    