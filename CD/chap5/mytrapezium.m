function [ I ] = mytrapezium ( f , a , b , n )
% Integral f on [a,b] with trapezium method
% input: f , a , b , n
% output: [ I ] = \int_a^b(f)
% 2015.11.24 Andy

if n == 0
    I = (b-a) * feval(f,(a+b)/2);
    return;
end
x = linspace( a , b , n + 1 );
y = feval(f , x);
y(1) = feval(f , x(1));
I = (b - a)/n * (sum(y) - 0.5*(y(1)+y(n+1))) ;
