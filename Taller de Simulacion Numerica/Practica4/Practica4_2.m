% PRÁCTICA 4 ejercicio 2

clear all
close all
global p
syms x1 t1

% DATOS DEL PROBLEMA
solucion=t1*exp(x1);    % solución exacta

% extremos intervalo espacio
a=0; b=2;
% extremos intervalo tiempo
t0=1; T=5;
% parámetros de las mallas de espacio y de tiempo
npas=25; npast=1500;

y0=@(x) exp(x); % condición inicial de y para t=t0

u = @(x,t,p) exp(x)*(-t^2+t-2);
v = @(x,t) 1/t*ones(1,length(x));
w = @(x,t) t*ones(1,length(x));
l = @(x,t) ones(1,length(x));


% iopNL es el método que se utiliza en en caso no lineal:
%   'IF' -> iteración funcional
%   'NW' -> Newton
datNL = struct('p', 1, 'iopNL', 'NW' , 'tol', 1.e-6, 'maxit', 200); 
datCC = struct('iopc', 4,...
               'alfa', @(t) 0, 'gamma', -1,...
               'beta', @(t) 3*t*exp(2), 'delta', 2);

% RESOLUCIÓN DEL PROBLEMA EVOLUTIVO 
[x,t,Y]=evol_diffincNL(l,u,v,w,y0,a,b,npas,t0,T,npast,datCC,datNL);

% CÁLCULO DE ERRORRES
Y_exac=sparse(length(x),length(t));

for i=1:length(t)
    Y_exac(:,i)=subs(solucion,struct('x1', x, 't1',t(i)));
end
Y_exacn=double(Y_exac);
error=abs(Y_exacn-Y);
error_max=max(error(:)); % devuelve el elemento máximo de la matriz de errores absolutos
disp(['Error máximo = ',num2str(error_max)])
error_max_t=[];
for i=1:length(t)
    error_max_t(i)=max(error(:,i));
end
plot([t0:(T-t0)/npast:T],error_max_t,'b*') % evolución del máximo error absoluto 

% MÁXIMO ERROR RELATIVO
error_rel=abs(error./Y_exacn);
error_rel_max=max(error_rel(:));
disp(['Error relativo máximo = ',num2str(error_rel_max)])

% REPRESENTACIÓN GRÁFICA
vector_X=a:(b-a)/npas:b;
vector_T=t0:(T-t0)/npast:T;
[TT,XX] = meshgrid(vector_T,vector_X);
%surf(TT,XX,Y_exacn) % representación de la solución exacta
%surf(TT,XX,Y) % representación de la solución aproximada

% SOLUCIÓN EXACTA FRENTE A LA APROXIMADA CON LOS ERRORES
rt=randi(npast+1) % número aleatorio para la posición en el vector de tiempos
plot(vector_X,Y_exacn(:,rt),'r'), hold on
plot(vector_X,Y(:,rt),'b*')
errorbar(vector_X,Y_exacn(:,rt),1.e3*error(:,rt))
leg=legend('Sol. exacta', 'Sol. aproximada','10^3*Error');
leg.Location='northwest';
title(['10^3 Errores con t= ', num2str(t0+rt*(T-t0)/npast)])
hold off
