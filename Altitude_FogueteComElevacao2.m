% Modelo n�o linear para altitude do foguete com eleva��o

close all
clear;
clc;

% Definindo as constantes do problema
m = 68.3; % kg
L = 3.05; % comprimento total do foguete (m)
C = 0.36; % coeficiente de arrasto
d = 0.13; % di�metro do foguete em metros
S = pi*d^2/4; % m^2
rho = 1.2;
g = 9.81;
xcp = 2.14; % m
xcg = 1.48; % m
Iy = (1/12)*m*L^2; % kg*m^2 � o momento de in�rcia do foguete em torno do eixo de rota��o
M = Iy / (m*d/2); % momento aerodin�mico em torno do eixo longitudinal
Vw = 0; % m/s

% Definindo os par�metros do motor
Tmax = 25748; % N
tb = 5; % s
Thrust = @(t) Tmax*(t<=tb)/cosd(5); % fun��o que define o empuxo

% Definindo as equa��es diferenciais
f = @(t, y) [y(2); (Thrust(t) - 0.5*C*rho*S*y(2)^2*sign(y(2)) - m*9.81*sin(y(3)))/m - g*cos(y(3)); (xcp - xcg)*0.5*C*rho*S*y(2)^2*sign(y(2))/(m*y(2)) - M/(m*y(2))];

% Definindo as condi��es iniciais
h0 = 0; % m
v0 = 36; % m/s
pitch0 = 0.1396; % rad
y0 = [h0 v0 pitch0];

% Resolvendo as equa��es diferenciais
tspan = [0 165]; % tempo total de simula��o
[t, y] = ode45(f, tspan, y0);

% Extraindo as vari�veis do vetor y
h = y(:, 1); % altitude (m)
v = y(:, 2); % velocidade (m/s)
pitch = y(:, 3); % �ngulo de pitch (rad)

% Plotando os resultados
figure;
subplot(3,1,1);
plot(t, h);
grid;
xlabel('Tempo (s)');
ylabel('Altitude (m)');
title('Altitude do foguete');

subplot(3,1,2);
plot(t, v);
grid;
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Velocidade do foguete');

subplot(3,1,3);
plot(t, pitch);
grid;
xlabel('Tempo (s)');
ylabel('�ngulo de pitch (rad)');
title('�ngulo de pitch do foguete');
