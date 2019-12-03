function [A, b, x0, itmax, tol]=datos_grad_opt()
  n=10 ; %orden del sistema

  I=[1:n,1:(n-1),2:n];
  J=[1:n,2:n,1:(n-1)];
  V=[4*ones(1,n),ones(1,n-1),ones(1,n-1)];

  A=sparse(I,J,V);

  b=[3];
  for i=2:(n-1)
    b=[b; 2*(-1)^(i+1)];
  end
  b=[b; 3*(-1)^(n+1)];

  x0=0*ones(1,n); % punto inicial

  itmax=300; % nº de iteraciones maximas
  tol=1.e-8; % tolerancia del test de parada 
  
end
