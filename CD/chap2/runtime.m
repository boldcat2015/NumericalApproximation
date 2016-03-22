% test runtime of Newton interpolation
xx = [ 0 : 1/200 * pi :  pi ];
yy = sin ( xx );
% xx = [ -50 * pi : pi / 2 : 50 * pi ];
% yy = sin ( xx );
figure ;
hold on ;
% axis ([ 0 , pi , 0 , 1 ]);
plot ( xx , yy , 'k-' );
% plot ( xx , polyval ( myNewtonIpF ( xx , yy ) , xx ) , 'r-' );
% plot ( xx , yy , 'r-' );
tic;
pp = myNewtonIpF ( xx , yy );
toc;
tic;
xxx = [ 0 : 1/1000000 * pi : pi ];
yyy = polyval ( pp , xxx );
plot ( xxx , yyy );
toc;
