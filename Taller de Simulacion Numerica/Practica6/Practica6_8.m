% PRÁCTICA 6 ejercicio 8

clear all
global D U gamma cin L 

% coeficientes de la ecuación diferencial
D=1; U=1; gamma=0.2; cin=100; L=10; p=2;
fp= @(t) D*ones(size(t));
fdp= @(t) zeros(size(t));
fr= @(t) U*ones(size(t));
fq= @(t) gamma*ones(size(t));
ff= @(t) zeros*(size(t));


% extremos del intervalo
a=0; b=L;
% datos de las condiciones de contorno
datos_a=[3,-U,-U*cin];
datos_b=[2,0];
% parámetro de refinamiento de la malla
nel=10000;
l=1;
iopcoef=2;
iopblo=3;

p=2;
tol=1.e-6;
maxit=200;

% resolución del problema
[x,phi]=elfin1dNoLinealIF(fp,fq,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit)