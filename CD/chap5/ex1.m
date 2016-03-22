function [ ans ] = ex1 ( x )
% 1/(x^0.5)
% input: x
% output: [ ans ]
% 2015.12.08 Andy
ans(x==0) = 0 ;
ans(x~=0) = 1 ./ sqrt(x(x~=0));
