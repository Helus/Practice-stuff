% Programa que resuelve por EULER IMPLICITO el PVI con una SISTEMA de EDOS
% de orden 1

clear

ord=4 ; % nº ecuaciones del sistema 
a=0 ; b=1 ; % extremos
y_0=[1 1 1 1];% vector de valores iniciales
h=input('paso h? ');
ndim=(b-a)/h ; % hay ndim puntos (n+1)
x=a:h:b;

y=zeros(ord,ndim);
y(:,1)=y_0;
% Construccion de la solucion
for i=1:ndim
  z0=y(:,i)+ h*f_Euler_sist(x(:,i),y(1,i),y(2,i),y(3,i),y(4,i));
  fimp=@(z) z-y(:,i)-h*f_Euler_sist(x(:,i+1),z(1),z(2),z(3),z(4));
  y(:,i+1)=fsolve(fimp,z0);
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
