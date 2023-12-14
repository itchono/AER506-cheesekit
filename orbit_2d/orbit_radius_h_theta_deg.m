function r = orbit_radius_h_theta_deg(h, e, theta, mu)
% Orbital radius from h, theta in DEGREES

if nargin < 4
    mu = 3.986e14;
end

r = h^2 ./ mu * 1./(1 + e.* cosd(theta));
end
