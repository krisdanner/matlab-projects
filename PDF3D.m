% Define o intervalo das vari�veis
x = linspace(-5,5,100);
y = linspace(-5,5,100);
z = linspace(-5,5,100);

% Cria as matrizes de valores
[X,Y,Z] = meshgrid(x,y,z);

% Define a fun��o densidade de probabilidade
mu = [0 0 0]; % m�dia
sigma = [1 0.5 0.2; 0.5 1 0.3; 0.2 0.3 1]; % matriz de covari�ncia
pdf = mvnpdf([X(:) Y(:) Z(:)],mu,sigma); % calcula a fun��o densidade de probabilidade
pdf_3d = reshape(pdf,[length(x),length(y),length(z)]); % reorganiza a fun��o densidade de probabilidade

% Plota a fun��o densidade de probabilidade
figure;
isosurface(X,Y,Z,pdf_3d,0.01); % plota a superf�cie isosurface com valor isovalor de 0.01
grid;
xlabel('X'); ylabel('Y'); zlabel('Z'); % adiciona os r�tulos dos eixos
title('Fun��o densidade de probabilidade tridimensional'); % adiciona o t�tulo
colormap jet; % define a paleta de cores
colorbar; % adiciona a barra de cores
axis([-5 5 -5 5 -5 5]); % define os limites dos eixos
