% Copyright © 2015 Cheng Yuge. All Rights Reserved.
% 2015.11.3
l = 1e5;
xx = linspace(-pi , pi , l );
yy = sign( cos( xx ));
a = zeros( 1 , 100 );
for i = 1 : 100
    switch mod(i , 4)
    case 0
        a(i) = 0 ;
    case 1
        a(i) = 1 ;
    case 2
        a(i) = 0 ;
    case 3
        a(i) = -1 ;
    end
end
ff = zeros (size(xx));
set (gcf,'Position',[0,0,1800,600], 'color','w');
% figure;
hold on;
plot ( xx , yy , 'r' , 'LineWidth' , 3.5 );
for i = 1 : 100
    ff = ff + 4*a(i)/(i*pi) * cos(i*xx);
    if i<3|i==5|i==10|i==20|i==50|i==100
        plot ( xx , ff , 'Color' , [0 0 i/100] , 'LineWidth' , 2.1 - i/100 );
    end
end
legend ( 'sign(cos(x))' , 'n=1' , 'n=2' , 'n=5' , 'n=10' , 'n=20' , 'n=50' , 'n=100' , 'Location' , 'South' );
