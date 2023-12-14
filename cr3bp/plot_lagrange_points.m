function plot_lagrange_points(m_1, m_2, r_12)
% Shameless plotting function :)
r_L = lagrange_points(m_1, m_2, r_12);
pi_1 = m_1 / (m_1 + m_2);
pi_2 = m_2 / (m_1 + m_2);

x_L1 = r_L(1, 1);
x_L2 = r_L(1, 2);
x_L3 = r_L(1, 3);
pos_L4 = r_L(:, 4);
pos_L5 = r_L(:, 5);

% Lines
plot([pos_L4(1), -pi_2 * r_12, pos_L5(1), pi_1 * r_12, pos_L4(1)],...
    [pos_L4(2), 0, pos_L5(2), 0, pos_L4(2)], "r--", HandleVisibility="off")
hold on
plot([x_L3, pi_1 * r_12], [0, 0], "r--", HandleVisibility="off")
plot([x_L2, pi_1 * r_12], [0, 0], "r--", HandleVisibility="off")

% Markers
plot(-pi_2 * r_12, 0, "o", MarkerFaceColor="#21B4AD", MarkerSize=20)
plot(pi_1 * r_12, 0, "o", MarkerFaceColor="#992CBF", MarkerSize=20)
plot(x_L1, 0, "o", MarkerFaceColor="#CA4C29", MarkerEdgeColor="none")
plot(x_L2, 0, "o", MarkerFaceColor="#C6D822", MarkerEdgeColor="none")
plot(x_L3, 0, "o", MarkerFaceColor="#2277D8", MarkerEdgeColor="none")
plot(pos_L4(1), pos_L4(2), "o", MarkerFaceColor="#29CA6F", MarkerEdgeColor="none")
plot(pos_L5(1), pos_L5(2), "o", MarkerFaceColor="#29CA6F", MarkerEdgeColor="none")
grid

legend("B1", "B2", "L1", "L2", "L3", "L4", "L5")
title("Lagrange Points")

end
