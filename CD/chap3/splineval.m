function [ yy ] = splineval ( x , fx , type , M , xx )
% evaluate values yy of xx, due to x, values on nodes fx, and 2-order derivitives M
% input: x fx type M xx
% output: yy
% 2015.10.21 Andy

%% validating input
	n = length ( x );
	if n ~= length (fx) | n ~= length (M)
	    error ( 'Input not compatible.' );
	end
    if n ~= length ( unique ( x ))
        error ( 'Repeated nodes.' );
    end
	if x ~= sort ( x , 'ascend' ) | x ~= sort ( x , 'descend' )
	    error ( 'Nodes must be increasing or decreasing.' );
	end
%% Determine which spline xx is in.
l = length (xx);
c = ones (1 , l);
for i = 1 : l - 1
    if xx(i) > x(c(i)+1) & x(1) < x(2)
        c(i:l) = c(i:l) + 1;
    end
    if xx(i) < x(c(i)+1) & x(1) > x(2)
        c(i:l) = c(i:l) + 1;
    end
end
if type == 'P'
    fx(n) = fx(1) ;
end
% evaluate yy = s(c(i))(xx) according to (3.9)
for i = 1 : l
    yy(i) = fx(c(i)) ;
    yy(i) = yy(i) + (fx(c(i)+1) - fx(c(i))) / (x(c(i)+1) - x(c(i))) * (xx(i) - x(c(i))) ;
    yy(i) = yy(i) - (1/6 * M(c(i)+1) + 1/3 * M(c(i))) * (x(c(i)+1) - x(c(i))) * (xx(i) - x(c(i))) ;
    yy(i) = yy(i) + (M(c(i)) / 2) * (xx(i) - x(c(i))) * (xx(i) - x(c(i))) ;
    yy(i) = yy(i) + 1/6 * (M(c(i)+1) - M(c(i))) / (x(c(i)+1) - x(c(i))) * (xx(i) - x(c(i))) * (xx(i) - x(c(i))) * (xx(i) - x(c(i))) ;
end
end
