function G_R_H = rot_G_H(phi, Theta)
% Rotation matrix from H frame to G frame (aligned with TEN frame)
G_R_H = Rz_deg(Theta + 90) * Rx_deg(90 - phi);

end