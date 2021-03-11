clc
close all
clear variables

r_1 = 11;
r_2 = 2;

x = @(t) (r_1+r_2)*cos(t)-r_2*cos(((r_1/r_2)+1)*t);
y = @(t) (r_1+r_2)*sin(t)-r_2*sin(((r_1/r_2)+1)*t);
t = linspace(0,4*pi,500);

plot(x(t),y(t));