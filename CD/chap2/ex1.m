% 第二章 习题1
% 2015.09.26 程雨歌

x = [0.001 : 0.001 : 0.005];
sinx = [0.0010000 : 0.0010000 : 0.0050000];
cosx = [1.000000 0.999998 0.999996 0.999992 0.999988];
cotx = [1000.000 499.999 333.332 249.999 199.998];

c = cot(0.0015);
byCot = myNewtonip ( x , cotx , 0.0015 )
disp ( '相对误差 =' );
disp ( sprintf ( '%e' , ( byCot - c ) / c ));

bySinCos = myNewtonip ( x , cosx , 0.0015 ) / myNewtonip ( x , sinx , 0.0015 )
disp ( '相对误差 =' );
disp ( sprintf ( '%e' , ( bySinCos - c ) / c ));
