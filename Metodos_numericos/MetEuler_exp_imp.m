% Programa para resolver problemas rigidos:
% Primero integra por EULER EXPLICITO y luego por EULER IMPLICITO

clear 
close all

f=@(x,y) cos(x) -1.e4*(y-sin(x)) ;
y_ex=@(x) sin(x)+exp(-1.e4*x) ;

% Parte de Euler explícito
y0_exp=1 ; %valor inicial
a_exp=0 ; b_exp=1.e-3 ; %extremos 

h=input('Paso h? EXPLICITO ');
ndim_exp=(b_exp-a_exp)/h; % hay ndim puntos (n+1)
x=a_exp:h:b_exp ;

y(1)=y0_exp;
for i=1:ndim_exp
  y(i+1)=y(i)+h*f(x(i),y(i));
end
for i=1:ndim_exp+1 %calculo del error
  error_exp(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(error_exp,Inf));

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta

% Parte de Euler implícito
y0_imp=y(end) ; %valor inicial
a_imp=1.e-3 ; b_imp=0.05 ; %extremos 

h=input('Paso h? IMPLICITO ');
ndim_imp=(b_imp-a_imp)/h ; % hay ndim puntos (n+1)
x=[x,a_imp+h:h:b_imp] ;

for i=(ndim_exp+1):(ndim_imp+ndim_exp)
  z0=y(i)+h*f(x(i),y(i));
  fimp=@(z) z-y(i)-h*f(x(i+1),z);
  y(i+1)=fsolve(fimp,z0);
end
for i=(ndim_exp+2):(ndim_imp+ndim_exp+1) %calculo del error
  error_imp(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(error_imp,Inf));

err=[error_exp,error_imp(ndim_exp+2:end)];

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta

presentacion_tabla(1,x,y,err)
