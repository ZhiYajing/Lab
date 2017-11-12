function s=newexp(x,tol)
for j=1:500
    if (abs(x/2^j) <=1)
        m=j;
        break;
    end
end
s1=ExpUnstable(x/2^m,tol);
z=s1;
s=z^(2^m);