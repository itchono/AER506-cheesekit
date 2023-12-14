function [R, Rc, Rs] = earth_position(phi, Theta, H)

if nargin < 3
    fprintf("ASSUMING SEA LEVEL.\n")
    H = 0;
end

f = 0.003353;
RE = 6378e3;

Rc = RE / sqrt(1-(2*f-f^2) * sind(phi)^2) + H;
Rs = RE * (1-f)^2 / sqrt(1-(2*f-f^2) * sind(phi)^2) + H;

R = [Rc * cosd(phi) * cosd(Theta); Rc * cosd(phi) * sind(Theta);
    Rs * sind(phi)];

end