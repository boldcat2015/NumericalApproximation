function [ ans ] = testnargin ( x , y , z , varargin )
% return number of entries
ans = 3 ;
if nargin < 3
    ans = 2 ;
    if nargin < 2
        ans = 1 ;
        if nargin < 1
            ans = 0 ;
        end
    end
end
