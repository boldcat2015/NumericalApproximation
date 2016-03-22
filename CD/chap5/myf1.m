function [ ans ] = myf1 ( x )
% 1 / (1 + 25 * x^2 )
% input: x
% output: [ ans ]
% 2015.11.24 Andy

ans = 1 ./ ( 1 + 25 .* x .* x );
