clc
close all
clear variables

a = 3;
b = 40;
c = 200;

f = @(x) a*x.^2 + b*x;

figure
fplot(f,[-20 20]);
hold on

x_min = fminsearch(f,0);
plot(x_min,f(x_min),'r*');
hold off

figure
g = @(x) f(x) + c*sin(x/2);
fplot(g,[-20 20]);
hold on

guess = -20 + 40.*rand(5,1);

for i = 1:5
    g_min = fminsearch(g,guess(i,1));
    plot(guess(i,1),g(guess(i,1)),'ro');
    plot(g_min,g(g_min),'b*');
    if guess(i,1) < g_min
        fplot(g,[guess(i,1) g_min],'--k');
    else
        fplot(g,[g_min guess(i,1)],'--k');
    end
end
