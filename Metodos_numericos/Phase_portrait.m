% Programa que realiza el retrato de fases de un sistema lineal X'=AX
% x->X(1), y->X(2)

clear 
close all

f=@(t,X) [X(2)-X(1)*(X(2))^2; -(X(2))^3]; % definicion del sistema

y1 = linspace(-0.5,0.5,20);
y2 = linspace(-0.5,0.5,20);
[x,y] = meshgrid(y1,y2); % malla de vectores

u = zeros(size(x));
v = zeros(size(x));
t=0; % entornos de t=0
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
% Por si se quieren normalizar los vectores, descomentar más abajo
%
for i = 1:numel(x)
 Vmod = sqrt(u(i)^2 + v(i)^2);
 u(i) = u(i)/Vmod;
 v(i) = v(i)/Vmod;
end
quiver(x,y,u,v,'r'); figure(gcf) % campo de vectores
hold on
for y0=[0 0.1 0.2 -0.1 -0.2 ] %soluciones particulares pasando por unos puntos
  [ts,ys]=ode45(f,[0,50],[0;y0]); % los puntos son de la forma (0,y0)
  plot(ys(:,1),ys(:,2));
  axis([-4 4 -4 4])
end
hold off