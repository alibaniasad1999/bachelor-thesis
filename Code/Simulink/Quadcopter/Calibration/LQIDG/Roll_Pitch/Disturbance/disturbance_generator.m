tf = 80;
step_time = 0.02;
time = 0:step_time:tf;
omega_1_d = zeros(1, length(time));
omega_2_d = zeros(1, length(time));
omega_3_d = zeros(1, length(time));
omega_4_d = zeros(1, length(time));

t_1 = 20;
t_2 = 60;
disturbance = 50*60/2/pi;

for i=1:length(time)
    if time(i) > t_1 && time(i) < t_2
        omega_1_d(i) = disturbance;
    end
end

for i=1:length(time)
    if time(i) > t_1 && time(i) < t_2
        omega_2_d(i) = disturbance;
    end
end

for i=1:length(time)
    if time(i) > t_1 && time(i) < t_2
        omega_3_d(i) = -disturbance;
    end
end

for i=1:length(time)
    if time(i) > t_1 && time(i) < t_2
        omega_4_d(i) = -disturbance;
    end
end

