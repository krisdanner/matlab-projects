% Projeto de um controlador PID aplicado ao eixo z de um
% foguete pelo método do ganho crítico em malha fechada 

close all
clear
clc

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

eig(A)

M = ctrb(A,B);
rank(M)

N = obsv(A,C);
rank(N)

%polos_desejados = [-1.05, -0.95];
polos_desejados = [-1, -2];
K = place(A,B,polos_desejados)

Ku = 1;
Tu = 4400;

Kc=0.6*Ku; ti=Tu/2; td=Tu/8;






