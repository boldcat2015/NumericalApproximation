clear;
close all;
clc;

A(1)=log(11/10);
for i=1:1000
    A(i+1)=1/i-10*A(i);
end;
A=A';
disp([A(1:5:201)]);
