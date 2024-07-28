function xdot = rocket_eqs(t,x,p)
    % Par�metros do ve�culo
    m = p(1);
    C = p(2);
    S = p(3);
    xcp = p(4);
    xcg = p(5);
    Iy = p(6);
    Vw = p(7);

    % Vari�veis de estado
    x1 = x(1); % posi��o no eixo x
    x2 = x(2); % posi��o no eixo y
    x3 = x(3); % posi��o no eixo z
    x4 = x(4); % velocidade no eixo x
    x5 = x(5); % velocidade no eixo y
    x6 = x(6); % velocidade no eixo z
    x7 = x(7); % �ngulo de eleva��o
    x8 = x(8); % �ngulo de azimute

    % C�lculo das for�as e momentos
    rho = 1.2; % kg/m^3
    V = sqrt(x4^2 + x5^2 + x6^2); % velocidade total
    Nalpha = (rho*V^2*S*C)/2; % for�a normal aerodin�mica
    To = 25700; % impulso do sustentador
    T = 25700; % gimbaled empuxo
    D = 0.1*V^2; % for�a de arrasto
    F = To + T - D; % for�a total no eixo x
    alphaw = Vw/V; % �ngulo de ataque induzido pelo vento
    M1 = xcp*Nalpha/Iy; % momento de inclina��o
    M2 = xcg*T/Iy; % momento de desvio
    N = Nalpha*x8; % for�a normal aerodin�mica (eleva��o) atuando no centro de press�o

    % Equa��es de movimento
    x1dot = x4;
    x2dot = x5;
    x3dot = x6;
    x4dot = -(F/m)*sin(x7);
    x5dot = (F/m)*cos(x7)*sin(x8);
    x6dot = (F/m)*cos(x7)*cos(x8) - 9.81;
    x7dot = x8;
    x8dot = x7 + x6dot/V + alphaw - (Nalpha/m)*sin(x7) - (M1/M2)*x8;
    xdot = [x1dot; x2dot; x3dot; x4dot; x5dot; x6dot; x7dot; x8dot];
end

