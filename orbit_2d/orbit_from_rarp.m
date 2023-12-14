function [a, e, h, T] = orbit_from_rarp(ra, rp, mu)
% convenient orbit properties from ra, rp

if nargin < 3
    mu = 3.986e14;
end

% sanity check; swap if I got it backwards
if rp > ra
    fprintf("You reversed ra and rp, fool. DW I gotchu\n")
    mid = ra;
    ra = rp;
    rp = mid;
end

a = (ra + rp) / 2;
e = (ra - rp) / (ra + rp);

T = 2*pi*sqrt(a^3 / mu);
h = sqrt(mu * a * (1-e^2));

end