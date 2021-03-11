clc
close all
clear variables

a = 10; b = 28; c = 8/3;
x0 = [1;1;1];
tspan = [0 50];

for i = 1:5
    y = @(t,x) Lorentz(x,a,b,c);
    delta_x =  2e-3*rand(3,1) - 1e-3;
    X0 = x0 + delta_x
    [t,x] = ode45(y,tspan,X0);
    plot3(x(:,1),x(:,2),x(:,3));
    hold on
    plot3(x(end,1),x(end,2),x(end,3),'k*','LineWidth',2);
    grid on;
end

function dx = Lorentz(x,a,b,c)
 dx=[a*(x(2)-x(1));x(1)*(b-x(3))-x(2);x(1)*x(2)-c*x(3)];
end