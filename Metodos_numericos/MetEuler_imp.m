% Programa que resuelve por EULER IMPLICITO el PVI

clear
close all

%% DATOS %%

f=@(x,y) cos(x) -1.e4*(y-sin(x)) ;
y_ex=@(x) sin(x)+exp(-1.e4*x) ;

y0=1 ; %valor inicial
a=0 ; b=1.e-3 ; %extremos 
%%-----%%

h=input('Paso h? ');
ndim=(b-a)/h ; % hay ndim puntos (n+1)
x=a:h:b ;

y(1)=y0;
for i=1:ndim
  z0=y(i)+h*f(x(i),y(i));
  fimp=@(z) z-y(i)-h*f(x(i+1),z);
  y(i+1)=fsolve(fimp,z0);
end
for i=1:(ndim+1) %calculo del error
  err(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(err,Inf));

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta

% presentacion_tabla(1,x,y,err) % imprime por pantalla el error en cada nodo
