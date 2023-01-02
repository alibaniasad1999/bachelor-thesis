QuadParameter;
% A Constants
A1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_xx);
A2 = (J_yy -J_zz) / (J_xx);
A3 = (b * d_cg) / (m_tot * h_cg^2 + J_xx);
A4 = (J_R) / (J_xx);
A5 = (m1 * g * miu_k * r_x) / (m_tot * h_cg^2 + J_xx);
% B Constants
B1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_yy);
B2 = (- J_xx + J_zz) / (J_yy);
B3 = (b * d_cg) / (m_tot * h_cg^2 + J_yy);
B4 = (-J_R) / (J_yy);
B5 = (m2 * g * miu_k * r_y) / (m_tot * h_cg^2 + J_yy);
% C Constants
C1 = (J_xx - J_yy) / (J_zz);
C2 = (d) / (J_zz);
C3 = (m3 * g * miu_k * r_z) / (J_zz);
% omega for linearzation 2000 RPM
Omega = 2000 / 60 * 2 * pi;
roll_parameter_estiation_result_II;
pitch_parameter_estiation_result_II;
% roll_pitch_parameter_estimation;