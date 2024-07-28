% Linearização e controle LQR Altitude_Foguete2 #
%-----------------------------------------------#
clear;
clc;

% Define variáveis e parâmetros
syms h v u

m = 68.3; % kg
Cd = 0.43; % coeficiente de arrasto
d = 0.13; % diâmetro do foguete em metros
S = pi*(d^2)/4; % m^2
rho = 1.2;
T = 25748;
g = 9.81; % m/s^2
Dg = 0.5*Cd*rho*S;

delta = 0; % Ângulo de deflexão da tubeira (em graus)
phi = 8; % ângulo de elevação da plataforma de lançamento

% Define as equações
f1 = v;
f2 = (T*u-Dg*v^2*sign(v)-m*g*cosd(phi))/m;

% Linearize a equação em torno do ponto de equilíbrio (0,0,0)

h_eq = 0;
v_eq = 1080; % velocidade em t = 5s
u_eq = 0;

A = jacobian([f1; f2], [h; v]);
A = subs(A, [h, v, u], [h_eq, v_eq, u_eq]);
A = double(A)

B = jacobian([f1; f2], u);
B = subs(B, [h, v, u], [h_eq, v_eq, u_eq]);
B = double(B)

C = [1 0];

D = 0;

sys = ss(A,B,C,D);

% Controlador LQR
Q = diag([100,1]);
R = 0.01;

K = lqr(A, B, Q, R);

% Sistema em malha fechada
    
Amf = A-B*K;
Bmf = B;
Cmf = C-D*K;
Dmf = D;

sysMF = ss(Amf,Bmf,Cmf,Dmf);

% Resposta do sistema em malha fechada 

t = 0:0.01:10;
u = zeros(size(t));
x0 = [0; 18]; % condição inicial
[y,t,x] = lsim(sysMF,u,t,x0); % sistema em malha fechada 
[y2,t2,x2] = lsim(sys,u,t,x0); % sistema em malha aberta

% Plot

figure;
plot(t,y,'linewidth',1);
grid;
hold on;
plot(t,y2,'linewidth',1);
legend('altitudeMF','altitudeMA')
xlabel('Tempo (s)');
ylabel('Altitude (m)');
title('Controle LQR da Altitude ');

% Plot da ação de controle
figure;
plot(t,-K*x','linewidth',1);
grid;
legend('u')
xlabel('Tempo (s)');
ylabel('Esforço de controle u');
title('Ação de controle');