function [ c ] = cotes ( n )
% Compute Cotes coefficients of n using P179/3
% input: n
% output: [ c ] = c(n,0) .. c(n,n)
% 2015.11.24 Andy

% Ac=b
A = zeros( n );
for i = 1 : n
    A(i,:) = ([1:n]./n).^i ;
end
b = 1 ./ [2:n+1]';
c = A\b;
c = [c(n);c];
