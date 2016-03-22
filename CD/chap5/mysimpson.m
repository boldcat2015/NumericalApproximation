function [ I ] = mysimpson ( f , a , b , n )
% Integral f on [a,b] with simpson method
% input: f , a , b , n
% output: [ I ] = \int_a^b(f)
% 2015.11.24 Andy

if n == 0
    I = (b-a) * feval(f,(a+b)/2);
    return;
end
x = linspace( a , b , 2*n + 1 );
y = feval(f , x);
y(1) = feval(f , x(1));
mid(1:n) = y(2*(1:n));
smid = 2 / 3 * sum(mid);
lr(1:n-1) = y(2*(1:n-1)+1);
slr = 1 / 3 * sum(lr);

I = (b - a)/n * (smid + slr + 1/6*(y(1)+y(2*n+1))) ;
