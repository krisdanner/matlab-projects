% Define o intervalo das variáveis
x = linspace(-5,5,100);
y = linspace(-5,5,100);
z = linspace(-5,5,100);

% Cria as matrizes de valores
[X,Y,Z] = meshgrid(x,y,z);

% Define a função densidade de probabilidade
mu = [0 0 0]; % média
sigma = [1 0.5 0.2; 0.5 1 0.3; 0.2 0.3 1]; % matriz de covariância
pdf = mvnpdf([X(:) Y(:) Z(:)],mu,sigma); % calcula a função densidade de probabilidade
pdf_3d = reshape(pdf,[length(x),length(y),length(z)]); % reorganiza a função densidade de probabilidade

% Plota a função densidade de probabilidade
figure;
isosurface(X,Y,Z,pdf_3d,0.01); % plota a superfície isosurface com valor isovalor de 0.01
grid;
xlabel('X'); ylabel('Y'); zlabel('Z'); % adiciona os rótulos dos eixos
title('Função densidade de probabilidade tridimensional'); % adiciona o título
colormap jet; % define a paleta de cores
colorbar; % adiciona a barra de cores
axis([-5 5 -5 5 -5 5]); % define os limites dos eixos
