function [ ft ] = hisft ( x , y , n , varargin )
% Fourier fit on y(x) to degree n
% input: x , y , n
% output: [ ft ]
% 2015.11.09 

%% validating input
if nargin < 2
    error ( 'Too few input.' );
end
l = length ( x );
if l ~= length ( y )
    error ( 'Input length not compatible.' );
end
if nargin < 3
    n = 100 ;
    disp('degree set to 10 by default.');
end
xData = x(:);
yData = y(:);

% Set up fittype and options.
fty = fittype( ['fourier',num2str(n)'] );
opts = fitoptions( fty );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, fty, opts );

% Fitted result:
ft = fitresult(xData);

end
