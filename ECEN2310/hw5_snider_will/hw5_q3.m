clc
close all
clear variables

R = [90 30 100 15 20 20 60];
W = [200 250 120 200];
G = 1./R;
A = [G(1)+G(2)+G(3) -G(2) 0
    -G(2) G(2)+G(3)+G(5) -G(3)-G(5)
    0 -G(3)-G(5) G(3)+G(5)+G(6)+G(7)];
b = [G(1)*W(1)-G(2)*W(2)
    G(2)*W(2)-G(3)*W(3)
    G(3)*W(3)-G(7)*W(4)];
x = A\b