function [ ans ] = iterate ( f , x , e )
% Get zero point of f by iterate method, initiate at x,
% end when abs(f(x)) < e.
% f must satisfy Lipchitz's condition
% input: f , x , e
% output: [ ans ]
% 2015.12.22 Andy

if nargin < 3
    e = 1e-10 ;
    disp('e set to 1e-10 by default.');
end

i = 0 ;
while abs(feval(f,x)) >= e
    i = i + 1 ;
    x = x - feval(f , x);
    if i == 1e5
        error('f diverge from x.');
    end
end
ans = x ;
disp(sprintf('%d times iteration:',i));
return ;
