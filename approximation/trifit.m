function [a, b]=trifit(x_0,x_M,m,n,y)
%
% Trigonometric approximation: trifit(x_0,x_M,m,n,y)
%
%  Given data --- interval [x_0, x_M] and y_0,y_1,...,y_{2m-1} at
%                 x_0,x_1,...,x_{2m-1}, where 
%                 x_j=x_0+(j-1)*(x_M-x_0)/2m
%
%  Purpose    --- Find the trigonometri approximation, S_n(x)
%                 where n=m or n<m.
%
%  Output     --- Coefficients a = {a_0,a_1,...,a_n}
%                 coefficients b = {b_1,...,b_{n-1}}
%                 and the graph of approximation curve
%
%  Example calling:
%  a = 0; b = 2; m = 6; n = 3;
%  h = (b-a)/m/2; x = a:h:b; y = exp(-x);
%  [A,B]=trifit(a,b,m,n,y)
%
%  Example calling:
%  a = -pi; b = pi; m = 4; n = 3;
%  x = -pi:pi/4:3*pi/4; y = [0.01 1.1 -0.07 -1.23 0.1 0.9 0.03 -0.82];
%  [A,B]=trifit(a,b,m,n,y)
%


%
% -- Discretization
%
h  = pi/m;
x  = [-pi:h:pi-h];
m2 = m*2;


%
% -- Compute coefficients of s_n(x)
%
a_0 = 0;
for j=1:m2
    a_0 = a_0 + y(j);
end 
a_0 = a_0/m;

a  = zeros(n,1); 
b  = zeros(n,1);
for k=1:n
  sum_a = 0;
  sum_b = 0;
  for j=1:m2
    sum_a = sum_a + y(j)*cos(k*x(j)); 
    sum_b = sum_b + y(j)*sin(k*x(j));
  end
  a(k) = sum_a/m; 
  b(k) = sum_b/m; 
end

%
% -- Compute the function values of S_n(x) at
%    plotting grids: tt
%
hh = h/5;
tt = [-pi:hh:pi];

s_n = a_0/2 + a(n)*cos(n*tt);
if n==m 
  s_n = a_0/2 + a(n)*cos(n*tt)/2; 
end;

for k=1:n-1
    s_n = s_n + a(k)*cos(k*tt)+b(k)*sin(k*tt);
end

%
% -- Plotting
%
a = [a_0 a']';
b = b(1:n-1);

hold off
h  = (x_M-x_0)/m2;
x  = [x_0:h:x_M];
plot(x(1:m2),y(1:m2),'*');
hold on;

hh = h/5;
tt = [x_0:hh:x_M];
mm = (m2-1)*5+1;
plot(tt(1:mm),s_n(1:mm),'r');
ss = 'Least-square Trigonometric Fitting';
xlabel('X-Axis'); ylabel('Y-Axis');
title(ss,'Fontweight','bold')
s1 = sprintf('Given points, m=%d',m);
s2 = sprintf('Trigonometric fitting, n=%d',n);
legend(s1,s2)
hold off
%
% Updated at Jan. 31, 2002






