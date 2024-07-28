% Nesta versão, os dados brutos de posição para cada eixo são filtrados 
% individualmente usando a função medfilt1, e então são plotados juntos 
% como uma trajetória tridimensional usando a função plot3. 
% As variáveis filteredX, filteredY, e filteredZ contêm os dados filtrados 
% para cada eixo, respectivamente. Novamente, o tamanho da janela do filtro 
% mediano pode ser ajustado alterando o valor da variável medianFilterWindow.

close all
clear
clc

% Carregar dados da trajetória

traj = xlsread('TrajFalcao8230.xlsx');

x = traj(2:end, 1)*1000;
y = traj(2:end, 2)*1000;
z = traj(2:end, 3)*1000;

% Leitura do arquivo com dados de trajetória nominal

traj2 = xlsread('trajnominal1.xlsx');

x2 = traj2(:, 2);
y2 = traj2(:, 3);
z2 = traj2(:, 4);

% Aplicar filtro mediano para remover ruídos

medianFilterWindow = 100; % Tamanho da janela do filtro mediano
filteredX = medfilt1(x, medianFilterWindow);
filteredY = medfilt1(y, medianFilterWindow);
filteredZ = medfilt1(z, medianFilterWindow);

% Plotar dados brutos da trajetória

figure;
plot3(x, y, z, 'b', 'linewidth',2);
grid;
xlabel('Posição em x (m)');
ylabel('Posição em y (m)');
zlabel('Posição em z (m)');
title('Trajetória Bruta do Foguete Balístico Suborbital');
legend('Real','Location','NorthEast')

% Plotar dados filtrados da trajetória

figure;
plot3(filteredX, filteredY, filteredZ, 'r-','linewidth',2);
grid;
xlabel('Posição em x (m)');
ylabel('Posição em y (m)');
zlabel('Posição em z (m)');
title('Trajetória Filtrada do Foguete Balístico Suborbital');

% Plotar dados da trajetória nominal

hold on;
plot3(x2, y2, z2, 'k', 'linewidth',2);
legend('Real Filtrada','Nominal','Location','NorthEast')


