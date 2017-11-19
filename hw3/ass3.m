%%%%%%%%%%%%%%%%Q2
x=0;
n=0;
upbd=1;
f=0;
a=0;
while abs(upbd)>eps
    xold=x;
    x=x-2/3/exp(0.5)*(x*exp(x)-1);
    upbd=xold-x;
    n=n+1;
    a(n)=n;
   % f(n)=double(int8(n));
    f(n)=x;
end
a=a(:);
f=f(:);y=[a f];
%%%%%%%%%%%%%%%%%%%%%
%Q4
x=0;
n=0;
upbd=1;
f=0;
a=0;
while abs(upbd)>eps
    xold=x;
    x=x+0.5-ff(x);
    upbd=xold-x;
    n=n+1;
    a(n)=n;
   % f(n)=double(int8(n));
    f(n)=x;
end
a=a(:);
f=f(:);y=[a f];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=1;
n=0;
upbd=1;
f=0;
a=0;
while abs(upbd)>eps
    xold=x;
    x=1+1/sqrt(x);
    upbd=xold-x;
    n=n+1;
    a(n)=n;
   % f(n)=double(int8(n));
    f(n)=x;
end
a=a(:);
f=f(:);y=[a f];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%