function x=Broyden(F,J,x0,tol,kmax)
% F=inline('[2*x(1)+x(2)+x(3)-4;x(1)+2*x(2)+x(3)-4;x(1)*x(2)*x(3)-1]');
% x0=[0.8,0.8,0.8];
% kmax=100;
% tol=10^(-9);
%J=inline('[2,1,1;1,2,1;x(2)*x(3),x(1)*x(3),x(1)*x(2)]');
disp(F);
y0 = F(x0);
A=J(x0);
B=inv(A);
xn=x0 - (B*y0)';
yn=F(xn);
fprintf('iter \t\t x1 \t\t x2 \t\t\t x3 \t\t\t Residual\n %d \t %12.4e \t %12.4e \t %12.4e \n',0,x0);
%x = [0.5  xn'];disp(x);
iter=1;
while(iter < kmax)
    s=xn-x0;
    d=yn-y0;
    Bn=B+(s'-B*d)*s*B/(s*B*d);
    xnew=xn-(Bn*yn)';
    dif=norm(s);
    fprintf('%d \t %12.4e \t %12.4e \t %12.4e \t %12.4e\n',iter,xnew',dif);

    if dif<tol
        x=xnew;
        disp('converge');
        return;
    else
    x0=xn;xn=xnew;y0=yn;yn=F(xnew);
    end
    iter = iter+1;
end
disp('diverge');
