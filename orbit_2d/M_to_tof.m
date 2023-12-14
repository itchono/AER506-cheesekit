function t = M_to_tof(M1, M2, a, mu)
% M to time of flight between two points
% works for both hyp and elliptical
% (you can pass in a < 0)
if nargin < 3
    mu = 3.986e14;
end

characteristic_period = sqrt(abs(a)^3 / mu);
t = (M2 - M1) * characteristic_period;
end