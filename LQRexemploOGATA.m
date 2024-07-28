% Exemplo de controlador LQR do livro OGATA
close all
clear;
clc;

% Sistema

A = [0 1 0;
    0 0 1;
    0 -2 -3];
B = [0;0;1];
C = [1 0 0];
D = 0;

sys = ss(A,B,C,D)

% Definição das matrizes de controle

Q = [100 0 0;
    0 1 0;
    0 0 1];
R = 0.01;

% Projeta o controlador LQR sem rastreamento

K = lqr(A,B,Q,R);
k1 = K(1);

% Aplica o controlador LQR projetado para rastreamento

At = A-B*K;
Bt = B*k1;
t = 0:0.01:5;
[y,x] = step(At,Bt,C,D,1,t);

% Plot da resposta

plot(t,x)
grid;
legend('x1','x2','x3')



