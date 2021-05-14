% PRÁCTICA 4 ejercicio 3
clear all
close all
global L D U c_in Gamma

% DATOS DEL PROBLEMA
L=10; D=2; U=2; c_in=100; Gamma=0.2;

% extremos intervalo espacio
a=0; b=L;
% extremos intervalo tiempo
t0=0; T=500;
% parámetros de las mallas de espacio y de tiempo
h=0.25; Dt=0.025;
npas=(b-a)/h; npast=(T-t0)/Dt;

y0=@(x) zeros(1,length(x)); % condición inicial de y para t=t0

u = @(x,t,p) zeros(1,length(x));
v = @(x,t) Gamma/D*ones(1,length(x));
w = @(x,t) U/D*ones(1,length(x));
l = @(x,t) 1/D*ones(1,length(x));


% iopNL es el método que se utiliza en en caso no lineal:
%   'IF' -> iteración funcional
%   'NW' -> Newton
datNL = struct('p', 1, 'iopNL', 'NW' , 'tol', 1.e-6, 'maxit', 1000); 
datCC = struct('iopc', 4,...
               'alfa', @(t) -U*c_in/D, 'gamma', -U/D,...
               'beta', @(t) 0, 'delta', 0);

% RESOLUCIÓN DEL PROBLEMA EVOLUTIVO 
[x,t,Y]=evol_diffincNL(l,u,v,w,y0,a,b,npas,t0,T,npast,datCC,datNL);

% REPRESENTACIÓN GRÁFICA

pos_1=(0.25-t0)/Dt+1; % posición en el vector de tiempos de t=0.25
plot(vector_X,Y(:,pos_1)), hold on
pos_2=(2.5-t0)/Dt+1; % posición en el vector de tiempos de t=2.5
plot(vector_X,Y(:,pos_2))
pos_3=(25-t0)/Dt+1; % posición en el vector de tiempos de t=25
plot(vector_X,Y(:,pos_3))
pos_4=(500-t0)/Dt+1; % posición en el vector de tiempos de t=500
plot(vector_X,Y(:,pos_4),'o')

leg=legend('t=0.25','t=2.5','t=25','t=500');
leg2.Location='best';
title('Concentración del reactor químico dependiento de t')
hold off