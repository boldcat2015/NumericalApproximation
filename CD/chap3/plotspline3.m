function [ ] = plotspline3 ( x , fx , l )
% draw spline
% input nodes x, value on nodes fx, plotpoints n,
% 2015.10.21 Andy
n = length ( x );
if n < 3
    error ( 'Too few nodes.' );
end
if n ~= length ( fx )
    error ( 'Number of nodes and value not compatible.' );
end
for i = 1 : n-1
    if x(i) >= x(i+1)
        error ( 'Please align nodes increasingly.' );
    end
end

xx = linspace ( min(x) , max(x) , l );
M1 = myspline3 ( x , fx , 'D1' , [0 0] )
M2 = myspline3 ( x , fx , 'D2' , [0 0] )
MP = myspline3 ( x , fx , 'P' , [0 0] )
yy1 = splineval ( x , fx , 'D1' , M1 , xx );
yy2 = splineval ( x , fx , 'D2' , M2 , xx );
yyp = splineval ( x , fx , 'P' , MP , xx );
figure;
hold on;
plot ( x , fx , 'ko' , 'linewidth' , 3 );
plot ( xx , yy1 , 'r-' , 'linewidth' , 2 );
plot ( xx , yy2 , 'g--' , 'linewidth' , 2 );
plot ( xx , yyp , 'b-.' , 'linewidth' , 2 );
legend('Nodes','D1 Spline','D2 Spline','Periodic Spline','location','south');
