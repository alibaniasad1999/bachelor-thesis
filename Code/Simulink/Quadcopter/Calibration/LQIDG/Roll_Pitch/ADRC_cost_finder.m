LQIDG_solver;
R = 1;
R_d = 10^weighting_matrix(end);
Time = seconds(0:0.02:30);
load("ADRC_d_1")
zero_state = zeros(1, length(ADRC_roll_pitch));
sim_name = "ADRC_d_";
cost = zeros(2, 5);
for i=1:5
    load(append(sim_name, string(i)))
    a1 = timetable(ADRC_roll_pitch(:, 1), 'RowTimes', Time);
    a2 = timetable(ADRC_roll_pitch(:, 2), 'RowTimes', Time);
    a3 = timetable(zero_state', 'RowTimes', Time);
    a4 = timetable(ADRC_roll_pitch(:, 3), 'RowTimes', Time);
    a5 = timetable(ADRC_roll_pitch(:, 4), 'RowTimes', Time);
    a6 = timetable(zero_state', 'RowTimes', Time);
    sim_data = sim("ADRC_finder.slx");
    cost(:, i) = cost_calculator(sim_data, Q_roll, Q_pitch, R, R_d, Time);
end
save('ADRC_cost', 'cost');



function cost = cost_calculator(sim_data, Q_roll, Q_pitch, R, R_d, Time)

cost_array = zeros(2, length(Time));
for i=1:length(Time)
    cost_array(1, i) = sim_data.roll.Data(:,:, i) * Q_roll ...
        * sim_data.roll.Data(:,:, i)' + sim_data.u.Data(i, 1) * R * sim_data.u.Data(i, 1) ....
        - sim_data.roll_d.Data(i) * R_d * sim_data.roll_d.Data(i);
    cost_array(2, i) = sim_data.pitch.Data(:,:, i) * Q_pitch ...
        * sim_data.pitch.Data(:,:, i)' + sim_data.u.Data(i, 2) * R * sim_data.u.Data(i, 2) ....
        - sim_data.pitch_d.Data(i) * R_d * sim_data.pitch_d.Data(i);
end
cost = zeros(1, 2);
cost(1) = trapz(0:0.02:30, cost_array(1, :));
cost(2) = trapz(0:0.02:30, cost_array(2, :));
end
