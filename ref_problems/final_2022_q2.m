%% Part a)
L_i = lagrange_points(1, 1, 1)
% Distance from primary bodies (scaled by R)
r_b1 = [-0.5; 0];
r_b2 = [0.5; 0];

L_i - r_b1
L_i - r_b2


%% Part b)
G = 6.67e-11;
CJ_L = CJ_values(1, 1, 1) / G  % normalized to GM/R

CJ_plot(1, 1, 1)