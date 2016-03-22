function [ ans ] = mypolyval ( p , x )
% input coefficients of p, from high degree to constant
% input x
% output polynomial value of p at x
% 2015.10.13 Andy
s = size ( x );
ans = p ( 1 ) * ones ( s );
l = length ( p );
for i = 2 : l
    ans = ans .* x ;
    ans = ans + p ( i ) * ones ( s );
end
end
