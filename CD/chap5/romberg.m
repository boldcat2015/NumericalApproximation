function [ ans ] = romberg ( f , a , b , n , varargin )
% Integrate function by Romberg serial (Richardson method)
% input: f , a , b , n
% output: [ ans ] = \int_a^b f to n degre
% n=1: Trapezium
% n=2: Simpson
% work on linspace(a,b,2^n)
% 2015.12.05 Andy

%% validating input
if nargin < 1
    f = @exp ;
    disp('f is set to @exp by default');
end
if nargin < 2
    a = 0 ;
    disp('a is set to 0 by default');
end
if nargin < 3
    b = a + 1 ;
    disp(sprintf('b is set to a+1=%f by default',a+1));
end
if nargin < 4
    n = 5 ;
    disp('n is set to 5 by default');
end
if n < 1
    error('degre n must be positive integer.');
end
%% P153
h = (b-a) ./ 2 .^ (1:n);
T = zeros(n);
% T(k,m): int by 2^k Pm
% first column of T : trapezium
T(1,1) = h(1)*(feval(f,a) + feval(f,b));
for l = 2 : n
    T(l,1) = sum(feval(f,(a+h(l-1) : 2*h(l-1) : b)));
    T(l,1) = 1/2 * T(l-1,1) + h(l-1)*T(l,1);
end

% Romberg
for m = 2 : n
    for k = 1 : n - m + 1
        T(k,m) = (4^(m-1)*T(k+1,m-1)-T(k,m-1))/(4^(m-1)-1);
    end
end

%T % check table
ans = T(1,n);
