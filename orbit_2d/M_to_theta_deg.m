function [theta, E] = M_to_theta_deg(M, e)
% M in rads to theta in degrees
% Potentially unreliable for hyperbolic

if e < 1
E = fzero(@(E) E - e*sin(E) - M, M);
theta = 2 * atand(sqrt((1+e)/(1-e)) * tan(E/2));
else

E = fzero(@(E) e*sinh(E) - E - M, M);
theta = 2 * atand(sqrt((e+1)/(e-1)) * tanh(E/2));
end

end