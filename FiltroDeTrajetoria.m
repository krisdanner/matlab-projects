% Nesta vers�o, os dados brutos de posi��o para cada eixo s�o filtrados 
% individualmente usando a fun��o medfilt1, e ent�o s�o plotados juntos 
% como uma trajet�ria tridimensional usando a fun��o plot3. 
% As vari�veis filteredX, filteredY, e filteredZ cont�m os dados filtrados 
% para cada eixo, respectivamente. Novamente, o tamanho da janela do filtro 
% mediano pode ser ajustado alterando o valor da vari�vel medianFilterWindow.

close all
clear
clc

% Carregar dados da trajet�ria

traj = xlsread('TrajFalcao8230.xlsx');

x = traj(2:end, 1)*1000;
y = traj(2:end, 2)*1000;
z = traj(2:end, 3)*1000;

% Leitura do arquivo com dados de trajet�ria nominal

traj2 = xlsread('trajnominal1.xlsx');

x2 = traj2(:, 2);
y2 = traj2(:, 3);
z2 = traj2(:, 4);

% Aplicar filtro mediano para remover ru�dos

medianFilterWindow = 100; % Tamanho da janela do filtro mediano
filteredX = medfilt1(x, medianFilterWindow);
filteredY = medfilt1(y, medianFilterWindow);
filteredZ = medfilt1(z, medianFilterWindow);

% Plotar dados brutos da trajet�ria

figure;
plot3(x, y, z, 'b', 'linewidth',2);
grid;
xlabel('Posi��o em x (m)');
ylabel('Posi��o em y (m)');
zlabel('Posi��o em z (m)');
title('Trajet�ria Bruta do Foguete Bal�stico Suborbital');
legend('Real','Location','NorthEast')

% Plotar dados filtrados da trajet�ria

figure;
plot3(filteredX, filteredY, filteredZ, 'r-','linewidth',2);
grid;
xlabel('Posi��o em x (m)');
ylabel('Posi��o em y (m)');
zlabel('Posi��o em z (m)');
title('Trajet�ria Filtrada do Foguete Bal�stico Suborbital');

% Plotar dados da trajet�ria nominal

hold on;
plot3(x2, y2, z2, 'k', 'linewidth',2);
legend('Real Filtrada','Nominal','Location','NorthEast')


