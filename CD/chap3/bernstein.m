function [ b ] = bernstein ( k , n , t )
% compute bernstein term Bk,n(t)
% input : k , n , t
% 2015.10.25 Andy

l = prod ( size ( t ));
for i = 1 : l
    if t(i) < 0 | t(i) > 1
        error ( 't must be in [0,1].' );
    end
end

b = nchoosek ( n , k ) .* t .^ k .* (1 - t).^(n - k);
