% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulação de um observador de estado
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Sistema
%                  xdot(t) = Ax(t) + Bu(t)
%                  y(t) = Cx(t) + Du(t) 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Observador
%                  xdot_hat(t) = ACx(t) + (A-LC)x_hat(t) + Bu(t)
%                  y(t) = Cx(t)
%              
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script

% clear all - Antes de inciar a simulação, é recomendado usar "clear all"
% clc - Antes de inciar a simulação, 
%       limpe a janela de comando usandado usar "clc"
%
%
% Programa para Observadores de Estado  

clear all; close all; clc

A=[1 0;0 -2];B=[1 1]';C=[1 1];d=0;  % Sistema Original 
L=1/3*[16 -1]';                     % Matriz de Ganhos do Observador 
I=eye(2);                           % Matriz identidade 2x2 

Aa=[A 0*I;L*C (A-L*C)]; 
Ba=[B;B];                           % Matrizes aumentadas do Observador 
Ca=[C zeros(size(C))];  

t=0:0.01:5;                         % Tempo da simulaçao 
u=0*t;                              % Sinal de entrada (nulo) 
% x0=[1 1 0 0]';                      % Condiçoes iniciais 
x0=[1 1 0 0]';

[Y,X] = lsim(Aa,Ba,Ca,d,u,t,x0);    % Simula o sistema aumentado  
                                    % para entrada e cond. iniciais dadas 

E = [X(:,1)-X(:,3) X(:,2)-X(:,4)];  % Erro de estimativa                                     

figure;plot(t,X(:,1),'b','linewidth',2);hold on; plot(t,X(:,3),'r','linewidth',2) 
set(1,'Position',[10 258 380 280]);title('Estado X_1 e sua estimativa') 
legend('X_1','X_1 Estimado'); hold off 
% create smaller axes in top right, and plot on it
% axes('Position',[0.55 0.45 0.3 0.3])
axes('Position',[0.25 0.50 0.3 0.3])
box on; hold on;
ttX = 0:0.01:1.5;
s_ttX = size(ttX);
X1 = X(:,1);
X1trun = X1(1:s_ttX(2));
X1est = X(:,3);
X1est_trun = X1est(1:s_ttX(2));
plot(ttX,X1trun,'b','linewidth',2)
plot(ttX,X1est_trun,'r','linewidth',2)
grid on


figure;plot(t,X(:,2),'b','linewidth',2);hold on; plot(t,X(:,4),'r','linewidth',2) 
set(2,'Position',[232 258 380 280]);title('Estado X_2 e sua estimativa') 
legend('X_2','X_2 Estimado'); hold off  
% create smaller axes in top right, and plot on it
% axes('Position',[0.55 0.45 0.3 0.3])
axes('Position',[0.25 0.50 0.3 0.3])
box on; hold on;
ttX = 0:0.01:0.5;
s_ttX = size(ttX);
X2 = X(:,2);
X2trun = X2(1:s_ttX(2));
X2est = X(:,4);
X2est_trun = X2est(1:s_ttX(2));
plot(ttX,X2trun,'b','linewidth',2)
plot(ttX,X2est_trun,'r','linewidth',2)
grid on


figure;plot(t,E(:,1),'b','linewidth',2);hold on; plot(t,E(:,2),'r','linewidth',2) 
set(3,'Position',[482 258 380 280]);title('Erro de estimativa') 
legend('Erro de estimativa de X_1','Erro de estimativa de X_2');hold off 