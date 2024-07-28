% Este código plota a superfície 3D da função de Lyapunov em um intervalo de valores 
% para x e y definido por x = -2:0.2:2 e y = -2:0.2:2. A função de Lyapunov é calculada 
% para cada par de valores de x e y usando a função meshgrid e armazenada na matriz Z. 
% Em seguida, a superfície 3D da função de Lyapunov é plotada usando a função surf. 
% As etiquetas dos eixos e o título do gráfico também são adicionados ao final.

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
