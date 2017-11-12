function y=pi1(e)
s=sqrt(3)/2;A=3*s;n=6;
while s>e
    s=sqrt((1-sqrt(1-s*s))./2);
    n=2*n;A=n*s./2;
    z=[n,A,A-pi,s];
    fprintf('%10d %20.15f %20.15f %20.15f \n',z(1),z(2),z(3),z(4));
end
