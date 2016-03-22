function  [ f ] = myHermiteipNew ( n , fn )
% Hermite interpolate (Newton method)
% input x , f(x) (f'(x), f''(x),.., if x is repeated)
% output coefficients of polynomial f
% 2015.10.13 Andy
l = length ( n );
if l == 1
    error ( 'Too few nodes.' );
end
if l ~= length ( fn )
    error ( 'x and fx uncompatible.' );
end
for i = 1 : l
    for j = find ( n == n ( i ), 1 , 'first') : find ( n == n ( i ), 1 , 'last')
        if n ( j ) ~= n ( i )
            error ( 'Repeated nodes must be together.' );
        end
    end 
end 
for i = 1 : l % first column of DQ gram
    H ( i , 1 ) = fn ( find ( n == n ( i ), 1 , 'first' ));
end
for j = 2 : l % update DQ gram column by column
    for i = 1 : l - j + 1
        x1 = find ( n == n ( i ), 1 , 'first' );
        x2 = find ( n == n ( i + j - 1 ), 1 , 'first' );
        if x1 == x2 % same points lead to deeper derivative
            H ( i , j ) = fn ( x1 + j - 1 ) / factorial ( j - 1 );
        else
            H ( i , j ) = ( H ( i + 1 , j - 1 ) - H ( i , j - 1 ) )/( n ( i + j - 1 ) - n ( i ));
        end
    end
end
f ( 1 : l ) = H ( 1 , l : -1 : 1 ); % polynomial coefficients
for i =  1 : l - 1 % update coefficients iterately
    f ( 2 : i + 1 ) = f ( 2 : i + 1 ) + ( - n ( l - i )) * f ( 1 : i );
end
% disp ( 'Difference-quotient gram:' );
% disp ( vpa ( H , 6 ));
end
