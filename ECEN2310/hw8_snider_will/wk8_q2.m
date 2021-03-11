clc
close all
clear variables

P_0 = 120;
a_P = .0003;
a_N = .0007;

P = @(q) P_0 - a_P*q.^2;
N = @(q) a_N*q.^2;

q = linspace(0,500);

plot(q,P(q),q,N(q));
hold on

x = fsolve(@(q)P(q)-N(q),1);

plot(x,P(x),'kd');
