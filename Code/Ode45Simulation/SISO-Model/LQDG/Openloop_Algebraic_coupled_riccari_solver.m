function k_ans = Openloop_Algebraic_coupled_riccari_solver(a, b, q1, q2, R1, R2)

A = [0 1 ;
     a 0];
B = [0 ;
     b];
R1_inv = R1^-1;
R2_inv = R2^-1;
k1_ans = zeros(2, 2);
k2_ans = zeros(2, 2);
valid_ans = false;
% algebraic_riccati
% eq1	= -A' * k1 - k1 * A - Q + k1 * S1 * k1 + k1 * S2 * k2 = 0;
% eq2	= -A' * k2 - k2 * A - Q + k2 * S2 * k2 + k2 * S1 * k1 = 0;
% first equation 
% 1 (b^2*k12_1^2)/R1 + (k12_2*b^2*k12_1)/R2 - 2*a*k12_1 - q1_1
% 2 (b^2*k12_2^2)/R2 + (k12_1*b^2*k12_2)/R1 - 2*a*k12_2 - q1_2
% Ans1 K12 = -m*(k + (k^2 + Q11)^(1/2))
% Ans2 K12 = -m*(k - (k^2 + Q11)^(1/2))
k12_1 = zeros(1, 2);
k12_2 = zeros(1, 2);
k12_1(1) =   (R1*R2*a + R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
k12_1(2) =  -(R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) - R1*R2*a + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
k12_2(1) =  (R1*R2*a + R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
k12_2(2) = -(R1*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2) - R1*R2*a + R2*b^2*((R1*R2*(R1*R2*a^2 + R1*b^2*q1 + R2*b^2*q1))/(b^4*(R1 + R2)^2))^(1/2))/(R1*b^2 + R2*b^2);
for i = 1:length(k12_1)
    if ~isreal(k12_1(i)) || ~isreal(k12_2(i))
        continue;
    end
    % Second equation 
    % 1 (b^2*k22_1^2)/R1 + (k22_2*b^2*k22_1)/R2 - 2*k12_1 - q2 = 0
    % 2 (b^2*k22_2^2)/R2 + (k22_1*b^2*k22_2)/R1 - 2*k12_2 - q2
    % Ans1 K22_1 =  -((2*k12_1 + q2)*((R1*R2*
    % (2*k12_2 + q2)^2)/(b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))
    % ^(1/2))/(2*k12_2 + q2)
    
    % Ans2 K22_1 = ((2*k12_1 + q2)*((R1*R2*(2*k12_2 + q2)^2)
    % /(b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2))/(2*k12_2 + q2)
    
    % Ans1 K22_2 =  -((R1*R2*(2*k12_2 + q2)^2)/(b^2*
    % (2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2)

    % Ans1 K22_2 = ((R1*R2*(2*k12_2 + q2)^2)/
    % (b^2*(2*R1*k12_2 + 2*R2*k12_1 + R1*q2 + R2*q2)))^(1/2)
    
    k22_1 = zeros(1, 2);
    k22_1(1) = -((2*k12_1(i) + q2)*((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2))/(2*k12_2(i) + q2);
    k22_1(2) =  ((2*k12_1(i) + q2)*((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2))/(2*k12_2(i) + q2);
    k22_2(1) = -((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2);
    k22_2(2) =  ((R1*R2*(2*k12_2(i) + q2)^2)/(b^2*(2*R1*k12_2(i) + 2*R2*k12_1(i) + R1*q2 + R2*q2)))^(1/2);
    for j = 1:length(k22_1)
        if ~isreal(k22_1(j)) || ~isreal(k22_2(j))
            continue
        end
        % Last equation 
        % 1 (b^2*k12_1*k22_1)/R1 - a*k22_1 - k11_1 + (b^2*k12_2*k22_1)/R2
        % Ans k11_1 = (b^2*k12_1*k22_1)/R1 - a*k22_1 + (b^2*k12_2*k22_1)/R2
        % Ans k11_2 = (b^2*k12_1*k22_1)/R1 - a*k22_1 + (b^2*k12_2*k22_1)/R2
        k11_1 = (b^2*k12_1(i)*k22_1(j))/R1 - a*k22_1(j) + (b^2*k12_2(i)*k22_1(j))/R2;
        k11_2 = (b^2*k12_1(i)*k22_2(j))/R1 - a*k22_2(j) + (b^2*k12_2(i)*k22_2(j))/R2;
        temp_K_1 = zeros(2, 2);
        temp_K_1(1, 1) = k11_1;
        temp_K_1(1, 2) = k12_1(i);
        temp_K_1(2, 1) = k12_1(i);
        temp_K_1(2, 2) = k22_1(j);
        temp_K_2 = zeros(2, 2);
        temp_K_2(1, 1) = k11_2;
        temp_K_2(1, 2) = k12_2(i);
        temp_K_2(2, 1) = k12_2(i);
        temp_K_2(2, 2) = k22_2(j);
        if all(eig(A + (-R1_inv*B'*temp_K_1 -R2_inv*B'*temp_K_2)) < 0)
            k1_ans = temp_K_1;
            k2_ans = temp_K_2;
            valid_ans = true;
            break;
        end
        if valid_ans == true
            break;
        end
    end
    if valid_ans == true
        break;
    end
end
k_ans = [k1_ans; k2_ans];