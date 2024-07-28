% Linearização de sistemas 

clear;
clc;

% Define variáveis e parâmetros
syms x1 x2

% Define a equação do pêndulo invertido com carrinho e força externa
eq1 = x2;
eq2 = -x1 + (x1^3)/6 -x2;

% Linearize a equação em torno do ponto de equilíbrio
x1_eq = 0;
x2_eq = 0;

A = jacobian([eq1; eq2], [x1; x2]);
A = subs(A, [x1, x2], [x1_eq, x2_eq])


