x = (-4:.001:4);
y = x;
[X,Y] = meshgrid(x,y);
Z = X.^2 + Y.^2;

figure;
mesh(X,Y,Z)
xlabel('X');
ylabel('Y');
zlabel('Z');
