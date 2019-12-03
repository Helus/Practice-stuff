% Programa que calcula el minimo de una funcion por el METODO DEL GRADIENTE 
% utilizando la busqueda inexacta de Wolfe

% hacer un ficehro de salida de datos

clear

[func,gradfunc,x0,itmax,tol,rho,sigma,gamma]=datos_w_b; % funcion de entrada de datos

alphainit=1; %alfa inicial

[sol,nor_grad,index_conver]=grad_wolfe(func,gradfunc,rho,sigma,alphainit,gamma,x0,itmax,tol);
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