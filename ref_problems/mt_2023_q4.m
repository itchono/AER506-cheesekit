%% Part a)

% Get orbit of current spacecraft
mu = 3.986e14;
rp = 10000e3;
ra = 22000e3;

[a, e, h, T] = orbit_from_rarp(ra, rp, mu);
theta_obs = 75;

% perifocal frame {Q}
[Q_rs, Q_vs] = get_perifocal(h, e, theta_obs, mu);

% Let us also define a rotating frame called {S} which rotates with the SC
% {S} is aligned with Q, but rotating
S_u_los = [-sind(theta_obs); cosd(theta_obs); 0];
S_rho = 5000e3 * S_u_los;
S_vrel = 5e3 * S_u_los;

% Determine rotation rate, theta dot, which is h/r^2 (big brain)
S_omega_QS = [0; 0; h/norm(Q_rs)^2];
Q_vrel = S_vrel + cross(S_omega_QS, S_rho);

fprintf("PART A\n")
Q_vo = Q_vs + Q_vrel
norm(Q_vo)

%% Part b)
fprintf("PART B\n")
Q_ro = Q_rs + S_rho
norm(Q_ro)

%% Part c)
% Fit orbit
% surprisingly, this move is still legal even with a hyperbolic trajectory
ke = cartesian2keplerian([Q_ro; Q_vo], mu);
fprintf("PART C\n")
print_ke(ke);

%% Part d)
a_o = ke(1);
e_o = ke(2);
% again, this move is still legal even with a hyperbolic trajectory
rp_o = a_o * (1-e_o);

fprintf("PART D\n")
hp_o = rp_o - 6378e3  % periapsis altitude

%% Part e)
fprintf("PART E\n")
theta_o = ke(6)
