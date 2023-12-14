function [vr, vn, gamma] = get_radial(h, e, theta, mu)
% DEGREES EVERYTHING, radial velocities

vr = mu/h * e * sind(theta);
vn = mu/h * (1 + e * cosd(theta));
gamma = atan2d(vr, vn);

end