% Defini��o do sistema din�mico n�o-linear

f = @functionRF;

% Defini��o do intervalo de tempo
tspan = [0 50];

% Condi��o inicial
x0 = [0.5; 0];

% Solu��o num�rica do sistema
[t, y] = ode45(f, tspan, x0);

% Plot do campo vetorial
[X,Y] = meshgrid(-2:0.2:2,-2:0.2:2);
u = Y;
v = -sin(X) - 0.1*Y + 0.2*Y.^3;
quiver(X,Y,u,v)

% Plot das solu��es
hold on
plot(y(:,1), y(:,2), 'LineWidth', 2)

% Encontrando os pontos de equil�brio
eq_points = fsolve(f,[0;0]);

% Plot dos pontos de equil�brio
plot(eq_points(1),eq_points(2),'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Encontrando a matriz jacobiana e seus autovalores
A = [0 1; -cos(eq_points(1)) -0.1+0.6*eq_points(2)^2];
[V,D] = eig(A);

% Plot das dire��es dos autovalores nos pontos de equil�brio
quiver(eq_points(1),eq_points(2),V(1,1),V(2,1),'LineWidth',2);
quiver(eq_points(1),eq_points(2),V(1,2),V(2,2),'LineWidth',2);

% Configura��es do plot
title('Retrato de Fase do Sistema');
xlabel('x');
ylabel('y');
legend('Campo Vetorial', 'Solu��o', 'Equil�brio', 'Autovalores');
axis([-2 2 -2 2]);
grid on;
hold off