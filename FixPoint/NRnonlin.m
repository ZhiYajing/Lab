function x = NRnonlin(f,J,x0,es,maxit)
% input:
% f = function value
% J = Jacobian
% x0 = initial guess
% es = desired percent relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% output:
% x = vector of roots
if nargin<3,error('at least 3 input arguments required'),end
if nargin==5 ||isempty(maxit),maxit=50;end
if nargin==4 ||isempty(es),es=0.00001;end
N = maxit;
maxval = 10000.0; % define value for divergence
xx = x0; % load initial guess
while (N==0)
 JJ = feval(J,xx);
 if abs(det(JJ))
 error('newtonm - Jacobian is singular - try new x0');
 end
 xn = xx - inv(JJ)*feval(f,xx);
 if abs(feval(f,xn))
 x=xn;
 iter = 100-N;
 return
 end
 if abs(feval(f,xx))
 iter = 100-N;
 disp(['iterations = ',num2str(iter)]);
 error('Solution diverges');
 end
 N = N - 1;
 xx = xn;
end