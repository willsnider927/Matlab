clc 
close all
clear variables

g = 9.81; m = 30; L = 2.5; mu = 7;

[theta,dtheta] = meshgrid(linspace(-pi,pi,101), linspace(-2*sqrt(g/L),2*sqrt(g/L),101));
E = m*g*L*(1-cos(theta)) + 1/2*m*L^2*dtheta.^2;
contour(theta,dtheta,E,20);
hold on
contour(theta,dtheta,E,[2*m*g*L 2*m*g*L],'k--');
min = find(E == min(E,[],'all'));
plot(theta(min),dtheta(min),'k*')
legend('contours of E','E = 2mgL','Minimum E')
set(0,'DefaultLegendAutoUpdate', 'off')
x0 = [0.99*pi; 0];
tSpan = [0 60];
u = @(t) 0;
options = odeset('RelTol',1e-3);
[~,x] = ode45(@(t,x) pendulum(x,u(t),m,g,L,mu),tSpan,x0,options);
comet(x(:,1),x(:,2),0.99)
x0 = [x(end,1); x(end,2)];
u = @(t) sin(sqrt(g/L)*t);
[~,x] = ode45(@(t,x) pendulum(x,u(t),m,g,L,mu),tSpan,x0,options);
comet(x(:,1),x(:,2),0.99)

function dx = pendulum(x,u,m,g,L,mu)
    dx = zeros(2,1);
    dx(1) = x(2);
    dx(2) = 1/m/L^2*(-m*g*L*sin(x(1)) - mu*L^2*abs(x(2))*x(2) + u);
end