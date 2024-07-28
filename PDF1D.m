% Define o intervalo das vari�veis
x = linspace(-5,5,100);

% Define a fun��o densidade de probabilidade
mu = 0; % m�dia
sigma = 1; % desvio-padr�o
pdf = normpdf(x,mu,sigma); % calcula a fun��o densidade de probabilidade

% Plota a fun��o densidade de probabilidade
figure;
plot(x,pdf); % plota a fun��o densidade de probabilidade
xlabel('X'); % adiciona o r�tulo do eixo x
ylabel('Probabilidade'); % adiciona o r�tulo do eixo y
title('Fun��o densidade de probabilidade unidimensional'); % adiciona o t�tulo
