% Programa que resuelve por RUNGE-KUTTA de orden 4 el PVI con una EDO de ORDEN N
% y^n+a_(n-1)*y^(n-1)+...+a_1*y'+a_0*y0=f(x)

clear
close all

f=@(x) cos(3*x) ;
y_ex=@(x) (9*cos(x)-cos(3*x))/8 ;
y1_ex=@(x) (3*sin(3*x)-9*sin(x))/8;

datos=load('datos_MetEuler_sist.txt');

ord=datos(1); % mayor orden de derivada
a=datos(length(datos)-1); b=datos(length(datos)); % extremos

y_0=[];% vector de valores iniciales
for i=1:ord
  y_0(i)=datos(i+1);
end
h=input('paso h? ');

ndim=(b-a)/h ; % hay ndim puntos (n+1)
x=a:h:b;

%ecuacion y^n+a_(n-1)*y^(n-1)+...+a_1*y'+a_0*y0=f(x)
coefs=[];
for i=1:ord
  coefs(i)=datos(i+1+ord);
end
% sistema: y'=Ay+b
                      % NOTA: se puede optimizar utilizando A=sparse()
A=zeros(ord,ord);
for i=1:(ord-1)
 A(i,i+1)=1; 
end
for i=1:ord
  A(ord,i)=(-1)*coefs(ord-i+1);
end
y=zeros(ord,ndim);
for i=1:ord
  y(1,i)=y_0(i);
end

h2=h*0.5;
% Construccion de la solucion
for i=1:ndim
    k1=A*(y(:,i))+[zeros(ord-1,1);f(x(i))];
    k2=A*(y(:,i)+h2*k1)+[zeros(ord-1,1);f(x(i)+h2)];
    k3=A*(y(:,i)+h2*k2)+[zeros(ord-1,1);f(x(i)+h2)];
    k4=A*(y(:,i)+k3*h)+[zeros(ord-1,1);f(x(i+1))];
    y(:,i+1) = y(:,i)+h*(k1+2*k2+2*k3+k4)/6;
end

% Calculo del error
err=y(1,:)-y_ex(x);
fprintf('Error=%e \r\n',norm(err,Inf));

plot(x,y(1,:),'o',x,y_ex(x));

% Error concreto en x0
x0=2.4;
posx0=(x0-a)/h +1; %posicion del valor y(x0) en y
error_y0_x0=y(1,fix(posx0))-y_ex(x0); % error en y
error_y1_x0=y(2,fix(posx0))-y1_ex(x0); % error en y'
fprintf('Error en y(x0)=%e \r\n',abs(error_y0_x0));
fprintf('Error en y1(x0)=%e \r\n',abs(error_y1_x0));

% presentacion_tabla(1,x,y,err);
