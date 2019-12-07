% Programa que resuleve el PROBLEMA DEL CONTORNO con expresion
% u''(x)+p(x)u'(x)+q(x)u(x)=f(x)

% Es de orden 1 (lineal) (la 1ª derivada tiene peor aproximacion que la 2ª)

clear
close all

p=@(x) -1./x ;
q=@(x)  1./x.^2;
f=@(x) -1./x ;  
u_ex=@(x) (-2*log(2)/3)*x+(2*log(2)/3)./x+x.*log(x)/2 ;

ndim=100; a=1 ; b=2 ; alfa=0; beta=0 ;

h=(b-a)/(ndim+1);
x=(a+h):h:(b-h);

I=[1:ndim,1:(ndim-1),2:ndim];
J=[1:ndim,2:ndim,1:(ndim-1)];
V=[2*ones(1,ndim)+q(x)*h*h,(h/2)*p(x(1:ndim-1))-ones(1,ndim-1),(-h/2)*p(x(2:ndim))-ones(1,ndim-1)];

A=sparse(I,J,V);
F=zeros(ndim,1);
F(1)=(f(x(:,1)))*h*h+alfa-(h/2)*p(x(1)) ;
F(ndim)=(f(x(:,ndim)))*h*h+beta-(h/2)*p(x(ndim));
for i=2:(ndim-1)
  F(i)=(f(x(:,i)))*h*h;  
end
u=A\F ;  %resolver el sistema

for i=1:ndim %calculo del error
  error(i)=u(i)-u_ex(x(:,i));
end
fprintf('Error=%e \r\n',norm(error,Inf));
plot(x,u,'o',x,u_ex(x));

% EDOS de prueba:
%1)

% p=@(x) 5 ;
% q=@(x) -4 ;
% f=@(x) -exp(4*x) ;  
% u_ex=@(x) (2/3)*exp(4*x)+x.*exp(4*x)/3 ; 

% ndim=100; a=0 ; b=1 ; alfa=2/3; beta=exp(4) ;

% 2) 

% p=@(x) -1./x ;
% q=@(x)  1./x.^2;
% f=@(x) -1./x ;  
% u_ex=@(x) (-2*log(2)/3)*x+(2*log(2)/3)./x+x.*log(x)/2 ;

% ndim=100; a=1 ; b=2 ; alfa=0; beta=0 ;