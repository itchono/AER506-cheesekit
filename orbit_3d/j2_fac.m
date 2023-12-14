function fac = j2_fac(a, e, mu, RE, J2)
% Useful for sun sync orbits, take acos

if nargin < 3
    mu = 3.986e14;
    RE = 6378e3;
    J2 = 1.080263e-3;
end

fac = -3/2 * sqrt(mu) * RE^2 / ((1-e^2)^2 * a^3.5) * J2;

end