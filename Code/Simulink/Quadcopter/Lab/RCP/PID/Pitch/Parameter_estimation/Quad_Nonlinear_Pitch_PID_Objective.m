function vals = Quad_Nonlinear_Pitch_PID_Objective(v,Simulator,Exp) 
%SDOAIRCRAFTESTIMATION_OBJECTIVE
%
%    The sdoAircraftEstimation_Objective function is used to compare model
%    outputs against experimental data.
%
%    vals = sdoAircraftEstimation_Objective(v,Exp) 
%
%    The |v| input argument is a vector of estimated model parameter values
%    and initial states.
%
%    The |Simulator| input argument is a simulation object used 
%    simulate the model with the estimated parameter values.
%
%    The |Exp| input argument contains the estimation experiment data.
%
%    The |vals| return argument contains information about how well the
%    model simulation results match the experimental data and is used by
%    the |sdo.optimize| function to estimate the model parameters.
%
%    See also sdo.optimize, sdoExampleCostFunction,
%    sdoAircraftEstimation_cmddemo
%
 
% Copyright 2012-2015 The MathWorks, Inc.

%%
% Define a signal tracking requirement to compute how well the model output
% matches the experiment data. Configure the tracking requirement so that
% it returns the tracking error residuals (rather than the
% sum-squared-error) and does not normalize the errors.
%
r = sdo.requirements.SignalTracking;
r.Type      = '==';
r.Method    = 'Residuals';
r.Normalize = 'off';

%%
% Update the experiments with the estimated parameter values.
%
Exp  = setEstimatedValues(Exp,v);

%%
% Simulate the model and compare model outputs with measured experiment
% data.
%
Simulator = createSimulator(Exp,Simulator);
Simulator = sim(Simulator);

SimLog       = find(Simulator.LoggedData,get_param(...
    'Quad_Nonlinear_Pitch_PID','SignalLoggingName'));
ThetaSignal      = find(SimLog,'Theta');
Pitch_rateSignal = find(SimLog,'pitch_rate');

ThetaError = evalRequirement(r,ThetaSignal.Values,Exp.OutputData(1).Values);
Pitch_rateError = evalRequirement(r,Pitch_rateSignal.Values,Exp.OutputData(2).Values);
%%
% Return the residual errors to the optimization solver.
%
vals.F = reshape([ThetaError; Pitch_rateError], [length(ThetaError), 2]);
end