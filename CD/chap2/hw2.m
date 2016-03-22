function [ ] = hw2 ( )
% Plot interpolate polynomial with nodes = 1 : 20 on one graph
% 2015.09.29 Andy
figure;
for i = 200 : 1000
    xx = [ 0 : 1 / i * 2 * pi : 2 * pi ];
    yy = sin ( xx );
    plot ( xx , polyval ( myNewtonIpF ( xx , yy ) , xx ));
    hold on;
end
end
