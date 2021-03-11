clc
close all
clear variables

th = 4*pi/6;
L = [3;25;4;24;26;6;24];
x0 = [0;-pi/2;0;-pi/2];
D = [25 25];

x = fsolve(@(x) mechanism(th,x,L),x0);

p1 = [0;0];
p2 = p1 + L(1)*[cos(th);sin(th)];
p3 = p2 + L(2)*[cos(x(1));sin(x(1))];
p4 = p3 - L(3)*[cos(x(2));sin(x(2))];
p5 = p3 + L(5)*[cos(x(3));sin(x(3))];
p6 = p5 - L(6)*[cos(x(4));sin(x(4))];
P = [p1 p2 p3 p4 p5 p6];

r2 = p4 - D(1)*[cos(x(2));sin(x(2))];
s2 = p6 - D(2)*[cos(x(4));sin(x(4))];
R = [p4 r2];
S = [p6 s2];

plot(P(1,:),P(2,:),'-o',R(1,:),R(2,:),'k',S(1,:),S(2,:),'k');
axis([-10 60 -10 60]);

x = x0;
figure
for theta = linspace(pi/2,130*pi/2,1500)
    x = fsolve(@(x) mechanism(theta,x,L),x);
    
    p1 = [0;0];
    p2 = p1 + L(1)*[cos(th);sin(th)];
    p3 = p2 + L(2)*[cos(x(1));sin(x(1))];
    p4 = p3 - L(3)*[cos(x(2));sin(x(2))];
    p5 = p3 + L(5)*[cos(x(3));sin(x(3))];
    p6 = p5 - L(6)*[cos(x(4));sin(x(4))];
    P = [p1 p2 p3 p4 p5 p6];

    r2 = p4 - D(1)*[cos(x(2));sin(x(2))];
    s2 = p6 - D(2)*[cos(x(4));sin(x(4))];
    R = [p4 r2];
    S = [p6 s2];

    plot(P(1,:),P(2,:),'-o',R(1,:),R(2,:),'k',S(1,:),S(2,:),'k');
    axis([-10 60 -10 60]);
    pause(.05);
end

