% Define o intervalo das variáveis
x = linspace(-5,5,100);

% Define a função densidade de probabilidade
mu = 0; % média
sigma = 1; % desvio-padrão
pdf = normpdf(x,mu,sigma); % calcula a função densidade de probabilidade

% Plota a função densidade de probabilidade
figure;
plot(x,pdf); % plota a função densidade de probabilidade
xlabel('X'); % adiciona o rótulo do eixo x
ylabel('Probabilidade'); % adiciona o rótulo do eixo y
title('Função densidade de probabilidade unidimensional'); % adiciona o título
