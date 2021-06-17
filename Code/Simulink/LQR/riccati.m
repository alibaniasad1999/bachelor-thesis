%%% Riccati solver %%%
m = 10;
b = 2;
k = 5;
A = [0    1;
   -k/m -b/m];
B = [0; 1/m];
Q = [1000 0;...
     0 1] ;
R = 1;
Forloop = 0;

if 1
    K_ans = zeros(2, 2);
    % algebraic_riccati = K * A + A' * K - K * B * R^-1 * B' * K + Q;
    % first equation - K12^2/m^2 - (2*K12*k)/m + Q11 = 0
    % Ans1 K12 = -m*(k + (k^2 + Q11)^(1/2))
    % Ans2 K12 = -m*(k - (k^2 + Q11)^(1/2))
    K12 = zeros(1, 2);
    K12(1) = -m*(k + (k^2 + Q(1, 1))^(1/2));
    K12(2) = -m*(k - (k^2 + Q(1, 1))^(1/2));
    for i = 1:length(K12)
        if ~isreal(K12(i))
            continue;
        end
        % Second equation 2*K12 + Q22 - K22^2/m^2 - (2*K22*b)/m = 0
        % Ans1 K12 = -m*(b + (b^2 + 2*K12 + Q22)^(1/2))
        % Ans2 K12 = -m*(b + (b^2 + 2*K12 + Q22)^(1/2))
        K22 = zeros(1, 2);
        K22(1) = -m*(b + (b^2 + 2*K12(i) + Q(2, 2))^(1/2));
        K22(2) = -m*(b - (b^2 + 2*K12(i) + Q(2, 2))^(1/2));
        for j = 1:length(K22)
            if ~isreal(K22(j))
                continue
            end
            % Last equation K11 - (K12*K22)/m^2 - (K12*b)/m - (K22*k)/m
            % Ans (K12*K22 + K12*b*m + K22*k*m)/m^2
            K11 = (K12(i)*K22(j) + K12(i)*b*m + K22(j)*k*m)/m^2;
            temp_K = zeros(2, 2);
            temp_K(1, 1) = K11;
            temp_K(1, 2) = K12(i);
            temp_K(2, 1) = K12(i);
            temp_K(2, 2) = K22(j);
            if all(eig(A - B * R^(-1)* B' * temp_K) < 0)
                Forloop = 1;
                K_ans = temp_K;
                break;
            end
        end
        if isempty(Forloop == 1)
            break;
        end
    end
end