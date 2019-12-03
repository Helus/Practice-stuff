function [func,gradfunc,x0,itmax,tol,rho,sigma,gamma]=datos_w_b
  func=@(x) (x(1)-1)^2+(x(2)-x(1)^3)^2; 
  gradfunc=@(x) [6*x(1)^5-6*x(2)*x(1)^2+2*x(1)-2 ; 2*x(2)-2*x(1)^3] ; 
  x0=[1,2].';
  rho=0.2;
  sigma=0.4;
  gamma=2;  %tiene que ser mayor que 1
  itmax=1000;
  tol=1.e-6;
  % converge en 571 iteraciones
end
