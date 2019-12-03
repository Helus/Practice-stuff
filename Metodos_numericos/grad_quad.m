function [sol,nor_grad,index_conver]=grad_quad(A,b,x0,itmax,tol)
  x=x0'; 
  r=A*x-b; %residuo r0 % g=gradfun(x) para el caso no cuadratico
  d=-r;

  if norm(r,2)<tol
      index_conver=0 ;
      return % x0 es buena aproximacion
  end

  for i=1:itmax
    Ad=A*d ;
    alfa=d'*d/(d'*Ad); % cambiar para el caso no cuadratico
    x=x+alfa*d;
    r=r+alfa*Ad;
    d=d-alfa*Ad; % cambiar para el caso no cuadratico
    
    if norm(r,2)<tol
     break % convergemos en la iteracion i
    end
  end
      sol=x;
      index_conver=i;
      nor_grad=norm(r,2);
end
