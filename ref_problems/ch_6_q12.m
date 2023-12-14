rp = 300e3 + 6378e3;
ra = 600e3 + 6378e3;

[a, e] = orbit_from_rarp(ra, rp);

j2f = j2_fac(a, e);
inc = acosd(1.991e-7/j2f)  % sun-synchronous inclination