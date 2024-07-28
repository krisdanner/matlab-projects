% Retrato de fase do p�ndulo invertido n�o linear com massa na ponta #
%--------------------------------------------------------------------#

close all
clear;
clc;

% Define as CI's e o tempo de simula��o do p�ndulo n�o linear
u = 0;
f = @invpend2;
x0 = [0; 0; pi/2; 0];
tspan = [0 30];

% Resolve as equa��es diferenciais usando a fun��o ode45
[t, y] = ode45(f, tspan, x0, []);

% Plota o retrato de fase

subplot(2,1,1);
plot(y(:,1),y(:,2), 'linewidth',1);
grid;
xlabel('Posi��o (m)');
ylabel('Velocidade (m/s)');
title('Retrato de fase do p�ndulo invertido com carrinho');

subplot(2,1,2);
plot(y(:,3)-pi,y(:,4), 'linewidth',1);
grid;
xlabel('�ngulo (rad)');
ylabel('Velocidade Angular (rad/s)');

