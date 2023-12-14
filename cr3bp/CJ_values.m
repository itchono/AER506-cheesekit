function CJ_L = CJ_values(m_1, m_2, r_12)

% Jacobi constant values in m^2/s^2 for each Lagrange point
G = 6.67e-11;
mu_1 = G*m_1;
mu_2 = G*m_2;
mu = G*(m_1 + m_2);
pi_1 = m_1 / (m_1 + m_2);
pi_2 = m_2 / (m_1 + m_2);

Omega = sqrt(mu/r_12^3);
r_p1 = [-pi_2 * r_12; 0];
r_p2 = [pi_1 * r_12; 0];
r_L = lagrange_points(m_1, m_2, r_12);
CJ_L = CJ_zero_vel(r_L(1, :), r_L(2, :));

function CJ = CJ_zero_vel(x, y)
    r1 = sqrt((r_p1(1) - x).^2 + (r_p1(2) - y).^2);
    r2 = sqrt((r_p2(1) - x).^2 + (r_p2(2) - y).^2);

    CJ = Omega.^2 * (x.^2 + y.^2) + 2.*mu_1./r1 + 2.*mu_2./r2;
end

end