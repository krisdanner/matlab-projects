K = 2;
L = 3.2;
T = 5;

Kp1 = T/(K*L);
Kp2 = 0.9*Kp1;
Kp3 = 1.2*Kp1;

Ki2 = Kp2/(L/0.3);
Ki3 = Kp3/(2*L);

Kd3 = Kp3*0.5*L;