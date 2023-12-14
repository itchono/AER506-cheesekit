function jd = jd_num(UT, d, m, y)
% UT 0 to 24 h

j0 = 367 * y - floor(7*(y + floor((m+9)/12))/4) + floor(275*m/9) + d + 1721013.5;
jd = j0 + UT/24;

end