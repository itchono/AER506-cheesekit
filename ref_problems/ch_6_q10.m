Omega = 60;
inc = 90;
omega = 0;

G_R_Q = Rz_deg(Omega) * Rx_deg(inc) * Rz_deg(omega);
Q_v = [-3.208; -0.8288; 0];
G_v = G_R_Q * Q_v