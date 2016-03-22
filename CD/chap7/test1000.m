n = 1000
a = rand(1,n) + 1 ;
b = rand(1,n) + 2 ;
x = zeros(n,2) ;
y = zeros(n,2) ;
e1 = 1e-100 ;
e2 = 1e-100 ;
for i = 1 : n
    x(i,:) = mybisec(@testf , a(i) , b(i) , e1 , e2);
    y(i,:) = mybisec(@(x)(x-2).^9 , a(i) , b(i) , e1 , e2);
end
x
Mean_x = mean(x)-2
Var_x = var(x)
Mean_y = mean(y)-2
Var_y = var(y)
