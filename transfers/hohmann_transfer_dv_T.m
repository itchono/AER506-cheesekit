function [dv, T] = hohmann_transfer_dv_T(rc1, rc2, mu)
% Circle-to-circle hohmann transfer
% arbitrary order OK

if nargin < 3
    mu = 3.986e14;
end

vc1 = sqrt(mu/rc1);
vc2 = sqrt(mu/rc2);

vpt = sqrt(mu) * sqrt(2/rc1 - 2/(rc1 + rc2));
vat = sqrt(mu) * sqrt(2/rc2 - 2/(rc1 + rc2));

T = 1/2 * 2*pi*sqrt((rc1/2+rc2/2)^3/mu);

dv = abs(vpt-vc1) + abs(vat-vc2);

end