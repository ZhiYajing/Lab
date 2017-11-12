function [x,t]=cramerRule(A,b)
% CRAMER solves a linear Sytem with Cramer's rule
%   x=Cramer(A,b); Solves the linear system Ax=b using Cramer's
%   rule. The determinants are computed using the function DetLaplace.
t=cputime;
n=length(b);
detA=DetLaplace(A);
for i=1:n
  AI=[A(:,1:i-1), b, A(:,i+1:n)];
  x(i)=DetLaplace(AI)/detA;
end
x = x(:);
t=cputime-t;