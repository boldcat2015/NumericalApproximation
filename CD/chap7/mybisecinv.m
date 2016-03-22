function [ ans ] = mybisecinv ( f , a , b , e1 , e2 , varargin )
% Get zero point of f in [a, b] with bisection and inverse function
% input: f , a , b , e1 , e2
% output: [ ans ]
% 2015.12.21 Andy

%% validating input
if nargin < 3
    error ( 'must give two opposite valued initial points.' );
end
if nargin < 4
    e1 = 1e-10 ;
    disp('e1 set to 1e-10 by default.');
end
if nargin < 5
    e2 = 5e-7 ;
    disp('e2 set to 5e-7 by default.');
end
if feval(f,a)*feval(f,b) > 0
    error ( 'must give two opposite valued initial points.' );
end
if abs(feval(f , a)) <= e1
    ans = a ;
    return;
elseif abs(feval(f , b)) <= e1
    ans = b ;
    return;
end

i = 0 ;
ans = (a + b) / 2;
while abs(feval(f , ans)) > e1
    i = i + 1 ;
    if feval(f , ans) * feval(f , a) > 0
        a = ans ;
    else
        b = ans ;
    end
    switch mod(i , 2)
    case 0 % bisection
        ans = (a + b) / 2 ;
    case 1 % inverse function
        ans = (a*feval(f,b) - b*feval(f,a)) / (feval(f,b) - feval(f,a));
    end
    if abs(b - ans) <= e2
        break;
    end
end

disp(sprintf('%d times bisection:',i));

return;
