function varargout = ex1(x)
%
%
% [F] = ex3(x) returns the function value in F
% [F,Jac] = ex3(x) returns the function value in F and
% the Jacobian in Jac
%
% return the function value
varargout{1} = [2*x(1)+x(2)+x(3)-4;x(1)+2*x(2)+x(3)-4;x(1)*x(2)*x(3)-1];
if( nargout > 1 )
% return the Jacobian as the second argument
varargout{2} = [ 2 1 1;
1 2 1;
x(2)*x(3) x(1)*x(3) x(2)*x(3)];
end

