function [ ] = hw1 ( )
% Plot interpolate polynomial with nodes = 1 : 20 on one graph
% 2015.09.29 Andy
figure;
for i = 1 : 20
    xx = [ 0 : 1/i : 1 ];
    yy = 1 ./ ( 1 + 25 * xx .^ 2 );
    plot ( xx , polyval ( myNewtonIpF ( xx , yy ) , xx ) );
    hold on;
end
end
