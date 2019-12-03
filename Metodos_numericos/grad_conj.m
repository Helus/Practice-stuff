function [sol,nor_grad,index_conver]=grad_conj(A,b,x0,itmax,tol)
  x=x0'; 
  r=A*x-b; %residuo r0 
  d=-r;

  if norm(r,2)<tol
      index_conver=0 ;
      return % x0 es buena aproximacion
  end

  for i=1:itmax
    Ad=A*d;
    alfa=r'*r/(d'*Ad);
    x=x+alfa*d;
    rn=r;
    r=r+alfa*Ad;
    beta=r'*r/(rn'*rn);
    d=-r+beta*d; 
    
    if norm(r,2)<tol
     break % convergemos en la iteracion i
    end
  end
      sol=x;
      index_conver=i;
      nor_grad=norm(r,2);
end