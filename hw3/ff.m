function y=ff(x)
t=x;snew=x;sold=0;i=0;
while sold ~=snew
    i=i+1;
    sold=snew;t=-t*x^2/i;
    snew=sold+t/(2*i+1);
end
y=snew;

