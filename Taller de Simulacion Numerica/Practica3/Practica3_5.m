% PRACTICA 3: ejercicio 5 

clear all
global L D U c_in p Gamma
num_pas=1000;
L=10; D=1; U=1; c_in=100; Gamma=0.2; a=0; b=L;
p=4;
gamma=-U/D; alfa=-U*c_in/D;
delta=0; beta=0;
iopc=4;
maxit=1000;
tol=1.e-4;

% OPCIÓN 2
[x,ch]=diffincNoLinealN(@u3_3IF,@v3_3IF,@w3_3IF,p,a,b,alfa,beta,num_pas,iopc,gamma,delta,tol,maxit);
plot(x,ch)
title=('Concentración a a lo largo del reactor (mol/m^3): OPCIÓN 2')
