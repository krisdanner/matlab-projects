N = 1e6;
x = -10:0.01:10;
mx = 1;
sigx = 2;
Z = randn(1,N);
X = sigx*Z+mx;
f = @(x) 1/(sigx*sqrt(2*pi))*exp(-(x-mx).^2/(2*sigx^2));
figure(1);
subplot(1,2,1);
histogram(X,20,'Normalization','pdf');
hold on;
plot(x,f(x),'r-','Linewidth',3);


