function e = mechanism(th,x,L)
    e = [L(1,:)*cos(th)+L(2,:)*cos(x(1,:))-L(3,:)*cos(x(2,:))-L(4,:);
        L(1,:)*sin(th)+L(2,:)*sin(x(1,:))-L(3,:)*sin(x(2,:));
        L(3,:)*cos(x(2,:))+L(5,:)*cos(x(3,:))-L(6,:)*cos(x(4,:))-L(7,:);
        L(3,:)*sin(x(2,:))+L(5,:)*sin(x(3,:))-L(6,:)*sin(x(4,:))];
end

