RCP_data_I;
iodata = AHRS_RCP;
% SDO: Specify experiment I/O
Exp = sdo.Experiment('Quad_Nonlinear_Pitch_PID');
% Theta Signal
Theta = Simulink.SimulationData.Signal;
Theta.Name = 'Theta';
Theta.BlockPath = 'Quad_Nonlinear_Pitch_PID/Quadcopter 3DOF Nonlinear';
Theta.PortType  = 'outport';
Theta.PortIndex = 1;
Theta.Values    = timeseries(iodata(1), time);
% Pitch rate
pitch_rate = Simulink.SimulationData.Signal;
pitch_rate.Name = 'pitch_rate';
pitch_rate.BlockPath = 'Quad_Nonlinear_Pitch_PID/Quadcopter 3DOF Nonlinear';
pitch_rate.PortType  = 'outport';
pitch_rate.PortIndex = 2;
pitch_rate.Values    = timeseries(iodata(2), time);
Exp.OutputData = [Theta      ;...
                  pitch_rate];
% initial
% Exp.InitialStates = sdo.getStateFromModel('Quad_Nonlinear_Pitch_PID',...
%     'u2Omega');
% Exp.InitialStates.Minimum = 0;
% Exp.InitialStates.Free    = true;

Simulator    = createSimulator(Exp);
Simulator    = sim(Simulator);
SimLog       = find(Simulator.LoggedData,get_param(...
    'Quad_Nonlinear_Pitch_PID','SignalLoggingName'));

ThetaSignal      = find(SimLog,'Theta');
Pitch_rateSignal = find(SimLog,'pitch_rate');
% plot
plot(time, iodata, ...
ThetaSignal.Values.Time,ThetaSignal.Values.Data,'--', ...
    Pitch_rateSignal.Values.Time,Pitch_rateSignal.Values.Data,'-.');

p = sdo.getParameterFromModel('Quad_Nonlinear_Pitch_PID',{'B1','B3','B5'});
p(1).Minimum = 1   ;   % B1 = 4.5301
p(1).Maximum = 7   ;
p(2).Minimum = 1e-5;   % B3 = 1.0908e-04
p(2).Maximum = 1e-3;
p(3).Minimum = 1e-3;   % B5 = 0.0070
p(3).Maximum = 7e-2;
s = getValuesToEstimate(Exp);
v = [p;s];
estFcn = @(v) sdoAircraftEstimation_Objective(v,Simulator,Exp);
opt = sdo.OptimizeOptions;
opt.Method = 'lsqnonlin';
% vOpt = sdo.optimize(estFcn,v,opt);




