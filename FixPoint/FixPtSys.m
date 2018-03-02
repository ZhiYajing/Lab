function x = FixPtSys(G, x0,tol,maxIt)
disp(G);
fprintf('iter \t\t x1 \t\t x2 \t\t\t x3 \t\t\t Residual\n %d \t %12.4e \t %12.4e \t %12.4e \n',0,x0);
    y=feval(G,x0);
   xnew = y';
   dif = norm(xnew -x0);
   if dif < tol
   x=xnew; return;
   else
       xold = xnew;
   end
   fprintf('%d \t %12.4e \t %12.4e \t %12.4e \t %12.4e\n',1,xnew,dif);
   iter = 2;
   while (iter <= maxIt)
       y= feval(G, xold); xnew = y'; dif = norm(xnew-xold);
       fprintf('%d \t %12.4e \t %12.4e \t %12.4e \t %12.4e\n',iter,xnew,dif);
       if dif < tol
           x=xnew;
           disp('Converge'); return;
       else
           xold = xnew;
       end
       iter = iter+1;
   end;
   disp('diverge');
 G=inline('[2-0.5*x(2)-0.5*x(3);2-0.5*x(1)-0.5*x(3);sqrt(x(3)/(x(1)*x(2)))]');
x0=[0.8,0.8,0.8];
 kmax=100;
 tol=10^(-4);