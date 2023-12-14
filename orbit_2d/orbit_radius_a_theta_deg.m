function r = orbit_radius_a_theta_deg(a, e, theta)
% Orbital radius from h, theta in DEGREES
% works for hyp orbits, make sure that a < 0 if e > 1

if ~((a > 0 && e < 1) || (a < 0 && e > 1))
    fprintf("Possible invalid configuration:\n")

    if (a < 0 && e < 1)
        fprintf("Encountered: Elliptical orbit with negative SMA; flipping SMA.\n")
    else
        fprintf("Hyperbolic orbit with positive SMA; flipping SMA.\n")
    end
    a = -a;
end

r = a .* (1-e^2) ./(1 + e.* cosd(theta));
end
