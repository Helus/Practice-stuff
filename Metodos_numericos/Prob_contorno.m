# Programa que resuleve el PROBLEMA DEL CONTORNO

clear
close all

c=@(x) x ;
f=@(x) exp(x)*(1+2*x-x^2) ; %hacer un vector de f  
u_ex=@(x) exp(x).*(1-x); 

datos=load('datos1.txt');
ndim=datos(1); a=datos(2); b=datos(3); alfa=datos(4); beta=datos(5);

h=(b-a)/(ndim+1);
x=(a+h):h:(b-h);

I=[1:ndim,1:(ndim-1),2:ndim];
J=[1:ndim,2:ndim,1:(ndim-1)];
V=[2*ones(1,ndim)+h*h*c(x),-ones(1,ndim-1),-ones(1,ndim-1)];

A=sparse(I,J,V);
F=zeros(ndim,1);
F(1)=(f(x(:,1)))*h*h+alfa;
F(ndim)=(f(x(:,ndim)))*h*h+beta;
for i=2:(ndim-1)
  F(i)=(f(x(:,i)))*h*h;  
end
u=A\F ;  %resolver el sistema

for i=1:ndim %calculo del error
  error(i)=u(i)-u_ex(x(:,i));
end
fprintf('Error=%e \r\n',norm(error,Inf));
plot(x,u,'o',x,u_ex(x));