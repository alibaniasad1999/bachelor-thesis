%%% LQDG solver for MBK system %%%
syms Q11 Q22 G P11 P12 P22
m = sym('m', 'real'); % Mass
b = sym('b', 'real'); % Viscous Friction Coefficient 
k = sym('k', 'real'); % Spring Constant
%% State Space
% x_dot = Ax + Bu - Dv (DV: Disturbance)
A = [ 0    1;
    -k/m -b/m];
C = [0 1];
B = [ 0 ;
     1/m];
D = B;
% Weight Matrix (G is weight matrix)
R = 1;
Q = [Q11    0;
     0   Q22];
%% Riccati Equation
P = [P11 P12 ;
     P12 P22];
if 1 % use for simulink
    P_ans = zeros(2, 2);
    % P * A + A' * P - P * B * R^-1 * B' * P + P * D * G^-1 * D' * P + Q
    % first equation Q11 - P12^2/m^2 + P12^2/(G*m^2) - (2*P12*k)/m = 0
    % Ans1 P12 = -(G*m*(k - ((G*k^2 - Q11 + G*Q11)/G)^(1/2)))/(G - 1)
    % Ans2 P12 = -(G*m*(k - ((G*k^2 - Q11 + G*Q11)/G)^(1/2)))/(G - 1)
    if ((G*k^2 - Q11 + G*Q11)/G) > 0
        P12(1) = -(G*m*(k - ((G*k^2 - Q11 + G*Q11)/G)^(1/2)))/(G - 1);
        P12(2) = -(G*m*(k - ((G*k^2 - Q11 + G*Q11)/G)^(1/2)))/(G - 1);
    else
        P12(1) = Inf;
        P12(2) = Inf;
    end
    for i = 1:length(P12)
        if P12(i) == Inf
            continue;
        end
        % Second equation 2*P12 + Q22 - P22^2/m^2 + P22^2/(G*m^2) -
        % (2*P22*b)/m = 0
        % Ans1 K12 =  -(G*m*(b + ((G*b^2 - 2*P12 - Q22 + 2*G*P12 + G*Q22)/G)^(1/2)))/(G - 1)
        % Ans2 K12 =  -(G*m*(b - ((G*b^2 - 2*P12 - Q22 + 2*G*P12 + G*Q22)/G)^(1/2)))/(G - 1)
        P22 = zeros(1, 2);
        if ((G*b^2 - 2*P12 - Q22 + 2*G*P12 + G*Q22)/G) > 0
            P22(1) = -(G*m*(b + ((G*b^2 - 2*P12 - Q22 + 2*G*P12 + G*Q22)/G)^(1/2)))/(G - 1);
            P22(2) = -(G*m*(b - ((G*b^2 - 2*P12 - Q22 + 2*G*P12 + G*Q22)/G)^(1/2)))/(G - 1);
        else
            P22(2) = Inf;
            P22(1) = Inf;
        end
        for j = 1:length(P22)
            if P22(j) == Inf
                continue
            end
            % Last equation P11 - (P12*P22)/m^2 - (P12*b)/m - (P22*k)/m + (P12*P22)/(G*m^2)
            % Ans P11 = (P12*P22)/m^2 + (P12*b)/m + (P22*k)/m - (P12*P22)/(G*m^2)
            P11 = (P12(i)*P22(j) + P12(i)*b*m + P22(j)*k*m)/m^2;
            temp_P = zeros(2, 2);
            temp_P(1, 1) = P11;
            temp_P(1, 2) = P12(i);
            temp_P(2, 1) = P12(i);
            temp_P(2, 2) = P22(j);
            if all(eig(A - B * R^(-1)* B' * temp_P) < 0)
                Forloop = 1;
                K_ans = temp_P;
                break;
            end
        end
        if isempty(Forloop)
            break;
        end
    end
end