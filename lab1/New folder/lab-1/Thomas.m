function [x,a,c]=Thomas(c,a,b,x)
% THOMAS Solves a tridiagonal linear system
%   [x,a,c]=Thomas(c,a,b,x) solves the linear system with a
%   tridiagonal matrix A=diag(c,-1)+diag(a)+diag(b,1). The right hand
%   side x is overwritten with the solution. The LU-decomposition is
%   computed with no pivoting resulting in L=eye+diag(c,-1),
%   U=diag(a)+diag(b,1).

n=length(a);
for k=1:n-1                         % LU-decomposition with no pivoting
  c(k)=c(k)/a(k);
  a(k+1)=a(k+1)-c(k)*b(k);
end
for k=2:n                           % forward substitution 
  x(k)=x(k)-c(k-1)*x(k-1);
end
x(n)=x(n)/a(n);                     % backward substitution 
for k=n-1:-1:1
  x(k)=(x(k)-b(k)*x(k+1))/a(k);
end