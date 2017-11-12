function  f=SymmetricMatrix2(A);
%  [m n] = size(A);
%  if m==n
%  B=ones(size(A));
%  f=isequal(A==A',B);
%  else
%      f=0;
%  end
[m n] = size(A);
if m==n
if A==A';
    f=1;
else
    f=0
end
else
    f=0;
end

    
