function [sol,nor_grad,index_conver]=grad_wolfe(func,gradfun,rho,sigma,alphainit,gamma,x0,itmax,tol)
  
  x=x0; 
  d=-gradfun(x); %residuo r0 
  res=norm(d,2);

  if res<tol
      index_conver=0 ;
      return % x0 es buena aproximacion
  end

  for i=1:itmax  
    [alfa, i0, index]=WolfeBiseccion(func, gradfun, x, d, rho, sigma, alphainit, gamma, 1);
    if index==-1
       fprintf('ERROR no se pudo encontrar alfa en %i iteraciones \n',i0);
    elseif index==0
      fprintf('ERROR al inicializar alfa \n');
      fprintf('CAMBIAR alphainit \n');
      break
    else
      x=x+alfa*d;
      d=-gradfun(x); 
      res=norm(d,2);  
    end 
    if res<tol
     break % convergemos en la iteracion i
    end
  end
      sol=x;
      index_conver=i;
      nor_grad=res;
end
