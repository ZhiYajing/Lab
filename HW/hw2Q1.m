function hw2Q1
%
%%%%%%%%%%%%%%%%%%%%% xi yi wi zi function declaration
%
xi=inline('-5+(10*(x-1)/n)'); %when call argnames(xi) it will shows arg are x, n
%so when evaluate value for xi need to
%arguments xi(n,x)
wj=inline('5*cos((2*(w-1)-1)*pi/2/n)','n','w'); %Chebyshev node
yi=inline('1/(1+(x^2))');
zj=inline('1/(1+(w^2))');
%
%%%%%%%%%%%%%% plot Runge Function
%
for numPoint=3:2:9
    subplot(2,2,(numPoint-1)/2)
    numX=1000;           %the maximum point for drawing runge function curve
    for i=1:numX        %to draw curve for runge function with 1000 points
        xValue(i)=xi(numX-1,i);
        yValue(i)=yi(xValue(i));
    end
    plot(xValue,yValue,'r','linewidth',1)   %original runge function
    hold on
    %%%%%%%%%%%%%% polynomial with equivalent nodes
    xValue=0; yValue=0;
    n=2*numPoint-1;   %starting from 2 points
    
    f=0; xValue=0; yValue=0;
    for i=1:n
        xValue(i)=xi(n-1,i);    %where n-1 is for xi(n) and i for xi(x)
        yValue(i)=yi(xValue(i));
    end
    p=polyfit(xValue,yValue,n-1);
    x=[-5:0.00001:5];
    f=polyval(p,x);
    plot(x,f,':k','linewidth',1)
    hold on
    %%%%%%%%%%%%%% polynomial with chebyshev nodes
    g=0; wValue=0; zValue=0;
    for j=1:n
        wValue(j)=wj(n-1,j);    %where n i are for wi(n)
        %disp( wValue(j))
        zValue(j)=zj(wValue(j));
    end
    pc=polyfit(wValue,zValue,n-1);
    w=[-5:0.00001:5];
    g=polyval(pc,w);
    plot(w,g,'--b','linewidth',1)
    title(['Order' ,num2str(n-1) ])
    legend('Original','Equivalent','Chebyshev','Location','south')
  %legend('Original','Chebyshev','Location','south')
    hold off
end


