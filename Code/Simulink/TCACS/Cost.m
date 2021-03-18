function JCost = Cost(G)
% assign G to workspace
assignin('base', 'G', G);

    % Run Simulink
    sim('MBK.slx');
    JCost = RefrenceError' * RefrenceError;

Iteration = evalin('base', 'Iteration');
Iteration = Iteration + 1;
assignin('base', 'Iteration', Iteration);
end
    