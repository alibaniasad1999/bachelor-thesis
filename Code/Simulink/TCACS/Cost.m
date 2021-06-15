function JCost = Cost(G)
% assign G to workspace
assignin('base', 'G', G);
    % Run Simulink
    try
        sim('MBK.slx');
        JCost = error_cost(end);
    catch
        JCost = 1e5;
    end

Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
assignin('base', 'Iteration', Iteration);
end