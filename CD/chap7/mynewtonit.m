function [ ans ] = mynewtonit ( f , f1, x , tol , maxit , varargin )
% Find root of f by Newton iteration, initiate at x
% input: f , f1 , x , tol , maxit
% output: [ ans ]
% 2015.12.22 Andy

%% validating input
if nargin < 3
    error ( 'Too few input.' );
end
if nargin < 4
    tol = 1e-10 ;
    disp('tol set to 1e-10 by default.');
end
if nargin < 5
    maxit = 1e5 ;
    disp('maxit set to 1e5 by default.');
end

% Newton

i = 0 ;
ans = x ;
while abs(feval(f,ans)) >= tol
    i = i + 1 ;
    if i == maxit
        error('exceed max iteration.');
    end
    if feval(f1,ans) == 0
        error(sprintf('fail on %f for zero derivitive.',ans));
    end
    ans = ans - feval(f,ans)/feval(f1,ans) ;
end
disp(sprintf('on %d times iteration:',i));

