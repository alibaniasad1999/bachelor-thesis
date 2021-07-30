%%%%%%%%%%%% Quadcopter system %%%%%%%%%%%%
function [A, Bu1, Bu2, Bu3] = Quadcopter_system(X)

QuadConstants;

% System = Ax + B1u1 + B2u2 + B3u3

x1     = X(1);
x2     = X(2);
x4     = X(4);
x5     = X(5);
x6     = X(6);

%%%%%%%%% Linearization %%%%%%%%%

%%%%% A matrix %%%%%
A11    = x5 * cos(x1) * tan(x2)   - x6 * sin(x1) * tan(x2); %da1dx1
A12    = x5 * sin(x1) / cos(x2)^2 + x6 * cos(x1) / cos(x2)^2; %da1dx2
A13    = 0; %da1dx3
A14    = 1; %da1dx4
A15    = sin(x1) * tan(x2); %da1dx5
A16    = cos(x1) * tan(x2); %da1dx6
A21    = -x5 * sin(x1) -x6 * cos(x1); %da2dx1
A22    = 0; %da2dx2
A23    = 0; %da2dx3
A24    = 0; %da2dx4
A25    =  cos(x1); %da2dx5
A26    = -sin(x1); %da2dx6
A31    = (x5 * cos(x1) - x6 * sin(x1)) * sec(x2);
A32    = (x5 * sin(x1) + x6 * cos(x1)) * sec(x2) * tan(x2);
A33    = 0;
A34    = 0;
A35    = sin(x1) * sec(x2);
A36    = cos(x1) * sec(x2);
A41    =  A1 * cos(x2) * cos(x1);
A42    = -A2 * sin(x1) * sin(x2);
A43    = 0;
A44    = 0;
A45    = A2 * x6;
A46    = 0;
A51    = 0;
A52    = B1 * cos(x2);
A53    = 0;
A54    = B2 * x6;
A55    = 0;
A56    = B2 * x6;
A61    = 0;
A62    = 0;
A63    = 0;
A64    = C1 * x5;
A65    = C1 * x4;
A66    = 0;
%%%%% B matrix(B1, B2, B3) %%%%%
%%% about u1, u2, u3 %%%
% u1 = omega_2^2 - omega_4^2
% u2 = omega_1^2 - omega_3^2
% u1 = omega_1^2 - omega_2^2 + omega_3^2 - omega_4^2
Bu1 = [0 ;
      0 ;
      0 ;
      A3;
      0 ;
      0];
  
Bu2 = [0 ;
      0 ;
      0 ;
      0 ;
      B3;
      0];
  
Bu3 = [0  ;
      0  ;
      0  ;
      0  ;
      0  ;
      C2];
%%%%%%%%%%%%%% Ax B1u1 + B2u2 + B3u3 %%%%%%%%%%%%%%
A      = [A11 A12 A13 A14 A15 A16 ;
          A21 A22 A23 A24 A25 A26 ;
          A31 A32 A33 A34 A35 A36 ;
          A41 A42 A43 A44 A45 A46 ;
          A51 A52 A53 A54 A55 A56 ;
          A61 A62 A63 A64 A65 A66];
end