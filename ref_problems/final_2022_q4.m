% 2022 Final Q4
phi = 45;
Theta = 45;

%% Position of spacecraft
G_R = earth_position(phi, Theta, 0);
H_rho = rho_from_Aa(0, 90, 300e3);
G_R_H = rot_G_H(phi, Theta);

G_r_vec = G_R + G_R_H * H_rho;

%% Orbits
mu = 3.986e14;
ra = norm(G_r_vec);
va = sqrt(mu/ra);

rp = hohmann_from_v1(ra, va-3e3, mu);
[a, e, h, T] = orbit_from_rarp(ra, rp, mu);

%% Determine impact point with Earth
RE = 6378e3;
theta_impact = acosd((a*(1-e^2) / RE - 1)/e);
M_impact = theta_deg_to_M(theta_impact, e);
T_impact = M_to_tof(M_impact, pi, a, mu);

disp(T_impact)


