function s=Exp(x,tol);

%compute m st. abs(x/2m) <=1
% for j=1:500
%     if (abs(x/2^j) <1)
%         m=j;
%         break;
%     end
% end
m=1
while(x/2^m >1)
    m  = m+1;
end

%compute z=x/(2^m)
z=x/(2^m);

%compute w=e^z ExpUnstable(x/2^m,tol)
w=ExpUnstable(x/2^m,tol);

%compute w^(2^m)
s=w^(2^m)




