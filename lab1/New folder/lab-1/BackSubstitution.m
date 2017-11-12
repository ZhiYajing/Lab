function x=BackSubstitution(U,b)
% BACKSUBSTITUTION  solves by backsubstitution a linear system 
%   x=BackSubstitution(U,b) solves Ux=b, U upper triangular by
%   backsubstitution

n=length(b);
for k=n:-1:1
  s=b(k);
  for j=k+1:n
    s=s-U(k,j)*x(j);
  end 
  x(k)=s/U(k,k);
end 
x=x(:);