% Este c�digo plota a superf�cie 3D da fun��o de Lyapunov em um intervalo de valores 
% para x e y definido por x = -2:0.2:2 e y = -2:0.2:2. A fun��o de Lyapunov � calculada 
% para cada par de valores de x e y usando a fun��o meshgrid e armazenada na matriz Z. 
% Em seguida, a superf�cie 3D da fun��o de Lyapunov � plotada usando a fun��o surf. 
% As etiquetas dos eixos e o t�tulo do gr�fico tamb�m s�o adicionados ao final.

% Defina o intervalo de valores para x e y
x = -2:0.05:2;
y = -2:0.05:2;

% Calcule o valor da fun��o de Lyapunov para cada par de valores de x e y
[X, Y] = meshgrid(x, y);
Z = X.^2 + Y.^2;

% Plote a superf�cie 3D da fun��o de Lyapunov
figure;
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
title('Fun��o de Lyapunov');
