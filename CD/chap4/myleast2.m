function [ a ] = myleast2 ( x , y , n , varargin )
% Least Square method
% input: x , y , n
% nodes, values on nodes, degree of polynomial.
% output: [ a ]
% coefficients of polynomial from high degree to low.
% 2015.11.09 Andy

%% validating input
if nargin < 2
    error ( 'Too few input.' );
end
m = length ( x );
if m ~= length ( y )
    error ( 'Input length not compatible.' );
end
if x ~= sort(x,'ascend') & x ~= sort(x,'descend')
    error ( 'Nodes must be increasing or decreasing.' );
end
if nargin < 3
    n = m ;
    disp('Degree of polymonial set to the number of point.');
end
%% Xa=y : choose {1,x,x^2,..,x^n} as base functions
X = zeros ( m , n+1 );
for i = 1 : m
    for j = 1 : n+1
        X(i,j) = x(i)^(j-1) ;
    end
end
% X'Xa = X'y => a = (X'X)\X'y
y = reshape(y,m,1);
a = (X'*X) \ (X'*y);
% arrange coefficients from high degree to low degree.
a = flipud( a )';
