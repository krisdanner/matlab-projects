% Parâmetros do pêndulo
g = 9.8; % aceleração da gravidade
l = 1; % comprimento do pêndulo
b = 0.1; % coeficiente de atrito

% Define a equação diferencial
dy = @(t,y) [y(2); -(g/l)*sin(y(1))-b*y(2)];

% Condição inicial
y0 = [0.1; 0];

% Intervalo de tempo
tspan = [0 20];

% Resolve a equação diferencial usando o solver ode45
[t,y] = ode45(dy, tspan, y0);

% Plota o retrato de fase
figure;
plot(y(:,1),y(:,2), 'linewidth',1);
grid;
xlabel('Posição');
ylabel('Velocidade');
title('Retrato de fase do pêndulo com atrito');
