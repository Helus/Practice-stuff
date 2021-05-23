% PRÁCTICA 6 ejercicio 9

% NOTA: para los datos de este ejercicio, la compilación en el caso lineal 
%       suele tardar 5 min, y en el caso no lineal, unos 10 min. 

clear all
close all
global L D U c_in Gamma


% DATOS DEL PROBLEMA
L=10; D=2; U=2; c_in=100; Gamma=0.2;

% extremos del intervalo de espacio y de tiempo
a=0; b=L; t0=0; T=500;
% parámetros de la malla de tiempo
Dt=0.025; 
npast=(T-t0)/Dt;
% datos de las condiciones de contorno
datos_a=[3,-U*Dt,-U*Dt*c_in];
datos_b=[2,0];
% parámetro de refinamiento de la malla
nel=40;
l=1;
iopcoef=2;
iopblo=2;

p=2;
tol=1.e-6;
maxit=1000;

c0=@(x) zeros(1,length(x)); % condición inicial de y para t=t0

fp= @(t) D*ones(1,length(t));
fdp= @(t) zeros(1,length(t));
fr= @(t) U*ones(1,length(t));
fq= @(t) Gamma*ones(1,length(t));
ff= @(t) zeros(1,length(t));

iopNL='NW';
% iopNL es el método que se utiliza en en caso no lineal:
%   'IF' -> iteración funcional
%   'NW' -> Newton

           
% RESOLUCIÓN DEL PROBLEMA EVOLUTIVO 
[x,t,Y]=evol_elfin1dNL(fp,fdp,fq,fr,ff,c0,p,a,b,datos_a,datos_b,nel,l,t0,T,npast,iopcoef,iopblo,tol,maxit,iopNL);
% 				-p u''(x)+ru'(x)+q u(x)=f  en (a,b)


% REPRESENTACIÓN GRÁFICA
figure(1)
pos_1=(0.25-t0)/Dt+1; % posición en el vector de tiempos de t=0.25
plot(x,Y(:,pos_1)), hold on
pos_2=(2.5-t0)/Dt+1; % posición en el vector de tiempos de t=2.5
plot(x,Y(:,pos_2))
pos_3=(25-t0)/Dt+1; % posición en el vector de tiempos de t=25
plot(x,Y(:,pos_3))
pos_4=(500-t0)/Dt+1; % posición en el vector de tiempos de t=500
plot(x,Y(:,pos_4),'o')

leg=legend('t=0.25','t=2.5','t=25','t=500');
leg.Location='best';
title('Concentración del reactor químico dependiento de t (p=2)')
hold off

% Cambiar los datos
%    L=10; D=1; U=1; c_in=100; Gamma=0.2;
% para hacer el último apartado