% 第二章 习题4
% 2015.09.26 程雨歌

x = [0 1 -1]
fx = [1 3 1/3]

Lagrange = myLagrangeip ( x , fx )
Neville = myNevilleip ( x , fx )
Newton = myNewtonip ( x , fx )
Lagrange = myLagrangeip ( x , fx , 1/3 )
Neville = myNevilleip ( x , fx , 1/3 )
Newton = myNewtonip ( x , fx , 1/3 )
