% Script para el ejercicio

% definición de variables

u = @(x,t,p) t*ones(size(x))^p;
v = @(x,t) t*ones(size(x));
w= @(x,t) %...
l= @(x,t) %...

datNL = struct('p', %p, 'iopNL', %iopNL, 'tol, %tol', 'maxit', %maxit);
datCC = struct('iopc', %iopc,...
               'alfa', @(t) %..., 'gamma', %gamma,...
               'beta', @(t) %..., 'delta', %delta);

% se accede con: datCC.iopc
% resto de variables

% llamada
[x,t,y]=evol_diffincNL(l,u,v,w,y0,a,b,npas,t0,T,npast,datCC,datNL);



% resto del script

% FUNCION evol_diffincNL
% definicion de variables

Dt = % paso de tiempo
t = % array de instantes temporales
h = % incremento espacial
x = % puntos espaciales
Y = % matriz solucion (npas+1) x (npast+1); toda ceros, la primera columna es y0
Y(:,1)=y0;

si datNL.p ==1:
    % caso lineal
    for i=2:length(t)
        u1= @(x) u(x,t(i),datNL.p)-l(x,t(i)).*Y(:,i-1)'/Dt;
        v1= @(x) %...
        w1= @(x) %...
        alfa1= datCC.alfa(t(i));
        beta1= datCC.beta(t(i));
        [x,Y(:,i)] = diffinc(u1,v1,w1,a,b,alfa1,beta1,npas,datCC.iopc,datCC.gamma,datCC.delta)
    end
sino, si estamos en iteración funcional (iopNL):
    for i=2:length(t)
        % OPCIÓN 1 de Iteración Funcional
        vi=@(x) %...
        for j=1:maxit
            % llamada a diffinc
            % test de convergencia
        end
        % si hay convergencia, se obtiene [x,Y(:,i)]
        % OPCIÓN 1 de Iteración Funcional
        [x,phi,i]=diffincNoLinealIF_modificado(l,u,v,w,...)
    end
sino, si estamos en Newton
    % parecido a Iteración Funcional
fin si