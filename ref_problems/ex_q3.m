mu = 3.986e14;
i = 180 - asind(sqrt(2/2.5));
T = 11201.33;
w_tgt = 1.991e-7;

a = ((T/(2*pi))^2 * mu)^(1/3);
e = fzero(@(e) oblateness_effect(a, e, i) - w_tgt, [0, 0.99]);
r_tgt = 6378e3 + 5000e3;

theta_star = acosd((a*(1-e^2) / r_tgt - 1)/e);

[M, E] = theta_deg_to_M(theta_star, e);

T_pe_h = M_to_tof(0, M, a, mu)
T_high = T - 2*T_pe_h

frac = T_high/T

ra = a * (1+e)
rp = a * (1-e)
