% Lineariza��o de sistemas 

clear;
clc;

% Define vari�veis e par�metros
syms x1 x2

% Define a equa��o do p�ndulo invertido com carrinho e for�a externa
eq1 = x2;
eq2 = -x1 + (x1^3)/6 -x2;

% Linearize a equa��o em torno do ponto de equil�brio
x1_eq = 0;
x2_eq = 0;

A = jacobian([eq1; eq2], [x1; x2]);
A = subs(A, [x1, x2], [x1_eq, x2_eq])


