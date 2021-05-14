% PRÁCTICA 7 ejercicio 3
% se exporta a la ventana de comandos la malla y la solución
whos % indica las dimensiones de las distintas matrices disponibles

% Cálculo del grado de aproximación de la solución en norma 2
error_u=u-(1-p(1,:)'.^2-p(2,:)'.^2)/4;
error2_u=norm(error_u,2)

% Cálculo del grado de aproximación de la aproximación norma infinito
errorInf_u=norm(error_u,'inf')

% Cálculo del gradiente de la solución asociada a la malla considerada 
[ux,uy]=pdegrad(p,t,u);
% obsérvese que se asigna un gradiente constante por elemento, que aproxima
% el gradiente en el baricentro del elemento

% Cálculo del gradiente correspondiente a la solución exacta por elemento 
% Se necesita primero calcular el baricentro de cada elemento
nel=size(t,2);
bar_e=[];
for k=1:nel
    bar_e=[bar_e, 1/3*[sum(p(1,t(1:3,k))), sum(p(2,t(1:3,k)))]'];
end
error2_gradu=max(norm(ux+bar_e(1,:)/2,2), norm(uy+bar_e(2,:)/2,2))
errorInf_gradu=max(norm(ux+bar_e(1,:)/2,'inf'), norm(uy+bar_e(2,:)/2,'inf'))