function [ p ] = mybezierval ( x , t )
% compute Bezier curve P(t)
% input xs of control points, and t
% 2015.10.25 Andy

n = length ( x );
if n == 1
    p = x ;
    return;
end
p = zeros ( size ( t ));
for i = 1 : n
    p = p + x(i) * bernstein ( i-1 , n-1 , t );
end
