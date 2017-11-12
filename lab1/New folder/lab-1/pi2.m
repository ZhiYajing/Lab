function y=pi2
s=sqrt(3)./2;newA=3*s;n=6;oldA=0;
while newA>oldA
    oldA=newA;
    s=s./sqrt(2*(1+sqrt(1-s^2)));
    n=2*n;newA=n*s./2;
    z=[n,newA,newA-pi,s];
    fprintf('%10d %20.15f %20.15f %20.15f \n',z(1),z(2),z(3),z(4));  
end
y=z(2);    