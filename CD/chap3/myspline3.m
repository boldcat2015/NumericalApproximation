function [ M ] = myspline3 ( x , fx , type , dd , varargin )
% input nodes x, value on nodes fx,
%       spline type, and related boundary conditions as:
%       D1 -- [ f'(x1) f'(xn) ] ;
%       D2 -- [f''(x1) f''(xn)] ([0 0] as Natural Spline);
%       P  -- [ f'(x1) f''(x1)] as Periodical Spline;
% output M: the second order derivitives on nodes.
% 2015.10.21 Andy

%% validating input
	if nargin < 3
	    error ( 'Too few input. Please see help.' );
	end
	n = length ( x );
	if n < 3
	    error ( 'Too few nodes.' );
	end
    if n ~= length ( unique ( x ))
        error ( 'Repeated nodes.' );
    end
	if n ~= length ( fx )
	    error ( 'Number of nodes and value not compatible.' );
	end
	if nargin < 4
	    dd = [0 0];
	end
	if length ( dd ) ~= 2
	    error ( 'Boundary conditions must contain exactly 2 number.' );
	end
	type = upper ( type );
	if ~(strcmp(type,'D1')||strcmp(type,'D2')||strcmp(type,'P'))
	    error ( 'type must be "D1" or "D2" or "P".' );
	end
	if ~(strcmp(x,sort(x,'ascend'))||strcmp(x,sort(x,'descend')))
	    error ( 'Nodes must be increasing or decreasing.' );
	end
    if type == 'P'
        fx(n) = fx(1) ;
        warning ( 'fx(n) ignored due to periodic spline.' );
        x(n+1) = x(n) + x(2) - x(1) ;
    end
%% define u & v ( miu & lambda )
	u(2 : n-1) = (x(2 : n-1) - x(1 : n-2)) ./ (x(3 : n) - x(1 : n-2));
	v(2 : n-1) = (x(3 : n) - x(2 : n-1)) ./ (x(3 : n) - x(1 : n-2));
	if type == 'P'
	    u(n) = (x(n) - x(n-1)) ./ (x(n+1) - x(n-1));
	    v(n) = (x(n+1) - x(n)) ./ (x(n+1) - x(n-1));
	end
%% build Difference-Quotient gram
    dq = zeros ( 3 , n+2 );
    % The 3rd row of dq is:
    % f(1,1,2)/f(0,1,2), % D1/P % f(0,1,2):=f(n-1,n,n+1)
    % f(i-1,i,i+1), % i = 2 : n-1
    % f(n-1,n,n)/f(n-1,n,n+1) % D1/P
	dq(1,2:n+1) = fx;
	dq(2,2:n) = (dq(1,3:n+1) - dq(1,2:n)) ./ (x(2:n) - x(1:n-1));
	dq(3,2:n-1) = (dq(2,3:n) - dq(2,2:n-1)) ./ (x(3:n) - x(1:n-2));
    switch type
    case 'D1'
	    dq(3,1) = (dq(2,2) - dd(1)) ./ (x(2) - x(1));
    	dq(3,n) = (dd(2) - dq(2,n)) ./ (x(n) - x(n-1));
    case 'P'
        dq(2,1) = (fx(1) - fx(n-1)) ./ (x(n) - x(n-1));
        dq(2,n+1) = (fx(2) - fx(n)) ./ (x(n+1) - x(n));
    	dq(3,1) = (dq(2,2) - dq(2,1)) ./ (x(n+1) - x(n-1));
    	dq(3,n) = (dq(2,n+1) - dq(2,n)) ./ (x(n+1) - x(n-1));
    end
%% build A and b in equations AM=b
	A = 2 * eye ( n , n );
	A = A + diag ( [0 u(3:n-1) 0] , -1 );
	A = A + diag ( [0 v(2:n-2) 0] , 1 );
	b(2:n-1) = 6 * dq(3,2:n-1) ;
	switch type
	case 'D1'
	    A(1,2) = 1 ;
	    A(2,1) = u(2) ;
	    A(n-1,n) = v(n-1) ;
	    A(n,n-1) = 1 ;
	    b(1) = 6 * dq(3,1);
	    b(n) = 6 * dq(3,n);
	case 'D2'
	    A(1,1) = 1 ;
	    A(n,n) = 1 ;
	    b(1) = dd(1);
	    b(2) = 6 * dq(3,2) - u(2) * dd(1);
	    b(n-1) = 6 * dq(3,n-1) - v(n-1) * dd(2);
	    b(n) = dd(2);
	case 'P'
	    A(1,2) = A(1,2) + v(n) ;
	    A(1,n-1) = A(1,n-1) + u(n) ;
        A(2,1) = u(2) ;
        A(n-1,n) = v(n-1) ;
	    A(n,2) = A(n,2) + v(n) ;
	    A(n,n-1) = A(n,n-1) + u(n) ;
	    b(1) = 6 * dq(3,1);
	    b(n) = 6 * dq(3,n);
	end
    b = reshape ( b , n , 1 );
M = A \ b ;
