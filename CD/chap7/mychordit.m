function [ ans ] = mychordit ( f , x0, x1 , tol , maxit , varargin )
% Find root of f by chord iteration, initiate at x0 , x1
% input: f , x0 , x1 , tol , maxit
% output: [ ans ]
% 2015.12.22 Andy

%% validating input
if nargin < 2
    error ( 'Too few input.' );
end
if nargin < 3
    x1 = x0 + 1 ;
    disp('x1 set to x0 + 1 by default.');
end
if nargin < 4
    tol = 1e-10 ;
    disp('tol set to 1e-10 by default.');
end
if nargin < 5
    maxit = 1e5 ;
    disp('maxit set to 1e5 by default.');
end

% chord

i = 0 ;
ans = x1 ;
while abs(feval(f,ans)) >= tol
    i = i + 1 ;
    if i == maxit
        error('exceed max iteration.');
    end
    if feval(f,x1) == feval(f,x0)
        error('fail for repeat iterate points');
    end
    ans = x1 ;
    x1 = x1 - feval(f,x1)*(x1-x0)/(feval(f,x1)-feval(f,x0));
    x0 = ans ;
end
disp(sprintf('on %d times iteration:',i));

