function [t,x]=diffin(u,v,w,a0,b0,alfa,beta,num_pas)
% [t,x]=diffin(u,v,w,a0,b0,alfa,beta,num_pas)
% C�lculo de la soluci�n del problema de contorno
% lineal de segundo orden:
% 				x''(t)=u(t)+v(t)x+w(t)x'
% 				x(a0)=alfa, x(b0)=beta
% num_pas : n�mero de pasos de discretizaci�n
% t es un vector fila con los puntos de discretizaci�n
% x es un vector fila von la soluci�n en aproximada
% 

if(num_pas < 2)
	t=[a0,b0];x=[alfa,beta];return
end

% Definici�n del par�metro de discretizaci�n.
h=(b0-a0)/num_pas;

% Obtenci�n del vector de variable independiente discretizado
%   i : vector de �ndices de dimensi�n num_pas+1
%   h : tama�o del paso de discretizaci�n
%   t : puntos de discretizaci�n
i=0:num_pas;t=a0+i*h;

% C�lculo de vectores caracter�sticos.
% d : es el vector relacionado a la diagonal
% a : es el vector relacionado a la diagonal inferior
% c : es el vector relacionado a la diagonal superior
% b : es el vector relacionado con el segundo miembro antes del bloqueo
% Su dimensi�n es num_pas+1
%a=-1*ones(1,num_pas+1)-h*feval(w,t)./2;
a=-1*ones(1,num_pas+1)-h*w(t)./2;
d=2+h^2*feval(v,t);c=-a-2;b=-h^2*feval(u,t);

%C�lculo de la matriz del sistema
matriz=sparse(1:num_pas-1,1:num_pas-1,d(2:num_pas));
matriz=matriz+sparse(2:num_pas-1,1:num_pas-2,a(3:num_pas),num_pas-1,num_pas-1);
matriz=matriz+sparse(1:num_pas-2,2:num_pas-1,c(2:num_pas-1),num_pas-1,num_pas-1);

%C�lculo del segundo miembro
bmod=b(2:num_pas);
bmod(1)=bmod(1)-a(2)*alfa;
bmod(num_pas-1)=bmod(num_pas-1)-c(num_pas)*beta;

%C�lculo de la soluci�n
x=matriz \ bmod';x=[alfa,x',beta];





