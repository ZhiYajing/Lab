function x = NewtonSys(F,J,x0,tol, kmax)
xold=x0;
disp(F);
disp(J);
fprintf('iter \t\t x1 \t\t x2 \t\t\t x3 \t\t\t Residual\n %d \t %12.4e \t %12.4e \t %12.4e \n',0,x0);
iter=1;
while(iter <= kmax)
    y = -feval(J,xold) \ feval(F,xold);
    xnew = xold+y';
    dif = norm(xnew-xold);
    fprintf('%d \t %12.4e \t %12.4e \t %12.4e \t %12.4e\n',iter,xnew,dif);
    if(dif < tol)
        x=xnew;
        disp('Converge'); return;
    else
        xold = xnew;
    end
    iter = iter+1;
end;
disp('diverge');
% F=inline('[2*x(1)+x(2)+x(3)-4;x(1)+2*x(2)+x(3)-4;x(1)*x(2)*x(3)-1]');
% J=inline('[2,1,1;1,2,1;x(2)*x(3),x(1)*x(3),x(1)*x(2)]');
% x0=[0.8,0.8,0.8];
% kmax=100;
% tol=10^(-9);
