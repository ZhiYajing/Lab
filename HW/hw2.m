function runge1
%
%%%%%%%%%%%%%%%%%% xi and yi function declaration
%
xi=inline('5*cos((2*x-1)*pi/2/n)','n','x');
yi=inline('1/(1+(x^2))');


%
%%%%%%%%%%%%%% plot Runge Function
%

numX=1000;           
for i=1:numX       
        xValue(i)=xi(numX-1,i);
        yValue(i)=yi(xValue(i));
end
plot(xValue,yValue,'r','linewidth',1)
hold on 
xValue=0; yValue=0;

%
%%%%%%%%%%%%%% polynomial fitting interpolating
%
for numPoint=3:2:9
    n=2*numPoint-1;   
    f=0; xValue=0; yValue=0;
    for i=1:n
        xValue(i)=xi(n,i);    
        yValue(i)=yi(xValue(i));
    end
    p=polyfit(xValue,yValue,n-1);
    x=[-5:0.00001:5];
    f=polyval(p,x);
   
    switch(numPoint)
        case 3  %4th-order interpolating polynomial
            plot(x,f,'-.k','linewidth',1)
            continue
        case 5  %8th-order interpolating polynomial
            plot(x,f,':k','linewidth',1) 
            continue
         case 9  %16th-order interpolating polynomial
            plot(x,f,'--k','linewidth',1) 
            continue
    end
end
 %grid on
% axis([-5 5 -0.2 1]);
 legend('Original','4-th','8-th','16-th','Location','best')
hold off