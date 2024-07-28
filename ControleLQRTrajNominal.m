% Projeto de um controlador LQR aplicado ao eixo z de um
% foguete com sistema linear identificado em espaço de estados

clear;
clc;

% Leitura do arquivo com dados de trajetória nominal

traj = xlsread('trajnominal1.xlsx');

Xtrain = traj(:, 10); % entrada u
ytrain = traj(:, 4); % saída y

t = 0.05:0.05:165;
u = ytrain;
input = [t', u];

% Matrizes do sistema

A = [0 1;
    3.478e-09 9.103e-06];
B = [0.0388;
    0.9995];
C = [1 0];
D = 0;

% Definição das matrizes de controle

Q = [10 0;
    0 1];
R = 0.01;

% Projeta o controlador LQR

K = lqr(A,B,Q,R)

