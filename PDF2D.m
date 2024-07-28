% Define o intervalo das variáveis
x = linspace(-5,5,100);
y = x;

% Cria as matrizes de valores
[X,Y] = meshgrid(x,y);

% Define a função densidade de probabilidade
mu = [0 0]; % média
sigma = [1 0.5; 0.5 1]; % matriz de covariância
pdf = mvnpdf([X(:) Y(:)],mu,sigma); % calcula a função densidade de probabilidade
pdf_2d = reshape(pdf,[length(x),length(y)]); % reorganiza a função densidade de probabilidade

% Plota a função densidade de probabilidade
figure;
surf(X,Y,pdf_2d); % plota a superfície
xlabel('X'); ylabel('Y'); zlabel('PDF'); % adiciona os rótulos dos eixos
title('Função densidade de probabilidade bidimensional'); % adiciona o título
colormap jet; % define a paleta de cores
colorbar; % adiciona a barra de cores
