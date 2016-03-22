function [] = plotbezier ( x , y )
% input x and y of control points
% draw Bezier curve
% 2015.10.25 Andy
n = length ( x );
if n ~= length ( y )
    error ( 'x and y not compatible.' );
end
tt = linspace ( 0 , 1 , 10e3 );
xx = mybezierval ( x , tt );
yy = mybezierval ( y , tt );
plot ( xx , yy , 'r' );
