% Defina o intervalo de valores para x e y
x = -2:0.05:2;
y = -2:0.05:2;

% Calcule o valor da função de Lyapunov para cada par de valores de x e y
[X, Y] = meshgrid(x, y);
Z = X.^2 + Y.^2;

% Plote a superfície 3D da função de Lyapunov
figure;
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
title('Função de Lyapunov');
