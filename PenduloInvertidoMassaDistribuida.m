% Pêndulo invertido com controle LQR #
%------------------------------------#
clear;
clc;

% Define variáveis e parâmetros
syms x1 x2 x3 x4 u

M = 0.5;
m = 0.2;
b = 0.1;
l = 0.3;
I = 0.006;
g = 9.81;

% Desacopla as variáveis para obter as equações em função de dx e dtheta
U = [M+m m*l*cos(x3);
    m*l*cos(x3) I+m*l^2];

V = [u-b*x2+m*l*x4^2*sin(x3);
    -m*g*l*sin(x3)];

W = inv(U)*V;

% Define a equação do pêndulo invertido com carrinho e força externa
f1 = x2;
f2 = W(1);
f3 = x4;
f4 = W(2);

% Linearize a equação em torno do ponto de equilíbrio para baixo (x3_eq=0)
% ou para cima (x3_eq=pi)
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

C = [1 0 0 0;
    0 0 1 0];

D = 0;

sys = ss(A,B,C,D);

% Simulação do modelo não linear

% % Define a entrada do sistema (força externa)
% u = 0;
% 
% % Define as equações diferenciais do sistema não linear
% 
% f = @(t, y) [y(2); -(20*((3*sin(y(3))*y(4)^2)/50 + u - y(2)/10) / 3*cos(y(3))^2 - 14) - (2943*cos(y(3))*sin(y(3))) / (100*(3*cos(y(3))^2 - 14));
%     y(4); (6867*sin(y(3)))/(20*(3*cos(y(3))^2 - 14))+(50*cos(y(3))*((3*sin(y(3))*y(4)^2)/50 + u - y(2)/10))/(3*cos(y(3))^2 - 14)];

% Define as condições iniciais e o tempo de simulação
f = @invpend;
x0 = [0; 0; 1.6; 0];
tspan = [0 20];

% Resolve as equações diferenciais usando a função ode45
[t, y] = ode45(f, tspan, x0, []);

% Plota os resultados da simulação
subplot(2,1,1);

plot(t, y(:,3));
grid;
xlabel('Tempo');
ylabel('Posição do pêndulo');
title('Simulação do pêndulo invertido com carrinho e força externa');
subplot(2,1,2);
plot(t, y(:,1));
grid;
xlabel('Tempo');
ylabel('Posição do carrinho');



