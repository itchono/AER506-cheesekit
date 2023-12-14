function CJ_plot(m_1, m_2, r_12)

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

[XX, YY] = meshgrid(linspace(-1.3, 1.3, 500)*r_12);

% Plot CJ for each value of XX, YY

CJ_i = CJ_zero_vel(XX, YY);
CJ_L = CJ_zero_vel(r_L(1, :), r_L(2, :));
for i = 1:3
subplot(230+i);
contourf(XX, YY, CJ_i > CJ_L(i), HandleVisibility="off");
hold on
plot_lagrange_points(m_1, m_2, r_12);
title(sprintf("CJ%d = %.5g", i, CJ_L(i)))
legend off
end
for i = 3:4
subplot(220+i);
% Regularization trick for L4/L5
contourf(XX, YY, CJ_i > CJ_L(i+1) * 1.0001, HandleVisibility="off");
hold on
plot_lagrange_points(m_1, m_2, r_12);
title(sprintf("CJ%d = %.5g", i+1, CJ_L(i+1)))
legend off
end
figure
contourf(XX, YY, CJ_i, CJ_L, HandleVisibility="off")
hold on
plot_lagrange_points(m_1, m_2, r_12);
title("Zero-Velocity Jacobi Contours")
colorbar

function CJ = CJ_zero_vel(x, y)
    r1 = sqrt((r_p1(1) - x).^2 + (r_p1(2) - y).^2);
    r2 = sqrt((r_p2(1) - x).^2 + (r_p2(2) - y).^2);

    CJ = Omega.^2 * (x.^2 + y.^2) + 2.*mu_1./r1 + 2.*mu_2./r2;
end
end