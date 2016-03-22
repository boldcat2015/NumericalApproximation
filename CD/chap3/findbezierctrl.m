function [ Px , Py ] = findbezierctrl ( Qx , Qy , varargin )
% Find control points P that bezier(P) land on given points Q.
% input: Qx , Qy
% output: [ Px , Py ]
% 2015.10.29 Andy

%% validating input
if nargin < 2
    error ( 'Too few input.' );
end
n = length ( Qx );
if n ~= length ( Qy )
    error ( 'Input length not compatible.' );
end
if n <= 2
    Px = Qx ;
    Py = Qy ;
    return ;
end

%% Parameterization: compute t(i) due to distant between Q(i) and Q(i+1).
d(1:n-1) = ((Qx(2:n) - Qx(1:n-1)) .^ 2 + (Qy(2:n) - Qy(1:n-1)) .^ 2 ) .^ 0.5 ;
for i = 1 : n-1
    l(i) = sum ( d(1:i) );
end
t(1) = 0 ;
t(2:n) = 1/l(n-1) .* l ;

%% build matrix B
B = zeros ( n , n );
for i = 1 : n
    for j = 1 : n
        B(i,j) = bernstein ( j-1 , n-1 , t(i) );
    end
end

%% solve P in BP = Q
Qx = reshape ( Qx , n , 1 );
Qy = reshape ( Qy , n , 1 );
Px = B \ Qx ;
Py = B \ Qy ;
end
