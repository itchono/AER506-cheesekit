rc = 180e3 + 6378e3;
mu = 3.986e14;

[a, e, h, T] = orbit_from_rarp(rc, rc, mu);

% All rates below are rad/s
w_e = 7.2921e-5;
rot_earth = -T * w_e;
Omega_dot = oblateness_effect(a, e, 30);
net_rot = rot_earth + T * Omega_dot;

% km
spacing = -net_rot * 6378