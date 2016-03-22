function [ ans, info  ] = mybisec ( f , a , b , e1 , e2 , varargin )
% Bisection to get zero point of f in [a, b] with tol
% input: f , a , b , e1 , e2
% output: [ ans ]
% 2015.12.21 Andy

%% validating input
info = 0;
if nargin < 3
    info = 1 ;
    ans = NaN ;
    warning ( 'must give two opposite valued initial points.' );
    return;
end
if nargin < 4
    e1 = 1e-10 ;
    warning('e1 set to 1e-10 by default.');
end
if nargin < 5
    e2 = 5e-7 ;
    warning('e2 set to 5e-7 by default.');
end
if feval(f,a)*feval(f,b) > 0
    info = 2 ;
    ans = NaN ;
    warning('must give two opposite valued initial points.');
    return ;
end

e2 = e2 * max(abs(a),abs(b));


i = 0;
ans = (a + b) / 2;
fx = feval(f, ans);
fa = feval(f, a);
fb = feval(f, b);

if abs(feval(f , a)) <= e1
    ans = a ;
    return;
elseif abs(feval(f , b)) <= e1
    ans = b ;
    return;
end

for i = 1 : 100
    if fx * fa > 0
        a = ans ;
        fa = fx;
    else
        b = ans ;
        fb = fx;
    end
    ans = (a + b) / 2 ;
    fx = feval(f,ans);
    if abs(b - ans) <= e2
        break;
    elseif abs(fx) <= e1
        break;
    end
    if i > 99
        info = 3 ;
        warning('bisection.');
        return;
    end
end

%disp(sprintf('%d times bisection:',i));

return;
