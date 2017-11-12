function d=DetLaplace(A)
% DETLAPLACE determinant using Laplace expansion
%   d=DetLaplace(A); computes the determinant d of the matrix A
%   using the Laplace expansion for the first row. 

n=length(A);
if n==1;
  d=A(1,1);
else
  d=0; v=1;
  for j=1:n
    M1j=[A(2:n,1:j-1) A(2:n,j+1:n)];
    d=d+v*A(1,j)*DetLaplace(M1j);
    v=-v;
  end
end