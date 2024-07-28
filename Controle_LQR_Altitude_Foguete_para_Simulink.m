% Controlador LQR com servomecanismo 

close all
clear;
clc;

traj = xlsread('trajnominal1.xlsx');

% Refer�ncia da trajet�ria nominal a ser seguida
r = traj(1:101, 4);

% Defini��o do sinal de refer�ncia

t = 0:0.05:5;
ref = [t', r];

% Planta do sistema linearizado
A = [0 1;
    0 -0.09928];
B = [0;
    373.3];
C = [1 0];
D = 0;

sys = ss(A,B,C,D)
ft = tf(sys)

% Planta aumentada

Aaum = [A zeros(2,1);-C 0];
Baum = [B;0];
Caum = [C 0];
Daum = D;

plantaAM = ss(Aaum,Baum,Caum,Daum)

M = ctrb(Aaum,Baum);
rank(M)

eig(plantaAM)

% Defini��o das matrizes de controle

Q = [1 0 0;
    0 0.001 0;
    0 0 1000];
R = 0.001;

% Projeta o controlador LQR

Kaum = lqr(Aaum,Baum,Q,R)
K = Kaum(1:2);
Ki = -Kaum(3);

% Sistema em malha fechada
Amf = Aaum-Baum*Kaum;
Bmf = [0;0;1];
Cmf = Caum;
Dmf = Daum;

sysMF = ss(Amf,Bmf,Cmf,Dmf);

% Lugar das ra�zes
figure;
rlocus(sysMF);
title('Lugar das Ra�zes');
grid;

% Margem de ganho e fase
figure;
margin(sysMF);
legend();
grid;

figure;
margin(sys);
legend();
grid;
% Resposta ao degrau em malha fechada
[Y,T] = step(sysMF);
figure;
plot(T,Y)
grid;
xlabel('Tempo (s)');
ylabel('Sa�da y');
title('Resposta ao degrau');

% Diagrama de Nyquist em MF
figure;
nyquist(sysMF);
grid;

% % Teste de estabilidade com aumento de ganho
% figure;
% gain = 15; % 15 dB de ganho extra
% step(feedback(sysMF*10^(gain/20),1))
% 
% % Teste de estabilidade com aumento de fase
% figure;
% delay = 2; % 2 segundos de atraso adicional
% s = 1i;
% step(feedback(sysMF*exp(-s*delay),1))

% Controle PID
% pidTuner(sys)
% figure;
% step(feedback(sys*Kpid,1))