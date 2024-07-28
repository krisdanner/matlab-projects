%==================================================
% SCRIPT USADO PARA COMPARAÇÃO ENTRE O  OBSERVADOR 
% DE LUENBERGER E O FILTRO DE KALMAN NO SIMULINK
%==================================================
close all
clear
clc

% Sistema
ts = 0.1;

A = [1 ts;0 1];
B = [ts^2/2;ts];
C = [1 0];
D = 0;

sys = ss(A,B,C,D);
display(sys);

% Entrada 
u = 0.1;

% Verificação da Observabilidade
eig(A)
N = obsv(A,C);
rank(N)

% Alocação de Polos para matriz L
polosL = [-10 -11];
L = place(A',C',polosL);

% Ruídos do sistema 
sigma_w = 0.01; % desvio padrão de S (m)
sigma_s = 0.02; % desvio padrão de V (m/s)

% Ruídos do sensor
sigma_v = 5; % desvio padrão do sensor do estado S (m)

% matriz de covariâncias do sistema 
Q = [sigma_w^2 0;0 sigma_s^2];

% matriz de covariâncias do sensor 
R = sigma_v^2;



