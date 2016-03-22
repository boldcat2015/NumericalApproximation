function [ I ] = myint ( f , a , b , n )
% Integral f on [a,b] with n-order polynomial Newton-Cotes
% input: f , a , b , n
% output: [ I ] = int_{a,b}(f)
% 2015.11.24 Andy

if n == 0
    I = (b-a) * feval(f,(a+b)/2);
    return;
end
x = linspace( a , b , n + 1 );
y = feval(f , x);
I = y * cotes(n) * (b - a) ;
