% Programa que resuelve por EULER EXPLICITO el PVI con una EDO de ORDEN N
% y^n+a_(n-1)*y^(n-1)+...+a_1*y'+a_0*y0=f(x)

clear
close all

g=@(x) cos(3*x) ;
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
  y(:,i)=y_0';
end

% Construccion de la solucion
F=@(x,y) A*y+[zeros(ord-1,1);g(x)] ; %si se resuelve un sistema autonomo se puede borrar el ultimo sumando
for i=1:ndim
  y(:,i+1)=y(:,i)+ h*F(x(i),y(:,i)); %(A*(y(:,i))+[zeros(ord-1,1);f(x(:,i))]);
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

%presentacion_tabla(1,x,y,err);
