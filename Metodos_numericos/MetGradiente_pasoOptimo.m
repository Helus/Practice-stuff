% Programa que calcula el minimo de una funcion por el METODO DEL GRADIENTE 
% para el caso CUADRATICO

clear

[A, b, x0, itmax, tol]=datos_grad_opt; % funcion de entrada de datos

[sol,nor_grad,index_conver]=grad_quad(A,b,x0,itmax,tol); % Metodo del gradiente

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