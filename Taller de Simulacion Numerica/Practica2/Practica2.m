% PRÁCTICA 2.2

clear variables
%global h

% CÁLCULO DE LA SOLUCIÓN EXACTA
ecuacion='D2x=2*exp(t)-x';
condicion='Dx(0)-x(0)=-1, Dx(1)+x(1)=2*exp(1)-sin(1)+cos(1)';
solucion=dsolve(ecuacion,condicion);
solucion=simplify(solucion)

% CÁLCULO DE LA SOLUCIÓN APROXIMADA
%coeficientes de la ecuacion diferencial
iopc=4;
fu = @(t) 2*exp(t);
fv = @(t) -ones(size(t));
fw = @(t) zeros(size(t));

% extremos del intervalo
a=0; b=1;
% datos de las condiciones de contorno
gamma=-1; delta= 1;
alfa=-1; beta= 2*exp(1)+cos(1)-sin(1);
% parámetro de refinamiento de la malla
num_pas=240;

% CÁLCULO DE LA SOLUCIÓN 
[t,x_aprox,h]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,gamma,delta);

% REPRESENTACIÓN GRÁFICA
figure(1)
subplot(1,2,1);
x_exact=subs(solucion,'t',t);
x_exacn=double(x_exact);
%x_exacn=eval(x_exact)
plot(t,x_exacn), hold on
plot(t,x_aprox, 'r*')
error=abs(x_exacn-x_aprox);
errorbar(t, x_exacn, error)
axis([0,1,2,exp(1)+cos(1)])
legend('Sol. exacta', 'Sol. aproximada', 'Error')
hold off
subplot(1,2,2)
plot(t, x_exacn), hold on
plot(t, x_aprox,'r*')
errorbar(t,x_exacn,1.e4*error)
legend('Sol. exacta', 'Sol. aproximada', 'Error')
title('10^4 Errores')
hold off

% MÁXIMO ERROR ABSOLUTO Y RELATIVO
max_err_abs=norm(x_exacn-x_aprox, Inf)
max_err_relat=norm((x_exacn-x_aprox)./x_exacn, Inf)

% CÁLCULO DE LA NORMA L2 DEL ERROR ABSOLUTO DE LA SOLUCIÓN
error=x_exacn-x_aprox;
norma= normal2(error,t);    %norma= sqrt(trapz(t, error.^2));
disp(['La norma L2 del error absoluto es ' num2str(norma)])

% CÁLCULO DE LA NORMA L2 DEL ERROR ABSOLUTO DE LA DERIVADA DE LA SOLUCIÓN
dersolucion=diff(solucion);
derx_exact=subs(dersolucion,'t',t);
derx_exacn=double(derx_exact);
derx_aprox=(x_aprox([3:num_pas+1])-x_aprox([1:num_pas-1]))/(2*h);
% Por si los puntos no son equidistantes:
% derx_aprox=(x_aprox([3:num_pas+1])-x_aprox([1:num_pas-1]))./(t(3:num_pas+1)-t(1:num_pas-1));
errorder=derx_exacn(2:num_pas)-derx_aprox;
normader= normal2(errorder,t(2:num_pas));   % sqrt(trapz(t(2:num_pas), errorder.^2)) 
disp(['La norma L2 del error absoluto en la derivada es ' num2str(normader)])
% text=sprintf('La norma L2 del error absoluto en la derivada es %d', normader);
% disp(texto)

% ORDEN NUMÉRICO
vn=50:50:500;
verr=zeros(size(vn));
vh= (b-a)./vn;
for i=1:length(vn)
   [tt,xa]=diffinc(fu,fv,fw,a,b,alfa,beta,vn(i),iopc,gamma,delta);
   verr(i)=norm(double(subs(solucion, 't',tt))-xa, Inf);
end
pol=polyfit(log(vh),log(verr),1);
disp(['Orden numérico ' num2str(pol(1))])