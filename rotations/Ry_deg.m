function R = Ry_deg(theta)
R = [cosd(theta) 0 sind(theta);
    0 1 0;
    -sind(theta) 0 cosd(theta)];
end