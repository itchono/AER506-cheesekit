function [t, dv, dm] = spiral_continuous_t(r, T, r_0, isp, m_0, g_0, mu)
% how long it takes to do a continuous transfer

if nargin < 6
    g_0 = 9.80665;
    mu = 3.986e14;
end

v_ex = isp * g_0;
t = m_0 * v_ex / T * (1-exp(sqrt(mu) / v_ex * (sqrt(1/r) - sqrt(1/r_0))));

m_f = m_0 - T / v_ex * t;
dv = v_ex * log(m_0/m_f);
dm = - T / v_ex * t;
end