function H_rho = rho_from_Aa(A, a, rho)
% position in TEN frame, angles in DEGREES, rho in whatever length units
if nargin < 3
    rho = 1;
    fprintf("ASSUMING UNIT VECTOR");
end

H_rho = rho * [cosd(a) * sind(A); cosd(a) * cosd(A); sind(a)];
end