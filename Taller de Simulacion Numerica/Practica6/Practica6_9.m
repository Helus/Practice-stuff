% PRÁCTICA 6 ejercicio 9
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
datos_a=[3,-U,-U*c_in];
datos_b=[2,0];
% parámetro de refinamiento de la malla
nel=40;
l=1;
iopcoef=2;
iopblo=2;

p=1;
tol=1.e-6;
maxit=1000;

c0=@(x) zeros(1,length(x)); % condición inicial de y para t=t0

fp= @(t) D*ones(1,length(t));
fdp= @(t) zeros(1,length(t));
fr= @(t) U*ones(1,length(t));
fq= @(t) Gamma*ones(1,length(t));
ff= @(t) zeros(1,length(t));

iopNL='IF';
% iopNL es el método que se utiliza en en caso no lineal:
%   'IF' -> iteración funcional
%   'NW' -> Newton

           
% RESOLUCIÓN DEL PROBLEMA EVOLUTIVO 
[x,t,Y]=evol_elfin1dNL(fp,fdp,fq,fr,ff,c0,p,a,b,datos_a,datos_b,nel,l,t0,T,npast,iopcoef,iopblo,tol,maxit,iopNL);
% 				-p u''(x)+ru'(x)+q u(x)=f  en (a,b)


%-------------------------------------------------
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
datNL = struct('p', 1, 'iopNL', 'IF' , 'tol', 1.e-6, 'maxit', 1000); 
datCC = struct('iopc', 4,...
               'alfa', @(t) -U*c_in/D, 'gamma', -U/D,...
               'beta', @(t) 0, 'delta', 0);

% RESOLUCIÓN DEL PROBLEMA EVOLUTIVO 
[xx,tt,Z]=evol_diffincNL(l,u,v,w,y0,a,b,npas,t0,T,npast,datCC,datNL);

figure(1)
pos_1=(0.25-t0)/Dt+1; % posición en el vector de tiempos de t=0.25
plot(x,Y(:,pos_1)), hold on
plot(x,Z(:,pos_1))
leg=legend('Elementos finitos','Diferencias finitas');
title('t=0.25')
hold off
figure(2)
pos_4=(500-t0)/Dt+1; % posición en el vector de tiempos de t=0.25
plot(x,Y(:,pos_4)), hold on
plot(x,Z(:,pos_4))
leg2=legend('Elementos finitos','Diferencias finitas');
title('t=500')
hold off
