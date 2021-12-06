load_data;
QuadParameter;
B1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_yy);
B3 = (b * d_cg) / (m_tot * h_cg^2 + J_yy);
A22    = 0; %da2dx2
A25    = 1; %da2dx5
A52    = B1; %da5dx2
A55    = 0; %da5dx5

A      = [A22, A25 ;
          A52, A55];
B      = [0  ;
          B3];
a      = A(2);
b      = B(2);

q1 = weighting_matrix(1);
q2 = weighting_matrix(2);
R  = weighting_matrix(3);

q1 = 10^q1/100;
q2 = 10^q2/100;
R  = 10^R;
R_inv = R^-1;

K12 = zeros(1, 2);
K12(1) = (R*(a + ((R*a^2 + q1*b^2)/R)^(1/2)))/b^2;
K12(2) = (R*(a - ((R*a^2 + q1*b^2)/R)^(1/2)))/b^2;
stable = false; % check stability answer for break code
for i = 1:length(K12)
    % Second equation 2*k12 + q2 - (b^2*k22^2)/R = 0
    % Ans1 K12 =  (2*k12 + q2)^(1/2)/(R^(1/2)*b)
    % Ans2 K12 = -(2*k12 + q2)^(1/2)/(R^(1/2)*b)
    valid22 = [true; true]; % for validation in complex number
    K22 = zeros(1, 2);
    if (2*K12(i) + q2) < 0
        valid22(i) = false;
    end
    if valid22(i)
        K22(1) =  (R^(1/2)*(2*K12(i) + q2)^(1/2))/b;
        K22(2) = -(R^(1/2)*(2*K12(i) + q2)^(1/2))/b;
    else
        continue;
    end
    for j = 1:length(K22)
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
            stable = true;
            break;
        end
    end
    if stable
        break;
    end
end

gain_matrix = -R_inv*B'*K_ans;
gain_matrix_race =    1.0e+05 *[-6.9656   -4.2184];