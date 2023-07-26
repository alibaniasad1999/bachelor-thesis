% Basic Parameter of Quadrotor
dcg =0.21;                      %Arm Length(m)
%%  ================================================================
% Calculate of  Inerial Moment
I_Rotor =8.3e-5;               %Rotational moment of inertia around the propeller axis(Nm(s^2))
I_XX =0.02839;                  %MOMENT INERTIAL around X axis(Nm(s^2))
I_YY =0.03066;                  %MOMENT INERTIAL around Y axis(Nm(s^2))
I_ZZ =0.0439;                   %MOMENT INERTIAL around Z axis(Nm(s^2))
%%  ================================================================
% Calculate of  Forces Factor && Moments Factor
b =3.13e-5;  % Thrust Factor(N*s^2)
d =3.2e-6;   % Drag MomentFactor(N*m*s^2)
%% =================================================================