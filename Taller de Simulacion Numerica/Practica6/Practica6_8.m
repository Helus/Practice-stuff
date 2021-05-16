% PRÁCTICA 6 ejercicio 8

clear all
global D U Gamma cin L 

% coeficientes de la ecuación diferencial
D=1; U=1; Gamma=0.2; cin=100; L=10; p=2;
fp= @(t) D*ones(size(t));
fdp= @(t) zeros(size(t));
fr= @(t) U*ones(size(t));
fq= @(t) Gamma*ones(size(t));
ff= @(t) zeros*(size(t));


% extremos del intervalo
a=0; b=L;
% datos de las condiciones de contorno
datos_a=[3,-U,-U*cin];
datos_b=[3,0,0];
% parámetro de refinamiento de la malla
nel=10000;
l=1;
iopcoef=2;
iopblo=3;

p=2;
tol=1.e-6;
maxit=200;

% resolución del problema por ELEMENTOS FINITOS (Iteración Funcional)
[x,phi]=elfin1dNoLinealIF(fp,fdp,fr,fq,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit);

% resolución del problema por DIFERENCIAS FINITAS
num_pas=nel;
gamma=-U/D; alfa=-U*cin/D;
delta=0; beta=0;
iopc=4;

[xx,ch]=diffincNoLinealIF(@u3_3IF,@v3_3IF,@w3_3IF,p,a,b,alfa,beta,num_pas,iopc,gamma,delta,tol,maxit);

error=abs(phi-ch);
norm(error,Inf)

figure(1)
plot(x,phi), hold on
plot(x,ch)
leg=legend('Elementos finitos', 'Diferencias finitas');
leg.Location='best';

% resolución del problema por ELEMENTOS FINITOS (Newton)
%[x,phi]=elfin1dNoLinealN(fp,fr,fq,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit);
