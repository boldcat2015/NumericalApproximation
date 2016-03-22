clear;
close all;
clc;

A(1001)=-1.e20;
for i=1000:-1:1
    A(i)=(1/i-A(i+1))/10;
end;
A=A';
sprintf('%.20g' , A(1));
