m = 2;
c = 1;
k1 = 1;
k2 = -0.5;


odefun = @(t, x) [x(2); -k1*x(1)/m-c*x(2)/m-k2*x(1)^3/m];
plotpp(odefun,'tspan', 50,'quivercolor', [0.0,0.0,1.0],'linecolor', [1.0,0.0,0.0])