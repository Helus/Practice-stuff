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


