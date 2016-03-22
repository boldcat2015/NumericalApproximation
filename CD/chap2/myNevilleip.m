function  [ f ] = myNevilleip ( n , fn , x , varargin )
% Neville interpolate
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
    syms x N
end
for i = 1 : l
    N ( i , 1 ) = fn ( i );
end
for j = 2 : l
    for i = 1 : l - j + 1
        if nargin == 2
            syms ac bd ;
        end
        ac = ( x - n ( i ))* N ( i + 1 , j - 1 );
        bd = ( x - n ( i + j - 1 ))* N ( i , j - 1 );
        N ( i , j ) = ( ac - bd )/( n ( i + j - 1 ) - n ( i ));
    end
end
f = N ( 1 , l );
disp ( 'Neville gram:' );
disp ( vpa ( N , 6 ));
if nargin == 2
    f = simple ( f );
    disp ( vpa ( f , 6 ));
end
end
