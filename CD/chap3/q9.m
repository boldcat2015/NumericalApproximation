p = [4222.21, 5629.61, 7037.01, 8444.42, 9851.82, 11259.22, 12666.63];
v = [1310.97, 1133.98, 983.22, 852.13, 737.42, 632.54, 532.58];
figure;
hold on;

M1 = myspline3 ( v , p , 'D2' , [0 0])
xx1 = linspace ( v(1) , v(7) , 10000 );
yy1 = splineval ( v , p , 'D2' , M1 , xx1 );
plot(xx1 , yy1, 'r');

M2 = myspline3 ( p , v , 'D2' , [0 0])
xx2 = linspace ( p(1) , p(7) , 10000 );
yy2 = splineval ( p , v , 'D2' , M2 , xx2 );
plot(yy2 , xx2, 'b');

legend('P(V)', 'V(P)', 'location', 'south');

P = splineval ( v , p , 'D2' , M1 , 1065.16 )
V = splineval ( p , v , 'D2' , M2 , P )
