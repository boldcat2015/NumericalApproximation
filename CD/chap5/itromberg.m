function [ ans ] = itromberg ( f , a , b , tol , varargin )
% Integrate function by Romberg serial (iterate till stable)
% input: f , a , b , tol
% output: [ ans ] = \int_a^b f to tolerance
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
    tol = 1e-5 ;
    disp('tol is set to 1e-5 by default');
end
it = 50 ;
%% P153
h = (b-a) ./ 2 .^ (1:it);
T = zeros(it);
% T(k,m): int by 2^k Pm
% first column of T : trapezium
T(1,1) = h(1)*(feval(f,a) + feval(f,b));
for i = 2 : it
    T(i,1) = sum(feval(f,(a+h(i-1) : 2*h(i-1) : b)));
    T(i,1) = 1/2 * T(i-1,1) + h(i-1)*T(i,1);
    for j = 2 : i
        T(i,j) = (4^(j-1)*T(i,j-1)-T(i-1,j-1))/(4^(j-1)-1);
    end
    ff = feval(f,a:h(i-1):b);
    den = max(abs(ff))*(b-a);
    dif = abs(T(i,i) - T(i-1,i-1)) / den ;
    if dif < tol
        disp(sprintf('Procedure ends on level %d.',i));
        ans = T(i,i);
        return;
    end
end

%T % check table
error('int_a^b f diverge!');
