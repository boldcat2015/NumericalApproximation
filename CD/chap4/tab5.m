clear;
close all;
clc;

A=[39, 567, 10000, 2, 0.2; ...
    37, 679, 0, 3, 0.15;...
    30, 346, 5000,3,0.1;...
    25, 987, 5000,3,0.08;...
    25, 1101, 0, 4,0.07;...
    10, 1004, 5000,5,0.07;...
    15,667,0,4,0.05;...
    5,604,10000,6,0.04];
y=[75;68;105;136;152;191;148;234];
c=A\y