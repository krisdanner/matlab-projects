% Define o intervalo das vari�veis
x = linspace(-5,5,100);
y = x;

% Cria as matrizes de valores
[X,Y] = meshgrid(x,y);

% Define a fun��o densidade de probabilidade
mu = [0 0]; % m�dia
sigma = [1 0.5; 0.5 1]; % matriz de covari�ncia
pdf = mvnpdf([X(:) Y(:)],mu,sigma); % calcula a fun��o densidade de probabilidade
pdf_2d = reshape(pdf,[length(x),length(y)]); % reorganiza a fun��o densidade de probabilidade

% Plota a fun��o densidade de probabilidade
figure;
surf(X,Y,pdf_2d); % plota a superf�cie
xlabel('X'); ylabel('Y'); zlabel('PDF'); % adiciona os r�tulos dos eixos
title('Fun��o densidade de probabilidade bidimensional'); % adiciona o t�tulo
colormap jet; % define a paleta de cores
colorbar; % adiciona a barra de cores
