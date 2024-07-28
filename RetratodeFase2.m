% Definição do sistema dinâmico não-linear

f = @functionRF;

% Definição do intervalo de tempo
tspan = [0 50];

% Condição inicial
x0 = [0.5; 0];

% Solução numérica do sistema
[t, y] = ode45(f, tspan, x0);

% Plot do campo vetorial
[X,Y] = meshgrid(-2:0.2:2,-2:0.2:2);
u = Y;
v = -sin(X) - 0.1*Y + 0.2*Y.^3;
quiver(X,Y,u,v)

% Plot das soluções
hold on
plot(y(:,1), y(:,2), 'LineWidth', 2)

% Encontrando os pontos de equilíbrio
eq_points = fsolve(f,[0;0]);

% Plot dos pontos de equilíbrio
plot(eq_points(1),eq_points(2),'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Encontrando a matriz jacobiana e seus autovalores
A = [0 1; -cos(eq_points(1)) -0.1+0.6*eq_points(2)^2];
[V,D] = eig(A);

% Plot das direções dos autovalores nos pontos de equilíbrio
quiver(eq_points(1),eq_points(2),V(1,1),V(2,1),'LineWidth',2);
quiver(eq_points(1),eq_points(2),V(1,2),V(2,2),'LineWidth',2);

% Configurações do plot
title('Retrato de Fase do Sistema');
xlabel('x');
ylabel('y');
legend('Campo Vetorial', 'Solução', 'Equilíbrio', 'Autovalores');
axis([-2 2 -2 2]);
grid on;
hold off