% Lineariza��o de sistemas 

clear;
clc;

% Define vari�veis e par�metros
syms x1 x2 x3 x4 u

M = 0.5;
m = 0.2;
b = 0.1;
l = 0.3;
I = 0.006;
g = 9.81;

% Desacopla as vari�veis para obter as euqa��es em fun��o de dx e dtheta

U = [M+m m*l*cos(x3);
    m*l*cos(x3) I+m*l^2];

V = [u-b*x2+m*l*x4^2*sin(x3);
    -m*g*l*sin(x3)];

W = inv(U)*V;

% Define a equa��o do p�ndulo invertido com carrinho e for�a externa
f1 = x2;
f2 = W(1);
f3 = x4;
f4 = W(2);

% Linearize a equa��o em torno do ponto de equil�brio
x1_eq = 0;
x2_eq = 0;
x3_eq = 0;
x4_eq = 0;
u_eq = 0;

A = jacobian([f1; f2; f3; f4], [x1; x2; x3; x4]);
A = subs(A, [x1, x2, x3, x4, u], [x1_eq, x2_eq, x3_eq, x4_eq, u_eq]);
A = double(A)

B = jacobian([f1; f2; f3; f4], u);
B = subs(B, [x1, x2, x3, x4, u], [x1_eq, x2_eq, x3_eq, x4_eq, u_eq]);
B = double(B)

% Simulação do pêndulo não linear

% Define a entrada do sistema (força externa)
u = 0.1;

% Define as equações diferenciais do sistema não linear
f = @(t, y) [
  y(2);
  (m*l*sin(y(1))*y(2)^2 + u + m*g*sin(y(1))*cos(y(1)) - b*y(2)*cos(y(1))) / (M + m - m*cos(y(1))^2);
  y(4);
  (-m*l*cos(y(1))*sin(y(1))*y(2)^2 + u*cos(y(1)) + (M + m)*g*sin(y(1))) / (l*(M + m - m*cos(y(1))^2))
];

% Define as condições iniciais e o tempo de simulação
y0 = [0.1; 0; 0; 0];
tspan = [0 50];

% Resolve as equações diferenciais usando a função ode45
[t, y] = ode45(@(t,y) f(t,y), tspan, y0);

% Plota os resultados da simulação
subplot(2,1,1);
plot(t, y(:,1));
xlabel('Tempo');
ylabel('Posição do pêndulo');
title('Simulação do pêndulo invertido com carrinho e força externa');
subplot(2,1,2);
plot(t, y(:,3));
xlabel('Tempo');
ylabel('Posição do carrinho');


