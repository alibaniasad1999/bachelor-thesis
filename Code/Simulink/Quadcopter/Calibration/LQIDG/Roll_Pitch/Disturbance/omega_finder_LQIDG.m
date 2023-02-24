%%% omega maker from data %%%
%% add data ----> data name = roll_pitch_LQIDG_distubance
Time = seconds(0:0.02:100);
roll_pitch_LQIDG_distubance = roll_pitch_LQIDG_distubance * 180/pi; % make it deg
a1 = timetable(roll_pitch_LQIDG_distubance(:, 1), 'RowTimes', Time);
a2 = timetable(roll_pitch_LQIDG_distubance(:, 2), 'RowTimes', Time);
a3 = a2;
a4 = timetable(roll_pitch_LQIDG_distubance(:, 3), 'RowTimes', Time);
a5 = timetable(roll_pitch_LQIDG_distubance(:, 4), 'RowTimes', Time);
a6 = a5;
