clc
close all
clear variables

a = 1;
omega = 1;
R = 100;
C = .02;
q0 = 5;
t0 = 0;
tspan = linspace(0,50);

V = @(t) a*sin(omega*t);
dq1 =  @(t,q) (a*sin(omega*t)-q/C)/R;
[t,q]=ode45(dq1,tspan, q0);
plot(t,q);
hold on
dq2 = @(V,q) (V-q/C)/R;
[t,q] = ode45(dq2,tspan,q0);
plot(t,q);
dq3 = @(t,q) dq2(0,q);
[t,q] = ode45(dq3,tspan,q0);
plot(t,q);
[t,q] = ode45(dq4(q,R,C),tspan,q0);
plot(t,q);
function dq = dq4(q,R,C)
    dq =@(t,q) -q/(R*C);
end





