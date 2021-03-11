clc
close all
clear variables

f = 1;
dt = .1;

v = @(t) exp(1i*(2*pi*f*t));
w = @(t) exp(1i*(2*pi*f*(t-dt)));
for k = 1:20
    c{k} = @(t) w(t+(k*dt/20));
end

plot(real([0 v(0)]),imag([0 v(0)]),'k');
hold on
plot(real([0 w(0)]),imag([0 w(0)]),'--k');
for k = 1:20
    plot(c{k}(0),'*k');
end
axis([-1 1 -1 1]);
xlabel('real');
ylabel('imaginary');

figure
for f = 1:.5:10
v = @(t) exp(1i*(2*pi*f*t));
w = @(t) exp(1i*(2*pi*f*(t-dt)));
for k = 1:20
    c{k} = @(t) w(t+(k*dt/20));
end
 for t = 0:0.01:2
    hold off
    plot(real([0 v(t)]),imag([0 v(t)]),'k');
    hold on
    plot(real([0 w(t)]),imag([0 w(t)]),'--k');
    for k = 1:20
        plot(c{k}(t),'*k');
    end
    axis([-1 1 -1 1]);
    xlabel('real');
    ylabel('imaginary');
    pause(0.1);
 end
end

f = 8;
v1 = @(t) cos(2*pi*f*t);
v2 = @(t) cos(2*pi*(f/1/dt)*t);
t1 = 0:dt/100:2;
t2 = 0:dt:2;

subplot(2,2,1);
plot(t1, v1(t1),'--');
title('v1(t1)');
subplot(2,2,2);
plot(t1, v2(t1));
title('v2(t1)');
subplot(2,2,3);
plot(t2, v1(t2),'ob');
title('v1(t2)');
subplot(2,2,4);
plot(t2, v2(t2),'*r');
title('v2(t2)');
