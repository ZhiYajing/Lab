function [x,t]=Elimination(A,b)
% ELIMINATION solves a linear system by Gaussian elimination
%   x=Elimination(A,b) solves the linear system Ax=b using Gaussian
%   Elimination with partial pivoting. Uses the function
%   BackSubstitution
t=cputime;
n=length(b);
norma=norm(A,1);
A=[A,b];                                    % augmented matrix
for i=1:n
  [maximum,kmax]=max(abs(A(i:n,i)));        % look for Pivot A(kmax,i)
  kmax=kmax+i-1;
  if maximum < 1e-14*norma;                 % only small pivots
    error('matrix is singular')
  end
  if i ~= kmax                              % interchange rows
    h=A(kmax,:); A(kmax,:)=A(i,:); A(i,:)=h;
  end
  A(i+1:n,i)=A(i+1:n,i)/A(i,i);             % elimination step 
  A(i+1:n,i+1:n+1)=A(i+1:n,i+1:n+1)-A(i+1:n,i)*A(i,i+1:n+1);
end
x=BackSubstitution(A,A(:,n+1));
t=cputime-t;