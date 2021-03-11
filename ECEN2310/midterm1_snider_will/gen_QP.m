function [H,h,E,e] = gen_QP(z,Q,R,x0,n,m,N)
      if ~ge(N,1)
          error("error, N must be scalar >=1");
      end
%       if size(z,[1,2]) ~= [(n+m)*N,1]
%           error("error, z must be (n+m)*N x 1 matrix");
%       end
      %extract x,u
      X=reshape(z(1:(n*N)),[n, N]);
      U=reshape(z(n*N+1:end),[m,N]);
      %submatrices
      E1 = eye(n*N);
      E2 = zeros(n*N,m*N);
      e = zeros(n*N,1);
%       populate matrices
      e(1:n,1)=X(:,1)-1.*f(x0,U(:,1));          
      E2(1:n,1:m) = -1.*B(x0,U(:,1));
      U(:,1) = [];
      for k = 1:N-1
          Ak = -1.*A(X(:,k), U(:,1));
          E1(k*n+1:k*n+n,(k-1)*n+1:(k-1)*n+n) = Ak;
          Jk = zeros(N);
          Jk(k+1,k+1) = 1;
          Bk = -1.*B(X(:,k),U(:,1));
          E2 = E2 + kron(Jk,Bk);
          e((1:n)+(k*n),1) = X(:,k+1) - f(X(:,k), U(:,1));
          U(:,1) = [];
      end
      
       E = [E1 E2];
       H1 = eye(N);
       H2 = kron(H1,R);
       H1 = kron(H1,Q);
       H = blkdiag(H1,H2);
       h = H*z;
end

