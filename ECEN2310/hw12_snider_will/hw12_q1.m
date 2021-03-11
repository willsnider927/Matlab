clc
close all
clear variables

f = 2;
phi = pi/3;
a = 1;
omega = 2*pi*f;

v1 = @(t) (a/2)*exp(1i*(omega*t+phi));
v2 = @(t) (a/2)*exp(-1i*(omega*t+phi));
y = @(t) v1(t) + v2(t);

plot([0 v1(0)]);
hold on
plot([0 v2(0)]);
plot(real([0 y(0)]), imag([0 y(0)]),'k');
xlabel('real');
ylabel('imaginary');

figure
for t = 0:0.01:2
    hold off
    plot([0 v1(t)]);
    hold on
    plot([0 v2(t)]);
    plot(real([0 y(t)]), imag([0 y(t)]),'k');
    xlabel('real');
    ylabel('imaginary');
    axis([-1 1 -1 1]);
    pause(0.1);
end
hold off
figure 
t = 0:.01:2;
subplot(2,1,1)
plot(t, real(y(t)));
title('real');
subplot(2,1,2)
plot(t, imag(y(t)));
title('imaginary');

