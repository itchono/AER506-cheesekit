function r2 = hohmann_from_v1(r1, v1, mu)
% calculates r2 based on r1 and v1
if nargin < 3
    mu = 3.986e14;
end

ratio = r1*v1^2 / (2*mu - r1*v1^2);
r2 = r1 * ratio;

end