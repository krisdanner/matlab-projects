% Defini��o da fun��o gaussiana
mu = [0, 0];             % M�dia (centro da gaussiana)
sigma = [1, 1];          % Desvio padr�o
[x, y] = meshgrid(-3:0.1:3, -3:0.1:3);
z = exp(-((x-mu(1)).^2/(2*sigma(1)^2) + (y-mu(2)).^2/(2*sigma(2)^2)));

% Plot da fun��o gaussiana em 3D usando mesh
figure;
subplot(1, 2, 1);
mesh(x, y, z);
% title('Fun��o Gaussiana');
xlabel('Eixo X');
ylabel('Eixo Y');
zlabel('Valor da Fun��o');

% Plot da vista superior (2D) da fun��o gaussiana
subplot(1, 2, 2);
contourf(x, y, z, 20, 'LineColor', 'none');
grid;
% title('Vista Superior da Fun��o Gaussiana');
xlabel('Eixo X');
ylabel('Eixo Y');
colorbar;
