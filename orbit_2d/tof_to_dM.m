function dM = tof_to_dM(t, a, mu)
% ToF to change in M for two points, works for both hyp and ellip
% (you can pass in a < 0)
if nargin < 3
    mu = 3.986e14;
end

characteristic_period = sqrt(abs(a)^3 / mu);
dM = t / characteristic_period;
end