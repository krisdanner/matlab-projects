function dx = invpend(t, x)

% M = 2;
% m = 0.2;
% b = 0.1;
% l = 0.5;
% I = 0.006;
% g = 9.81;
u = 0;

dx =  zeros(4,1);

dx(1) = x(2);
dx(2) = -(20*((3*sin(x(3))*x(4)^2)/50 + u - x(2)/10) / 3*cos(x(3))^2 - 14) - (2943*cos(x(3))*sin(x(3))) / (100*(3*cos(x(3))^2 - 14));
dx(3) = x(4);
dx(4) = (6867*sin(x(3)))/(20*(3*cos(x(3))^2 - 14))+(50*cos(x(3))*((3*sin(x(3))*x(4)^2)/50 + u - x(2)/10))/(3*cos(x(3))^2 - 14);

