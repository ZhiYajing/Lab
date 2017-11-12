oldA=0;s=sqrt(3)/2; newA=3*s; n=6; % initialization
z=[newA-pi n newA s]; % store the results
while newA>oldA % quit if area does not increase
oldA=newA;
s=s/sqrt(2*(1+sqrt((1+s)*(1-s)))); % new sine value
n=2*n; newA=n/2*s;
z=[z; newA-pi n newA s];
end
m=length(z);
for i=1:m
fprintf('%10d %20.15f %20.15f\n',z(i,2),z(i,3),z(i,1))
end