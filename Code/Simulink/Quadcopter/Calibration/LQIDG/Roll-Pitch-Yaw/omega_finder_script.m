LQIDG_3DOF;
load('data_film_1.mat');
time = linspace(0, 100, length(simout));
Time = seconds(time)';
TT = timetable(Time, simout);

