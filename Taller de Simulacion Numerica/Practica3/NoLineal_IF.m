% ITERACIÓN FUNCIONAL PARA PROBLEMAS NO LINEALES
% PRÁCTICA 3: ejercicios 1 y 2

clear all
global p x_0
syms t
solucion=exp(t)+cos(t);

% extremos del eje reactor
a=0; b=1;
% condiciones de contorno
gamma=-1; alfa=-1;
delta=1; beta=2*exp(1)-sin(1)+cos(1);

iopc=4;
fu=@u3_2IF;
fv=@v3_2IF;
fw=@w3_2IF;

p=2; % orden de la no linealidad
num_pas=1000;
maxit=200;
x_0=ones(1,num_pas+1);  % inicializando la solución
tol=1.e-6;  % tolerancia

% OPCIÓN 1

for j=1:maxit
    [td,xd]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,gamma,delta);
    xd_1=xd+(xd==0)*tol;
    error_rel=norm((xd_1-x_0)./xd_1,Inf);
    error_abs=norm(x_0-xd,Inf);
    
    % if error_abs<tol
    if error_rel<tol
        figure(1)
        plot(td,xd,'g*')
        title('Ejercicio 3.2: test académico; OPCIÓN 1')
        xlabel('Variable independiente t')
        ylabel('Variable dependiente x')
        % gtext(['Iteración funcional (p= ', num2str(p),')'])
        hold on
        x_exac=subs(solucion,'t',td);
        x_exacn=double(x_exac);
        plot(td,x_exacn)
        hold off
        error_max=norm(x_exacn-xd,Inf);
        error_rel_max=norm((x_exacn-xd)./x_exacn,Inf);
        disp('El algoritmo de iteración funcional ha convergido')
        disp(['nº iteraciones = ',num2str(j),' , Error máximo = ',num2str(error_max)])
        disp(['nº iteraciones = ',num2str(j),' , Error relativo máximo = ',num2str(error_rel_max)])
        break
    else 
        x_0=xd;
    end 
end

if j==maxit
    disp('No hay convergencia')
    disp(['Nº iteraciones= ',num2str(j), ' error entre iterantes = ', num2str(error_rel)])
end

% OPCIÓN 2

fv2=@v;
x_0=ones(1,num_pas+1);
[td,xd]=diffincNoLinealIF(fu,fv2,fw,p,a,b,alfa,beta,num_pas,iopc,gamma,delta,tol,maxit);
figure(2)
x_exacn=double(subs(solucion,'t',td));
plot(td,xd,'+',td,x_exacn)
title('Ejercicio 3.2: OPCIÓN 2')
error_rel_max=norm((x_exacn-xd)./x_exacn,Inf);
disp(['Error máximo = ',num2str(norm(x_exacn-xd,Inf))])
disp(['Error relativo máximo = ',num2str(error_rel_max)])

% CÁLCULO DE LA NORMA H1
d1= @(x,h) (x(3:end)-x(1:end-2))/(2*h);     % aproximación primera derivada
normH1=sqrt(trapz(td,(xd-x_exacn).^2)) + sqrt(trapz(td(2:end-1),d1(xd-x_exacn,td(2)-td(1)).^2));
disp(['Norma H1 del error: ', num2str(normH1)])

% REPRESENTACIÓN GRÁFICA CON h=0.1 Y h=0.01
[td1,xd1,i1]=diffincNoLinealIF(fu,fv2,fw,p,a,b,alfa,beta,(b-a)/0.1,iopc,gamma,delta,tol,maxit);
[td2,xd2,i2]=diffincNoLinealIF(fu,fv2,fw,p,a,b,alfa,beta,(b-a)/0.01,iopc,gamma,delta,tol,maxit);
x_exacn=double(subs(solucion,'t',td2));
figure(3)
plot(td2,x_exacn,'+',td1,xd1,td2,xd2)
legend('Exacta',['Aprox. Dx=0.1 it=',num2str(i1)], ['Aprox. Dx=0.01 it=',num2str(i2)])

