xx = linspace ( -1 , 1 , 5 );
yy = abs ( xx ) ;
M = myspline3 ( xx , yy , 'D2' , [0 0])
xxx = linspace ( -1 , 1 , 10000 );
yyy = splineval ( xx , yy , 'D2' , M , xxx );
plot(xxx , yyy);
