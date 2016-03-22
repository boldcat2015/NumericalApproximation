function  [ f ] = myNewtonIpF ( n , fn )
% Newton interpolate
% input x , f(x)
% output f as a string
% 2015.09.29 Andy
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
for i = 1 : l
    N ( i , 1 ) = fn ( i );
end
for j = 2 : l
    N (1:l-j+1 , j) = (N (1:l-j+1 , j-1) - N(2:l-j+2 , j-1));
    N (1:l-j+1 , j) = N (1:l-j+1 , j) ./ (n(1:l-j+1)' - n(j:l)');
end
f ( 1 : l ) = N ( 1 , l : -1 : 1 );
for i =  1 : l - 1
    f ( 2 : i + 1 ) = f ( 2 : i + 1 ) + ( - n ( l - i )) * f ( 1 : i );
end
end
