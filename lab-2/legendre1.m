function y=legendre1(n)
syms x f(x);
if n == 0 
    f(x)= 1;
elseif n == 1
    f(x) = x;
else
    f(x) = ((2*(n-1)+1) * x * legendre1(n-1) - ((n-1) * legendre1(n-2)))/(n);
end
y=f(x);
end

