% Exemplo de como usar uma rede neural RBF 
% com uma aplicação de aproximação de função
% ---------------------------------------------

% Geramos dados de exemplo representando uma função senoidal com ruído.
% Usamos a função newrb para treinar uma rede RBFN com os dados de entrada x 
% e saídas y. Os parâmetros 0.1 e 0.5 representam a meta de erro e o espalhamento 
% inicial das funções de base radial, respectivamente. O número 10 é o número máximo 
% de neurônios de base radial na camada oculta, e 1 é o número de neurônios na camada 
% de saída.
% Usamos a função sim para avaliar a rede treinada nas mesmas entradas x e obter as 
% saídas estimadas y_estimated.
% Plotamos os dados de treinamento (y) e as saídas estimadas da rede RBFN (y_estimated) 
% para visualizar a aproximação da função.

% Geração de dados de exemplo
x = linspace(-5, 5, 100);  % Entradas
y = sin(x) + 0.1*randn(size(x));  % Saídas com ruído

% Treinamento da rede RBFN
net = newrb(x, y, 0.1, 0.5, 10, 1);

% Avaliação da rede treinada
y_estimated = sim(net, x);

% Plot dos resultados
figure;
plot(x, y, 'b', x, y_estimated, 'r');
grid;
%title('Aproximação de Função usando RBFN');
xlabel('Entrada');
ylabel('Saída');
legend('$y$', '$\hat{y}$','interpreter', 'latex');

