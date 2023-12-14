T = 2.5;
isp = 10000;
m_0 = 1000;
r_0 = 6678e3;
r = 42164e3;

[t, dv, dm] = spiral_continuous_t(r, T, r_0, isp, m_0);

% Time
disp(t / 86400)
disp(dv)
disp(dm)