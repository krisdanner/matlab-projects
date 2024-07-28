% Lineariza��o e controle LQR Altitude_Foguete3 #
%-----------------------------------------------#
close all
clear;
clc;

% Define vari�veis e par�metros
syms h v u

m1 = 68.3; % massa inicial kg
m2 = 38.1; % massa final kg
Cd = 0.43; % coeficiente de arrasto
d = 0.13; % di�metro do foguete em metros
S = pi*(d^2)/4; % �rea da se��o frontal m^2
rho1 = 1.1; % densidade do ar (superf�cie)
rho2 = 0.6; % densidade do ar (3700 metros acima)
T = 25748; % empuxo m�ximo
g = 9.81; % m/s^2
c1 = 0.5*Cd*rho1*S; % constante aerodin�mica (superf�cie)
c2 = 0.5*Cd*rho2*S; % constante aerodin�mica (3700 metros acima)

theta = 8; % �ngulo de eleva��o (pitch angle)
phi = 0; % �ngulo de rota��o (roll angle)

% Define as equa��es
f1 = v;
f2 = (T*cosd(theta)*u-m1*g-c1*v^2*sign(v)*cosd(phi)-c1*sind(theta)*v^2*sign(v)*cosd(phi))/m1;

% Linearize a equa��o em torno do ponto de equil�brio (2595,1136,1)

h_eq = 2595; % altura em t = 4s 2595
v_eq = 1136; % velocidade em t = 4s 1136
u_eq = 1;

A = jacobian([f1; f2], [h; v]);
A = subs(A, [h, v, u], [h_eq, v_eq, u_eq]);
A = double(A)

B = jacobian([f1; f2], u);
B = subs(B, [h, v, u], [h_eq, v_eq, u_eq]);
B = double(B)

C = [1 0;
    0 1];

D = 0;

display(eig(A));

sys = ss(A,B,C,D);

% Controlador LQR
Q = diag([100,1]);
R = 0.01;

K = lqr(A, B, Q, R);

% Varia��o de pesos do controlador LQR
%-------------------------------------------

% Definindo os poss�veis valores para Q e R
q_values = logspace(-2, 2, 5);
r_values = logspace(-2, 2, 5);

% Inicializando as matrizes de ganho
Ks = cell(length(q_values), length(r_values));

% Janela para plot
figure();
subplot(2,1,1);
title('Variando pesos do LQR');
xlabel('Tempo');
ylabel('Sa�da 1');
% legend();
grid;
hold on;

subplot(2,1,2);
xlabel('Tempo');
ylabel('Sa�da 2');
% legend();
grid;
hold on;

% Loop para varia��o dos valores de Q e R
for i = 1:length(q_values)
    for j = 1:length(r_values)
        % Calculando o ganho do controlador LQR
        Q = q_values(i)*eye(2);
        R = r_values(j)*eye(1);
        [K,~,~] = lqr(A,B,Q,R);
        Ks{i,j} = K;
        
        % Simulando o sistema com o controlador LQR
        sys_cl = ss(A-B*K, B, C, D);
        t = 0:0.01:10;
        u = zeros(size(t));
        x0 = [1; 0];
        [y,t,x] = lsim(sys_cl, u, t, x0);
        
        % Plotando as sa�das
%         figure(i*j);
        subplot(2,1,1);
        plot(t, y(:,1));
%         legend(['Q = ', num2str(q_values(i)), ', R = ', num2str(r_values(j))])
        
%         xlabel('Tempo');
%         ylabel('Sa�da 1');
%         title(['LQR com Q = ', num2str(q_values(i)), ', R = ', num2str(r_values(j))]);
        

        subplot(2,1,2);
        plot(t, y(:,2));
%         legend(['Q = ', num2str(q_values(i)), ', R = ', num2str(r_values(j))])
%         xlabel('Tempo');
%         ylabel('Sa�da 2');
%         legend();
%         grid;
%         hold on;
    end
end

% Sistema em malha fechada
    
Amf = A-B*K;
Bmf = B;
Cmf = C-D*K;
Dmf = D;

sysMF = ss(Amf,Bmf,Cmf,Dmf);

% Resposta ao degrau em malha fechada
figure; 
step(sysMF);
grid;

% Resposta do sistema em malha fechada 

tspan = 0:0.01:5;
u = zeros(size(tspan));
u2 = ones(size(tspan));
x0 = [0; 36]; % condi��o inicial
[y,t,x] = lsim(sysMF,u2,tspan,x0); % sistema em malha fechada c/ entrada u = 1
[y2,t2,x2] = lsim(sys,u2,tspan,x0); % sistema em malha aberta c/ entrada u = 1

% Obtendo as condi��es iniciais da fase bal�stica
h_final = y2(end, 1);
v_final = y2(end, 2);
y0_bal = [h_final v_final];

% Definindo a equa��o diferencial da fase bal�stica
f_bal = @(t, y) [y(2); (-c2*y(2)^2*sign(y(2))-c1*sind(theta)*y(2)^2*sign(y(2))*cosd(phi))/m2 - g];

% Resolvendo a equa��o diferencial da fase bal�stica
tspan_bal = [5 165];
[t_bal, y_bal] = ode45(f_bal, tspan_bal, y0_bal);

% Concatenando as trajet�rias
t_concat = [t2; t_bal];
y_concat = [y2; y_bal];

% Plotando a trajet�ria concatenada
figure;
plot(t_concat, y_concat(:,1), 'LineWidth', 1);
grid;
xlabel('Tempo (s)');
ylabel('Altitude (m)');
title('Trajet�ria concatenada do foguete');

% Plot
figure;
plot(t,y(:,1),'linewidth',1);
grid;
hold on;
plot(t2,y2(:,1),'linewidth',1);
legend('altitudeMF','altitudeMA')
xlabel('Tempo (s)');
ylabel('Altitude (m)');
title('Controle LQR da Altitude ');

% Plot da a��o de controle
figure;
plot(t,-K*x','linewidth',1);
grid;
legend('u')
xlabel('Tempo (s)');
ylabel('Esfor�o de controle u');
title('A��o de controle');