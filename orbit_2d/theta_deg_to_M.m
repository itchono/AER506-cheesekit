function [M, E] = theta_deg_to_M(theta, e)
% Theta in degrees to mean anomaly and eccentric anomaly in rads
% Works for both elliptical and hyp trajectories (tested against 5.3, 5.11)

if e < 1
E = 2 * atan(sqrt((1-e)/(1+e)) * tand(theta/2));
M = E - e * sin(E);
else
E = 2 * atanh(sqrt((e-1)/(e+1)) * tand(theta/2));
M = e * sinh(E) - E;
end

end