% Practica 6

% PRÁCTICA 6 ejercicio 2

global h
% coeficientes de la ecuación diferencial
fp=1; fq=-1; ff=0;
% Términos para verificar la práctica 5.2
% fdp=0; fr=0;

% extremos del intervalo
a=0; b=pi/2;
% datos de las condiciones de contorno
datos_a=[1,3];
datos_b=[1,7];
%parámetro de refinamiento de la malla
nel=10000;
l=1;
iopcoef=1;
iopblo=3;
[x,uh]=elfin1d(fp,fq,ff,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);

% Test que verifica el programa para no simetría 
% [x,uh]=elfin1d(fp,fdp,fr,fq,ff,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);

% Términos para verificar la práctica 6.3
u=3*cos(x)+7*sin(x); error=u-uh; N=nel+1;
error_L2_1=sqrt(h*(error(1)^2/2+sum(error(2:N-1).^2)+error(N)^2/2))


% PRÁCTICA 6 ejercicio 4

clear all
global h 
% coefeicientes de la ecuación diferencial
al=0.15; an=0.2; A=al*an; L=10; E=21e10; densidad=7850; g=9.8;
fp=A*E; fq=0; ff=-densidad*g*A;     % signo menos en ff porque se trabaja a compresión
% extremos del intervalo
a=0; b=L;
% datos de las condiciones de contorno
datos_a=[1,0];
datos_b=[2,25];
% parámetro de refinamiento de la malla
nel=10000;
l=1;
iopcoef=1;
iopblo=1;
[x,uh]=elfin1d(fp,fq,ff,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
u=-densidad*g*A/(2*A*E).*x.^2+(25+densidad*g*A*L)/(A*E).*x; error=u-uh; N=nel+1;
error_L2_2=sqrt(h*(error(1)^2/2+sum(error(2:N-1).^2)+error(N)^2/2))

% Máxima compresión
d1= @(x,h) (x(3:end)-x(1:end-2))/(2*h);     % aprox. primera derivada
figure()
plot(x(2:end-1), A*E*d1(uh,x(2)-x(1)))
title('Esfuerzo normal')


% PRÁCTICA 6 ejercicio 5 (caso no simétrico)

clear all
global h

% coeficientes de la ecuación diferencial
p= @(t) ones(1,length(t));
dp= @(t) zeros(1,length(t));
r= @(t) t;
q= @(t) 1-t;
f= @(t) -t.^3+t.^2+4*t-2;
% extremos del intervalo
a=0; b=1;
% datos de las condiciones de contorno
datos_a=[1,0];
datos_b=[3,1,7];
% parámetro de refinamiento de la malla
nel=10000;
l=1;
iopcoef=2;
iopblo=3;
[t,uh]=elfin1dns(p,dp,r,q,f,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
u=t.^2+2*t; error=u-uh; N=length(t);
error_L2_3=sqrt(h*(error(1)^2/2+sum(error(2:N-1).^2)+error(N)^2/2))


% PRÁCTICA 6 ejercicio 6

clear all
global h

% coeficientes de la ecuación diferencial
L=10; Text=20;
% coeficiente si la malla es no compatible
% p=@fp;
% coeficiente si la malla es no compatible
p=@fpdom;
q=@fq;
f=@ff;
% extremos del intervalo
a=0; b=L;
% datos de las condiciones de contorno
datos_a=[1,50];
datos_b=[3,3,3*Text];
% parámetro de refinamiento de la malla
nel=500;
iopcoef=2;
iopblo=2;
% l=2;
% l=1;
traza='*+';
color='br';
datos_dom=[3,a,3,5,b];  % subdominio, lista de extremos
N=nel-1;
figure()
for l=1:2
   % [x,uh]=elfin1d(p,q,f,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
   [x,uh]=elfind1_o2_intconblokmultidom(p,q,f,datos_dom,datos_a,datos_b,N,l,iopcoef,iopblo);
   plot(x,uh,[traza(1),color(1)])
   hold on
end


% PRÁCTICA 6 ejercicio 7: utilizar elfin1dns.m


% PRÁCTICA 6 ejercicio 8

% esquema
D=1; U=1; gm=0.2; cin=100; L=10; p=2;
fp= @(t) D*ones(size(t));
fdp= @(t) zeros(size(t));
fr= @(t) U*ones(size(t));
fq= @(t) gm*ones(size(t));
ff= @(t) zeros*(size(t));
%...
[x,phi]=elfin1dNoLinealIF(fp,fq,ff,p,0,L,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit)
