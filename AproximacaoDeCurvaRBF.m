% Este script gera dados de treinamento a partir da função alvo, 
% calcula as ativações das funções de base radial, estima os pesos 
% da aproximação e, em seguida, gera uma curva aproximada usando as 
% funções de base radial. Cada função de base radial é representada 
% por uma cor diferente no gráfico.

close all
clear
clc

% Definindo a função alvo
f = @(x) sin(x);

% Gerando dados de treinamento
x_train = linspace(0, 7, 100);
y_train = f(x_train);

% Definindo os centros das funções de base radial
centers = linspace(0, 7, 20);

% Definindo o spread das funções de base radial (desvio padrão sigma)
spread = 0.5;

% Calculando as ativações das funções de base radial
phi = zeros(length(x_train), length(centers));
for i = 1:length(centers)
    phi(:, i) = exp(-((x_train - centers(i)).^2) / (2 * spread^2));
end

% Calculando os pesos da aproximação
weights = phi \ y_train';

% Gerando os pontos da curva aproximada
x_approx = linspace(0, 7, 1000);
phi_approx = zeros(length(x_approx), length(centers));
for i = 1:length(centers)
    phi_approx(:, i) = exp(-((x_approx - centers(i)).^2) / (2 * spread^2));
end
y_approx = phi_approx * weights;

% Plotando as curvas das funções de base radial, os pesos no pico e as curvas de aproximação
figure;
hold on;
for i = 1:length(centers)
    plot(x_train, weights(i) * phi(:, i), 'LineWidth', 1, 'LineStyle', '--');
    [~, peak_index] = max(weights(i) * phi(:, i));
    peak_value = weights(i) * phi(peak_index, i);
    plot(x_train(peak_index), peak_value, 'ro');
    plot([centers(i), centers(i)], [0, peak_value], 'k--');
    text(x_train(peak_index), peak_value, ['w = ' num2str(weights(i))], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
end
h1 = plot(x_approx, f(x_approx), 'g-', 'LineWidth', 3);
h2 = plot(x_approx, y_approx, 'r--', 'LineWidth', 3);
%title('Aproximação de Curva com Funções de Base Radial');
xlabel('x');
ylabel('f(x)');
legend([h1, h2], 'f(x)', 'Aproximação de f(x)');
grid on;










