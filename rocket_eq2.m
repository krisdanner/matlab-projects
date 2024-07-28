function dydt = rocket_eq2(t,y,m,A,cd,T,theta)
    g = 9.81; % Acelera��o da gravidade em m/s^2
    rho = 1.225; % Densidade do ar em kg/m^3
    v = y(2); % Velocidade do foguete em rela��o ao ar
    q = 0.5*rho*v^2; % Press�o din�mica do ar
    dydt = zeros(2,1);
    dydt(1) = y(2);
    dydt(2) = -g - q*A*cd/m*abs(v)*v + T*sin(theta)/m;
end