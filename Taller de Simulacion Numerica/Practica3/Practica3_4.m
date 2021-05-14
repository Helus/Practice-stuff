% PRACTICA 3: ejercicio 4

clear variables
global p x_0
syms t
solucion=exp(t)+cos(t);

% extremos del reactor
a=0; b=1;

% datos de las condiciones de contorno
gamma=-1; alfa=-1; delta=1; beta=2*exp(1)-sin(1)+cos(1);
iopc=4;

% datos de la ecuación normalizada
fu=@u3_4N;
fv=@v3_4N;
fw=@w3_4N;    % en este caso es 0

p=2;    %orden de la no linealidad
num_pas=1000;   % parámetro de refinamiento de malla
maxit=200;  % número máximo de iteraciónes
tol=1.e-6;  % tolerancia

x_0=ones(1, num_pas+1);     %inicialización de la solución

% OPCIÓN 1

for i=1:maxit
    [td,xd]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,gamma,delta);
    xd_1=xd+(xd==0)*tol;
    error_rel=norm((xd_1-x_0)./xd_1,Inf);
    error_abs=norm(x_0-xd,Inf);
        if error_rel<tol
           figure(1)
           plot(td,xd,'g*')
           title('Ejercicio 3.4: test académico OPCIÓN 1')
           xlabel('Variable independiente t')
           ylabel('Variable dependiente x')
           % gtext(['Método de Newton (p= )', num2str(p),')'])
           hold on
           x_exac=subs(solucion,'t',td);
           x_exacn=double(x_exac)
           error_max=norm(x_exacn-xd,Inf);
           error_rel_max=norm((x_exacn-xd)./x_exacn,Inf);
           disp('El algoritmo de Newton ha convergido')
           disp(['nº de iteraciones= ', num2str(i),' Error máximo ',num2str(error_max)])
           disp(['nº de iteraciones= ', num2str(i),' Error relativo máximo ',num2str(error_rel_max)])
           break
        else
            x_0=xd;
        end
end
if i==maxit
    disp('El algoritmo de Newton no ha convergido')
    disp(['nº de iteraciones= ', num2str(i),' Error relativo ',num2str(error_rel)])
end

% OPCIÓN 2

x_0=ones(1,num_pas+1);

fu2=@u;
fv2=@v;
fw2=@w;

[td,xd]=diffincNoLinealN(fu2,fv2,fw2,p,a,b,alfa,beta,num_pas,iopc,gamma,delta,tol,maxit);
figure(2)
plot(td,xd,'r*')
title('Ejercicio 3.4: OPCIÓN 2')
xlabel('Variable independiente t')
ylabel('Variable dependiente x')
% gtext(['Método de Newton (p= )', num2str(p),')'])
hold on
x_exac=subs(solucion,'t',td);
x_exacn=double(x_exac);
plot(td,x_exacn)
error_max=norm(x_exacn-xd,Inf);
error_rel_max=norm((x_exacn-xd)./x_exacn,Inf);
disp(['Error máximo = ',num2str(norm(x_exacn-xd,Inf))])
disp(['Error relativo máximo = ',num2str(error_rel_max)])

