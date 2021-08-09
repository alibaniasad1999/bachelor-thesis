%%%%%%%%%%%% Quadcopter system %%%%%%%%%%%%
function [Au1, Au2, Au3, Bu1, Bu2, Bu3] = SISO_Quadcopter_system(X)

QuadConstants;

% System = Ax + B1u1 + B2u2 + B3u3

x1     = X(1);
x2     = X(2);

%%%%%%%%% Linearization %%%%%%%%%

%%%%% A matrix %%%%%
A11    = 0; %da1dx1
A14    = 1; %da1dx4
A22    = 0; %da2dx2
A25    = 1; %da2dx5
A33    = 0; %da3dx3
A36    = 1; %da3dx6
A41    = A1 * cos(x1); %da4dx1
A44    = 0; %da4dx4
A52    = B1 * cos(x2); %da5dx2
A55    = 0; %da5dx5
A63    = 0; %da6dx3
A66    = 0; %da6dx6
%%%%%%%%%%%%%% A1x1 A2x2 A3x3 B1u1 + B2u2 + B3u3 %%%%%%%%%%%%%%
% roll
Au1    = [A11, A14 ;
          A41, A44];
% pitch
Au2    = [A22, A25 ;
          A52, A55];

% yaw
Au3    = [A33, A36 ;
          A63, A66];
%%%%% B matrix(B1, B2, B3) %%%%%
%%% about u1, u2, u3 %%%
% u1 = omega_2^2 - omega_4^2
% u2 = omega_1^2 - omega_3^2
% u1 = omega_1^2 - omega_2^2 + omega_3^2 - omega_4^2
Bu1     = [0  ;
           A3];
  
Bu2     = [0  ;
           B3];
  
Bu3    = [0  ;
          C2];

end