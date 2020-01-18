function [func,gradfunc,x0,itmax,tol,rho,sigma,gamma]=datos_w_b
  func=@(x) 10*(x(3)-x(2)^2)^2+10*(x(2)-x(1)^2)^2+(1-x(2))^2+(1-x(1))^2; 
  gradfunc=@(x) [40*x(1)^3-40*x(2)*x(1)+2*x(1)-2; 40*x(2)^3-40*x(2)*x(3)+22*x(2)-20*x(1)^2-2 ;20*(x(3)-x(2)^2)] ; 
  x0=[-1,-2,0].';
  rho=0.2;
  sigma=0.4;
  gamma=2;  %tiene que ser mayor que 1
  itmax=500;
  tol=1.e-6;
end
