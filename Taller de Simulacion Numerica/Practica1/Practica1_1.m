% PRACTICA 1 ejercicio 1

clear all
global h

% CÁLCULO DE LA SOLUCIÓN EXACTA

ecuacion='D2x=2*exp(t)-x';
condicion='x(0)=2,x(1)=exp(1)+cos(1)';
solucion=dsolve(ecuacion,condicion); % variable simbolica
solucion=simplify(solucion); %variable simbolica

% CÁLCULO DE LA SOLUCIÓN APROXIMADA
% coeficientes de la ecuación diferencial
fu=@u; fv=@v; fw=@w;
% fu=@(t) 2*exp(t); 

% extremos del intervalo
a=0; b=1;
% datos de las condiciones de contorno
alfa=2;
beta=exp(1)+cos(1);
% parámetros del refinamiento de la malla
num_pas=25;
[t,x_aprox]=diffin(fu,fv,fw,a,b,alfa,beta,num_pas);

% REPRESENATCIÓN GRÁFICA
figure (1)
  subplot(1,2,1)
  x_exact=subs(solucion,'t',t); % variable simbólica
  plot(t,x_exact), hold on
  plot(t,x_aprox,'r*');
  error_a=abs(x_exact-x_aprox);
  errorbar(t,x_exact,error_a)
  axis([0,1,2,exp(1)+cos(1)])
  legend('Sol. exacta','Sol. aprox','Error')
  hold off
  subplot(1,2,2)
  plot(t,x_exact), hold on
  plot(t,x_aprox,'r*');
  errorbar(t,x_exact,1.e4*error_a)
  legend('Sol. exacta','Sol. aprox','Error')
  title('10^4 Errores')
  hold off
  
% MÁXIMO ERROR ABSOLUTO Y RELATIVO
max_err_abs=norm(x_exact-x_aprox, Inf); % variable simbólica
max_err_abs=eval(max_err_abs)
max_err_rel=norm((x_exact-x_aprox)./x_exact,Inf); %variable simbólica
max_err_rel=eval(max_err_rel)

% CÁLCULO DEL ORDEN DE APROXIMACIÓN
vec_error=[]; vec_h=[];
for i=50:50:500
    h=(b-a)/i;
    num_pas=i;
    [t,x_aprox]=diffin(fu,fv,fw,a,b,alfa,beta,num_pas);
    x_exact=subs(solucion,'t',t);
    vec_error=[vec_error,max(abs(x_exact-x_aprox))];
    vec_h=[vec_h,h];
end
figure(2)
plot(log(vec_h),log(vec_error),'*'), hold on
xlabel('log(h)')
ylabel('log(maximo error)')
pol=polyfit(log(vec_h),double(log(vec_error)),1); % qué hace double??
plot(log(vec_h),polyval(pol,log(vec_h)),'g')
orden_aprox=pol(1)
legend('Logaritmo error calculado','Interpolación')
title(['Orden numérico del error =  ', num2str(pol(1))])
