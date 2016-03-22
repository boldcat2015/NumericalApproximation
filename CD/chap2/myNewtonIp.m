function  [ f ] = myNewtonip ( n , fn , x , varargin )
% Newton interpolate
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
    syms x N numerator denominator tmp xs
end
f = 0 ;
for i = 1 : l
    numerator = fn ( i );
    denominator = 1 ;
    xs = 1 ;
    for j = 1 : i - 1
        tmp = 1 ;
        for k = 1 : j - 1
            tmp = tmp * ( n ( i ) - n ( k ));
        end
        numerator = numerator - N ( j ) * tmp ;
        denominator = denominator * ( n ( i ) - n ( j ));
        xs = xs * ( x - n ( j ));
    end
    N ( i ) = numerator / denominator ;
    f = f + N ( i ) * xs ;
end
if nargin == 2
    disp ( 'Coefficients (c0,c1,..,cn):' );
    disp ( vpa ( N , 6 ));
    disp ( 'Original Newton Form:' );
    disp ( vpa ( f , 6 ));
    f = simple ( f );
end
end
