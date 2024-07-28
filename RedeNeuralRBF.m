% Exemplo de como usar uma rede neural RBF 
% com uma aplica��o de aproxima��o de fun��o
% ---------------------------------------------

% Geramos dados de exemplo representando uma fun��o senoidal com ru�do.
% Usamos a fun��o newrb para treinar uma rede RBFN com os dados de entrada x 
% e sa�das y. Os par�metros 0.1 e 0.5 representam a meta de erro e o espalhamento 
% inicial das fun��es de base radial, respectivamente. O n�mero 10 � o n�mero m�ximo 
% de neur�nios de base radial na camada oculta, e 1 � o n�mero de neur�nios na camada 
% de sa�da.
% Usamos a fun��o sim para avaliar a rede treinada nas mesmas entradas x e obter as 
% sa�das estimadas y_estimated.
% Plotamos os dados de treinamento (y) e as sa�das estimadas da rede RBFN (y_estimated) 
% para visualizar a aproxima��o da fun��o.

% Gera��o de dados de exemplo
x = linspace(-5, 5, 100);  % Entradas
y = sin(x) + 0.1*randn(size(x));  % Sa�das com ru�do

% Treinamento da rede RBFN
net = newrb(x, y, 0.1, 0.5, 10, 1);

% Avalia��o da rede treinada
y_estimated = sim(net, x);

% Plot dos resultados
figure;
plot(x, y, 'b', x, y_estimated, 'r');
grid;
%title('Aproxima��o de Fun��o usando RBFN');
xlabel('Entrada');
ylabel('Sa�da');
legend('$y$', '$\hat{y}$','interpreter', 'latex');

