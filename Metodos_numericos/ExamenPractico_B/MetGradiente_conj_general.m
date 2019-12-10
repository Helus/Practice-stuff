% METODO DE GRADIENTE CONJUGADO PARA EL CASO GENERAL

clear

[func,gradfun,x0,itmax,tol,rho,sigma,gamma]=datos_w_b; % funcion de entrada de datos

alphainit=1; %alfa inicial

[sol,nor_grad,index_conver]=grad_wolfe(func,gradfun,rho,sigma,alphainit,gamma,x0,itmax,tol);
 % encontrar paso con la regla de Wolfe
  
if index_conver==itmax
  fprintf('NO se ha convergido al optimo en %i iteraciones \n',itmax);
  fprintf('itereante actual x=  \n');
  fprintf('%e \n', sol);
else
  fprintf('Convergencia en la iteracion %i \n',index_conver);
  fprintf('Optimo x= \n');
  fprintf('%e \n',sol);
  fprintf('Norma del gradiente: %e \n',nor_grad);
end