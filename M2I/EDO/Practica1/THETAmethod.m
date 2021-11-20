% Numerical resolution of the vectorial, m-dimensional, initial value (or Cauchy) problem (IVP)
%
% y'  = f(x,y),   a <= x <= b,
% y(a) = eta,
%
%by using the explicit (or forward) Euler method with N nodes
%x(1) = a, x(2),..., x(N-1), x(N) = b.
%
% x is the vector of nodes.
%
% yh is the matrix of approximations: yh(i,j) is the approximation of y_j(x(i)),
%being y(x) = [y_1(x) ... y_m(x)] the exact solution of the IVP. In other
%words, the column j of yh contains the approximations of the j-component
%of the exact solution, y_j(x).
%
% ofi: it is a file identifier for the output file.
%
function [m,x,yh] = THETAmethod(theta,a,b,eta,N,ofi,maxit,epsi,delta,sistSol)
% m is the dimension of the problem:
m = length(eta);
fprintf(ofi,'\nDimension of the problem: \nm = %-i.', m);
% h is the stepsize:
h = (b-a)/(N-1);
fprintf(ofi,'\n\nStepsize: \nh = (b-a)/(N-1) = %-.5E.', h);
% x is the vector of nodes:
x = linspace(a,b,N);
%The following sentence makes the program run faster, since
%it fixes the size of the matrix yh instead of increasing its
%size at every step.
yh = zeros(N,m);
% The first row of yh is eta
yh(1,:) = eta;
if sistSol
    for i = 1:N-1   % Método de Newton
        yh(i+1,:) = newton(theta,h,x(i),x(i+1),yh(i,:),maxit,epsi,delta,m,ofi);
    end
else
    for i = 1:N-1   % Punto fijo
        yh(i+1,:) = fixedpoint(theta,h,x(i),x(i+1),yh(i,:),maxit,epsi,ofi);
    end
end    
end