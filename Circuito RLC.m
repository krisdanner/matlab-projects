clear all;
home;
R = 100;
L = 100e-3;
C = 1e-6;
tal_1 = L/R; tal_2 = R*C;
a = tal_1 * tal_2; b = tal_2;
num = 1;
den = [a b 1];
ft_RLC = tf(num,den);
controlSystemDesigner(ft_RLC);


