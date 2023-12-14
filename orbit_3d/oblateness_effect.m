function [Omega_dot, omega_dot] = oblateness_effect(a, e, i, mu, RE, J2)
% Inclination in degrees!
% Output rates in rad/s

if nargin < 4
    mu = 3.986e14;
    RE = 6378e3;
    J2 = 1.080263e-3;
end

fac = j2_fac(a, e, mu, RE, J2);

Omega_dot = fac * cosd(i);
omega_dot = fac * (5/2 * sind(i)^2 - 2);
end