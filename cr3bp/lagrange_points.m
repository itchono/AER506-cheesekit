function r_L = lagrange_points(m_1, m_2, r_12)
% Positions of all 5 lagrange points in 2D
% Inefficient, but meh

pi_1 = m_1 / (m_1 + m_2);
pi_2 = m_2 / (m_1 + m_2);

% Function to solve for L1, L2, L3 (in a straight line)
f = @(xi) (1-pi_2) .* (xi + pi_2) ./ abs(xi + pi_2).^3 + pi_2 .* (xi + pi_2 - 1) ./ abs(xi + pi_2 - 1).^3 - xi;

% One solution will be positive and greater than x_2 (L2; beyond Earth)
% One solution will be positive and less than x_2 (L1; between CG and Earth)
% One solution will be negative (L3; on opposite side of CG)

% xi = x/r_12, so choose: L1 -> xi = [0, 0.9999], L2 -> xi = [1.0001, 2], L3 -> x = -1
try
    xi_L1 = fzero(f, [0, 1-1e-6]);
catch
    ok_ = false;
    ub = 0.99;
    while ~ok_
        try
        xi_L1 = fzero(f, [0, ub]);
        ok_ = true;
        catch
        ub = ub-0.01;
        end
    end
end
xi_L2 = fzero(f, [1 + 1e-6, 2]);
xi_L3 = fzero(f, -1);

x_L1 = xi_L1 * r_12;
x_L2 = xi_L2 * r_12;
x_L3 = xi_L3 * r_12;

% L4 and L5 are analytical
pos_L4 = [r_12 / 2 - pi_2 * r_12; sqrt(3)/2 * r_12];
pos_L5 = [r_12 / 2 - pi_2 * r_12; -sqrt(3)/2 * r_12];

r_L = [[x_L1; 0], [x_L2; 0], [x_L3; 0], pos_L4, pos_L5];