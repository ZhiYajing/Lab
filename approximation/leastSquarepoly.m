%%%%%%%%%%%%Question1
X1=[0.0 0.25 0.5 0.75 1.0];
Y1=[1.0 1.284 1.6487 2.117 2.7183];
P1=polyfit(X1,Y1,1)
P2=polyfit(X1,Y1,2)

%%%%%%%%%%%%%%%%Question2
n=1;
n=2;
n=3;
n=4;
X=[0 0.15 0.31 0.5 0.6 0.75];
Y=[1 1.004 1.031 1.117 1.223 1.422];
P=polyfit(X,Y,n);
F=polyval(P,X);
x=[0:0.0000001:0.75];
f=polyval(P,x);
 plot(x,f,'k','linewidth',1);
 hold on
 plot(X,Y,'*k')
title('Least-square polynomials')
s1 = sprintf('Least-square, n=%d',n);
legend(s1,'Data point','Location','northwest')
%xlim([0 0.75])
hold off 
sum((Y-F).*(Y-F))
P
%%%%%%%%%%%%%%%%%%Question 3
a=-pi;b=pi;m=4;n=3;
h = (b-a)/m/2; x = a:h:b; y = exp(x).*cos(2*x);
%%%%%%%%%%%%%%%%%%Question 4
a=-pi;b=pi;m=32;
y([1:16],1)=1;y([33:48],1)=1;y([17:32],1)=-1;y([49:64],1)=-1;
[A,B]=trifit(a,b,m,4,y)
[A,B]=trifit(a,b,m,8,y)
[A,B]=trifit(a,b,m,16,y)
[A,B]=trifit(a,b,m,32,y)

