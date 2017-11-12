function s= pi1;
s=sqrt(3)/2; A=3*s; n=6; % initialization
z=[A-pi n A s]; % store the results
while s>1e-10 % termination if s=sin(alpha) small
s=sqrt((1-sqrt(1-s*s))/2); % new sin(alpha/2) value
n=2*n; A=n/2*s; % A=new polygon area
z=[z; A-pi n A s];
end
m=length(z);
for i=1:m
fprintf('%10d %20.15f %20.15f %20.15f\n',z(i,2),z(i,3),z(i,1),z(i,4))
end