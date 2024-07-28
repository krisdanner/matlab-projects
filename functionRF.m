function dxdt = functionRF(t,x)
% Equações diferenciais do sistema

dxdt = [x(2); -sin(x(1))-0.1*x(2)+0.2*x(2)^3];
% dx = zeros(2,1);
% 
% dx(1) = x(2);
% dx(2) = -sin(x(1))-0.1*x(2)+0.2*x(2)^3;
end
