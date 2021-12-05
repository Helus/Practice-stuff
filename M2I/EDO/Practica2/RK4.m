function [m,x,yh]=RK4(a,b,eta,N,ofi)
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

b=[1 2 2 1]./6;
h2=h/2; % paso h/2 para reducir cálculos

for i = 1:N-1
    k1=f(x(i),yh(i,:));
    k2=f(x(i)+h2, yh(i,:)+h2*k1);
    k3=f(x(i)+h2, yh(i,:)+h2*k2);
    k4=f(x(i+1),yh(i,:)+h*k3);
    yh(i+1,:)=yh(i,:)+h*(b(1)*k1+b(2)*k2+b(3)*k3+b(4)*k4);
end

