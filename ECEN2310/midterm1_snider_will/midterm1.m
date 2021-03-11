clc
close all
clear variables

[n,m] = sys_dyn(.02);
N = 150;
R = 1;
x0 = [-3.7;0;0;0;0];
z = zeros((n+m)*N,1);
Q = eye(n);

tol = 0.1;
O = zeros(n*N);
iter = 0;
imax = 10;
r = 1;
B = zeros(1650,1);
C = zeros(1650,1);
dz = sym('dz_%d', [1650,1]);
while (abs(r) > tol) && (iter < imax)
    [H,h,E,e] = gen_QP(z,Q,R,x0,n,m,N);
    A = [H transpose(E);E O];
    B = -1.*[h;e];
    X = (B.'/A).';
    dz = X(1:(n+m)*N,1);
    z = z + dz;
    lambda = X((n+m)*N+1:end);
    r = [H*z + transpose(E)*lambda;e].'*[H*z + transpose(E)*lambda;e];
    iter = iter +1;
end
    th = 1:150;
    subplot(3,2,1);
    plot(th,z(5*(th-1)+1));
    title('subplot1: y(t)')
    
    subplot(3,2,2);
    plot(th,z(5*(th-1)+2));
    title('subplot2: v(t)')
    
    subplot(3,2,3);
    plot(th,z(5*(th-1)+3));
    title('subplot3: yaw(t)')
    
    subplot(3,2,4);
    plot(th,z(5*(th-1)+4));
    title('subplot4: omega(t)')
    
    subplot(3,2,5);
    plot(th,z(5*(th-1)+5));
    title('subplot5: steeringAngle(t)')

    subplot(3,2,6);
    plot(th,z(750+th));
    title('subplot6: u(t)')
    
