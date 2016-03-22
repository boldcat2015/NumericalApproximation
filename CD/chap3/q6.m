xx = linspace ( 0 , 1 , 5 );
yy = [1 (sin(xx(2:5) ) ./ xx(2:5))] ;
M = myspline3 ( xx , yy , 'D1' , [0 (cos(1)-sin(1))])
xxx = linspace ( 0 , 1 , 10000 );
yyy = splineval ( xx , yy , 'D1' , M , xxx );
plot(xxx , yyy);
