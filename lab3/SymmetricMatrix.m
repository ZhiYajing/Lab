function f=SymmetricMatrix(A);
s=0;
[m n] = size(A);
f=1;
if m==n
    
     for i =1:1:m
         for j=i+1:n
             if A(i,j)~=A(j,i)
                 f=0;
                 break;
             end
         end
     end
%             if(A(i,j)==A(j,i))
%                 s=s+1;
%             end
%         end
%     end
%     if s==n*m
%         f=1;
%     else
%         f=0;
%     end
    
else 
    f=0;
end

