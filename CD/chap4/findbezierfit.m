function [ Px , Py ] = findbezierfit ( Qx , Qy , n , varargin )
% Find n control points P that bezier(P) fits given m points Q.
% input: Qx , Qy , n
% output: [ Px , Py ]
% 2015.11.10 Andy

%% validating input
if nargin < 2
    error ( 'Too few input.' );
end
m = length ( Qx );
if m ~= length ( Qy )
    error ( 'Input length not compatible.' );
end
if m <= 2
    Px = Qx ;
    Py = Qy ;
    return ;
end
if nargin < 3
    n = m ;
    disp ( 'Ctrl points set to n by default.' );
end

%% Parameterization t
t(1:n) = (0:n-1) / (n-1);

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
