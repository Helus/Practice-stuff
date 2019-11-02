% Programa que resuelve por RUNGE-KUTTA de orden 4 el PVI con una SISTEMA de 
% EDOS de orden 1

clear

ord=4 ; % nº ecuaciones del sistema 
a=0 ; b=1 ; % extremos
y_0=[1 1 1 1];% vector de valores iniciales
h=input('paso h? ');
ndim=(b-a)/h ; % hay ndim puntos (n+1)
x=a:h:b;

y=zeros(ord,ndim);
y(:,1)=y_0;
h2=h*0.5;
% Construccion de la solucion
for i=1:ndim
  k1=f_Euler_sist(x(i),y(1,i),y(2,i),y(3,i),y(4,i));
  k2=f_Euler_sist(x(i)+h2,y(1,i)+h2*k1(1),y(2,i)+h2*k1(2),y(3,i)+h2*k1(3),y(4,i)+h2*k1(4));
  k3=f_Euler_sist(x(i)+h2,y(1,i)+h2*k2(1),y(2,i)+h2*k2(2),y(3,i)+h2*k2(3),y(4,i)+h2*k2(4));
  k4=f_Euler_sist(x(i+1),y(1,i)+h*k3(1),y(2,i)+h*k3(2),y(3,i)+h*k3(3),y(4,i)+h*k3(4));
  y(:,i+1) = y(:,i)+h*(k1+2*k2+2*k3+k4)/6;
end

% Calculo del error
error=y-f_sol_ex(x);
for i=1:ord
  fprintf('Error en y%i=%e \r\n',i, norm(error(i,:),Inf));
end
% Error concreto en x0
x0=1;
posx0=(x0-a)/h +1; %posicion del valor y(x0) en y
error_x0=y(:,fix(posx0))-f_sol_ex(x0); % error en y
fprintf('Error en y(x0)=%e \r\n',abs(error_x0));
