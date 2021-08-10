function K_ans = Algebraeic_riccari_solver(a, b, q1, q2, R)
A = [0 1 ;
     a 0];

B = [0 ;
     b];

K_ans = zeros(2, 2);
% algebraic_riccati = K * A + A' * K - K * B * R^-1 * B' * K + Q;
% first equation q1 + 2*a*k12 - (b^2*k12^2)/R = 0
% Ans1 K12 = -m*(k + (k^2 + Q11)^(1/2))
% Ans2 K12 = -m*(k - (k^2 + Q11)^(1/2))
K12 = zeros(1, 2);
K12(1) = (R*(a + ((R*a^2 + q1*b^2)/R)^(1/2)))/b^2;
K12(2) = (R*(a - ((R*a^2 + q1*b^2)/R)^(1/2)))/b^2;
for i = 1:length(K12)
    if ~isreal(K12(i))
        continue;
    end
    % Second equation 2*k12 + q2 - (b^2*k22^2)/R = 0
    % Ans1 K12 =  (2*k12 + q2)^(1/2)/(R^(1/2)*b)
    % Ans2 K12 = -(2*k12 + q2)^(1/2)/(R^(1/2)*b)
    K22 = zeros(1, 2);
    K22(1) =  (R^(1/2)*(2*K12(i) + q2)^(1/2))/b;
    K22(2) = -(R^(1/2)*(2*K12(i) + q2)^(1/2))/b;
    for j = 1:length(K22)
        if ~isreal(K22(j))
            continue
        end
        % Last equation k11 + a*k22 - (b^2*k12*k22)/R = 0
        % Ans R*k12*k22*b^2 - a*k22
        K11 = (K12(i)*K22(j)*b^2)/R - a*K22(j);
        temp_K = zeros(2, 2);
        temp_K(1, 1) = K11;
        temp_K(1, 2) = K12(i);
        temp_K(2, 1) = K12(i);
        temp_K(2, 2) = K22(j);
        if all(eig(A - B * R^(-1)* B' * temp_K) < 0)
            K_ans = temp_K;
            break;
        end
    end
end