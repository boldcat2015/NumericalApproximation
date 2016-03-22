function  [ f ] = myLagrangeip ( n , fn , x , varargin )
% Lagrange interpolate
% input x , f(x) , maybe y
% output f , or f(y) if y is provided
% 2015.09.26 Andy
if nargin < 2
    error ( 'Too few input arguments.' );
end
l = length ( n );
if l == 1
    error ( 'Too few nodes.' );
end
if l ~= length ( fn )
    error ( 'x and fx uncompatible.' );
end
for i = 1 : l
    if i < find ( n == n ( i ), 1 , 'last')
        error ( 'Repeated nodes.' );
    end
end
if nargin == 2
    syms x f
end
f = 0 ;
for i = 1 : l
    if nargin == 2
        syms numerator denominator ;
    end
    numerator = 1 ;
    denominator  = 1 ;
    for j = 1 : l
        if j == i
            continue ;
        end
        numerator = numerator * ( x - n ( j ));
        denominator = denominator * ( n ( i ) - n ( j ));
    end
    f = f + fn ( i ) * numerator / denominator ;
end
if nargin == 2
    f = simple ( f );
    disp ( vpa ( f , 6 ));
end
end
