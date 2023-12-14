function [r, v] = get_perifocal(h, e, theta, mu)

if nargin < 4
    mu = 3.986e14;
end

r = orbit_radius_h_theta_deg(h, e, theta, mu) * [cosd(theta); sind(theta); 0];
v = mu/h * [-sind(theta); e + cosd(theta); 0];

end