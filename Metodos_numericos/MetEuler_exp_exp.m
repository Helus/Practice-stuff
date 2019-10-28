% Programa para resolver problemas rigidos:
% Primero integra por EULER EXPLICITO y luego por EULER IMPLICITO

clear 
close all

f=@(x,y) cos(x) -1.e4*(y-sin(x)) ;
y_ex=@(x) sin(x)+exp(-1.e4*x) ;

% Primera parte de Euler explícito
y0_1=1 ; %valor inicial
a_1=0 ; b_1=1.e-3 ; %extremos 

h=input('Paso h? EXPLICITO1 ');
ndim_1=(b_1-a_1)/h; % hay ndim puntos (n+1)
x=a_1:h:b_1 ;

y(1)=y0_1;
for i=1:ndim_1
  y(i+1)=y(i)+h*f(x(i),y(i));
end
for i=1:ndim_1+1 %calculo del error
  error_1(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(error_1,Inf));

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta

% Segunda parte de Euler explícito
y0_2=y(end) ; %valor inicial
a_2=1.e-3 ; b_2=0.05 ; %extremos 

h=input('Paso h? EXPLICITO2 ');
ndim_2=(b_2-a_2)/h ; % hay ndim puntos (n+1)
x=[x,a_2+h:h:b_2] ;

for i=(ndim_1+1):(ndim_2+ndim_1)
  y(i+1)=y(i)+h*f(x(i),y(i));
end
for i=(ndim_1+2):(ndim_2+ndim_1+1) %calculo del error
  error_2(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(error_2,Inf));

err=[error_1,error_2(ndim_1+2:end)];

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta

presentacion_tabla(1,x,y,err)
