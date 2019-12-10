% RUNGE-KUTTA DE ORDEN 3

clear
close all

f=@(x) 0 ;
y_ex=@(x) cos(sqrt(2)*x) ;
y1_ex=@(x) -sqrt(2)*sin(sqrt(2)*x);

ord=2; % mayor orden de derivada
a=0; b=4; % extremos

y_0=[1,0];% vector de valores iniciales

h=input('paso h? ');

ndim=(b-a)/h ; % hay ndim puntos (n+1)
x=a:h:b;

% sistema: y'=Ay
               
A=[0 1;-2 0];
y=zeros(ord,ndim);
for i=1:ord
  y(1,i)=y_0(i);
end

h3=h*3/4;
% Construccion de la solucion
for i=1:ndim
    k1=A*(y(:,i));
    k2=A*(y(:,i)+h3*k1);
    k3=A*(y(:,i)+h*((7/3)*k1-(4/3)*k2));
    y(:,i+1) = y(:,i)+h*((5/18)*k1+(8/9)*k2-(1/6)*k3);
end

% Calculo del error
err=y(1,:)-y_ex(x);
fprintf('Error=%e \r\n',norm(err,Inf));

plot(x,y(1,:),'o',x,y_ex(x));

% Error concreto en x0
x0=4;
posx0=(x0-a)/h +1; %posicion del valor y(x0) en y
error_y0_x0=y(1,fix(posx0))-y_ex(x0); % error en y
error_y1_x0=y(2,fix(posx0))-y1_ex(x0); % error en y'
fprintf('Error en y(x0)=%e \r\n',abs(error_y0_x0));
fprintf('Error en y1(x0)=%e \r\n',abs(error_y1_x0));

% presentacion_tabla(1,x,y,err);
