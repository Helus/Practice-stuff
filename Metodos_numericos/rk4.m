% Programa que resuelve por METODO DE RUNGE-KUTTA de ORDEN 4 el PVI 

clear
close all

%% DATOS %%

f=@(x,y) cos(x) -1.e4*(y-sin(x)) ;
y_ex=@(x) sin(x)+exp(-1.e4*x) ;

y0=1 ; %valor inicial
a=0 ; b=0.05 ; %extremos 

h=input('Paso h? ');
ndim=(b-a)/h; % hay ndim puntos (n+1)
x=a:h:b;

h2=h*0.5;
y(1)=y0;
for i=1:ndim
    k1=f(x(i),y(i));
    k2=f(x(i)+h2,y(i)+h2*k1);
    k3=f(x(i)+h2,y(i)+h2*k2);
    k4=f(x(i+1),y(i)+k3*h);
    y(i+1) = y(i)+h*(k1+2*k2+2*k3+k4)/6;
    
    %suma=f(x(i),y(i));
    %aux=f(x(i)+h2,y(i)+h2*suma);
    %suma=suma+2*aux;
    %aux=f(x(i)+h2,y(i)+h2*aux);
    %suma=suma+2*aux;
    %aux=f(x(i+1),y(i)+h*aux);
    %suma=suma+aux;
    %y(i+1)=y(i)+h*suma/6;
end
for i=1:(ndim+1) %calculo del error
  err(i)=y(i)-y_ex(x(i));
end
fprintf('Error=%e \r\n',norm(err,Inf));

plot(x,y,'o',x,y_ex(x),'o'); % ROJO: solución exacta
