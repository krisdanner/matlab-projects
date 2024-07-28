a = -1;
b = 1;
m = (b+a)/2
var = (b-a)^2/12
pd = makedist('Uniform','lower',a,'upper',b);
x = -5:0.01:5;
pdf = pdf(pd,x);
figure;
plot(x,pdf,'r','LineWidth',3);




