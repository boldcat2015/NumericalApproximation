% 第一章 习题 1
A0=[0.557, 0.402;0.457, 0.331];
b0=[0.959;0.788];

for k=1:6
    disp(sprintf('%d位有效数字计算结果',k));
    A=A0;
    b=b0;
    %使用高斯消去法求解方程组
    t1=sheru(A(2,1)/A(1,1),k);
    A(2,2)=sheru(A(2,2)-sheru(A(1,2)*t1,k),k);
    b(2)=sheru(b(2)-sheru(b(1)*t1,k),k);

    b(2)=sheru(b(2)/A(2,2),k);
    b(1)=sheru(b(1)-sheru(A(1,2)*b(2),k),k);
    b(1)=sheru(b(1)/A(1,1),k);
    disp(b);
    disp(sprintf('%d位有效数字计算相对误差',k));
    disp(b - [1;1]);
end;

