clc
close all
clear variables

x = [1 0 0];
y = [0 1 0];
z = [0 0 1];

figure1 = plot3([0 x(1)],[0 x(2)],[0 x(3)], 'r', [0 y(1)],[0 y(2)],[0 y(3)], 'g', [0 z(1)],[0 z(2)],[0 z(3)], 'b'); 
set(figure1,'LineWidth',2)
axis([-1 1 -1 1 -1 1])
hold on
grid on

w = 0.5*[1;1;1];
plot(w,'LineWidth',2)
for th = linspace(0, 4*pi/3,30)
    rx = [1 0 0
        0 cos(th) -sin(th)
        0 sin(th) cos(th)];
    w1 = rx * w;
    if (th ~= 4*pi/3) 
       plot3([0 w1(1)],[0 w1(2)],[0 w1(3)],'r');
    else 
       plot3([0 w1(1)],[0 w1(2)],[0 w1(3)],'m','LineWidth',2);
    end
end
for th1 = linspace(0, 5*pi/4,40)
    ry = [cos(th1) 0 sin(th1)
        0 1 0
        -sin(th1) 0 cos(th1)];
    w2 = ry * w1;
    if (th1 ~= 5*pi/4) 
       plot3([0 w2(1)],[0 w2(2)],[0 w2(3)],'g');
    else 
       plot3([0 w2(1)],[0 w2(2)],[0 w2(3)],'c','LineWidth',2);
    end
end
for th2 = linspace(0, pi,20)
    rz = [cos(th2) -sin(th2) 0
        sin(th2) cos(th2) 0
        0 0 1];
    w3 = rz * w2;
    if (th2 ~= pi) 
       plot3([0 w3(1)],[0 w3(2)],[0 w3(3)],'b');
    else 
       plot3([0 w3(1)],[0 w3(2)],[0 w3(3)],'k','LineWidth',2);
    end
end
ru = rz * ry * rx;
u = ru * w;
plot3([0 u(1)],[0 u(2)], [0 u(3)],'--y', 'LineWidth',2)

re = rx * ry * rz;
e = re * w;
plot3([0 e(1)],[0 e(2)], [0 e(3)],'--k', 'LineWidth',2)

