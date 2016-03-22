function [ ans ] = f92 ( x )

ans(x==0) = 0;
ans(x~=0) = (1 - cos(x(x~=0))) ./ x(x~=0) ;
