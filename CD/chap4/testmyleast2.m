x = 1 : 12;
y = [256 201 159 61 77 40 17 25 103 156 222 345];
xx = linspace(1,12,1e5);
a = myleast2 ( x , y , 3 )
yy = mypolyval ( a , xx );
figure;
hold on;
plot ( x , y , 'bo' , 'LineWidth' , 3 );
plot ( xx , yy , 'k' , 'LineWidth' , 2);
