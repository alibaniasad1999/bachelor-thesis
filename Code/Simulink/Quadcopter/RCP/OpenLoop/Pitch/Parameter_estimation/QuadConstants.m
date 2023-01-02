QuadParameter;
% A Constants
A1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_xx);
A2 = (2*m_tot * h_cg^2 + J_yy - J_zz) / (m_tot * h_cg^2 + J_xx);
A3 = (b * d_cg) / (m_tot * h_cg^2 + J_xx);
A4 = (J_R) / (m_tot * h_cg^2 + J_xx);
% A5 = (m1 * g * miu_k * r_x) / (m_tot * h_cg^2 + J_xx);
% B Constants

B1 = (h_cg * g * m_tot) / (m_tot * h_cg^2 + J_yy);
B2 = (-2*m_tot * h_cg^2 - J_xx + J_zz) / (m_tot * h_cg^2 + J_yy);
B3 = (b * d_cg) / (J_yy);
B4 = (-J_R) / (m_tot * h_cg^2 + J_yy);
% B5 = (m2 * g * miu_k * r_y) / (m_tot * h_cg^2 + J_yy);
B5 = 0.595980110229882;
B6 = 4.42876359313229;
% C Constants
C1 = (J_xx - J_yy) / (J_zz);
C2 = (d) / (J_zz);
C3 = (m3 * g * miu_k * r_z) / (J_zz);
% pitch_parameter_estiation_result_II;