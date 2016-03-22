x = linspace(1.99,2.01,1e3);
y = feval(@testf,x);
plot(x,y,'b.');
grid on;
hold on;
y1 = (x-2).^9;
plot(x,y1,'r');

z = 0.1.^(1:15);
