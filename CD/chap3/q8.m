xx = linspace ( -1 , 1 , 6 );
yy = abs ( xx ) ;
M = myspline3 ( xx , yy , 'P' , [0 0])
xxx = linspace ( -1 , 1 , 10000 );
yyy = splineval ( xx , yy , 'P' , M , xxx );
plot(xxx , yyy);
