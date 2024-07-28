% Define as condições iniciais
t = 0; % tempo inicial
theta = pi/4; % ângulo inicial
omega = 0; % velocidade angular inicial

% Define os parâmetros do pêndulo
g = 9.8; % aceleração da gravidade
L = 1; % comprimento do pêndulo

% Define o intervalo de tempo
dt = 0.01; % passo de tempo
t_final = 10; % tempo final

% Inicializa os arrays para armazenar os dados
num_steps = t_final/dt + 1; % número de pontos a serem plotados
t_array = zeros(1, num_steps); % array para armazenar os tempos
theta_array = zeros(1, num_steps); % array para armazenar os ângulos
omega_array = zeros(1, num_steps); % array para armazenar as velocidades angulares

% Executa o loop de animação
for i = 1:num_steps
    % Armazena os dados em cada passo
    t_array(i) = t;
    theta_array(i) = theta;
    omega_array(i) = omega;
    
    % Atualiza as condições com base nas equações do pêndulo
    omega = omega - (g/L)*sin(theta)*dt;
    theta = theta + omega*dt;
    t = t + dt;
end

% Plota a animação
for i = 1:num_steps
    clf; % limpa a figura anterior
    x = L*sin(theta_array(i)); % coordenada x do pêndulo
    y = -L*cos(theta_array(i)); % coordenada y do pêndulo
    plot([0 x], [0 y], 'k-o', 'LineWidth', 2); % plota o pêndulo
    axis equal; % mantém as escalas de x e y iguais
    axis([-L L -L 0]); % define o intervalo dos eixos
    pause(0.01); % aguarda um momento antes de atualizar a tela
end
