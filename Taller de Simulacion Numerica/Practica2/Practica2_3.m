% PRÁCTICA 2: ejercicio 3
clear all

% CÁLCULO DE LA SOLUCIÓN EXACTA
syms x d U Gamma c c_in L
solucion=dsolve('d*D2c-U*Dc-Gamma*c==0','-d*Dc(0)+U*c(0)==U*c_in','Dc(L)==0',x);
simplify(solucion); % descomentar para ver la solución
solucion=subs(solucion,{d,U,Gamma,c_in,L},{1,1,0.2,100,10});
simplify(solucion); % descomentar para ver la solución
fplot(solucion,[0,10])
clear d U Gamma c c_in L

% CÁLCULO DE LA SOLUCIÓN APROXIAMDA
global L D U c_in Gamma
h=0.125;    % parámetro de refinamiento de malla
fu=@u; fv=@v ; fw=@w;   % datos de la ecuación normalizada
% coeficientes del reactor
L=10;   % longitud del reactor (m) 
D=1;    % coeficiente de la ley de difusión de Fick (m^2/h)
U=1;    % velocidad del agua que fluye a través del tanque(m/h)

a=0; b=L;   % extremos del tanque 
num_pas=round(L/h); %número de pasos

% datos de las condiciones de contorno
c_in=100;   % flujo de entrada en x=0 con concentración constante (mol/m^3)
Gamma=0.2;  % coeficiente de decaimiento de la reacción (h^(-1))
gamma=-U/D; alfa=-U*c_in/D; delta=0; beta=0;
iopc=4;

% cálculo de la solución aproximada
[x,chD1]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,gamma,delta);

% REPRESENTACIÓN GRÁFICA DE LA SOLUCIÓN EXACTA FRENTE A LA APROXIMADA
plot(x,chD1,'b*')
% gtext('D=1')  % con un puntero nos permite indicar la localización del texto sobre la gráfica
hold on
sol_exact=subs(solucion,'x',x);
sol_exacn=double(sol_exact);
plot(x,sol_exacn,'g')

% INFLUENCIA DEL COEFICIENTE DE DIFUSIÓN DE FICK
D=4;
% nuevos datos de las condiciones de contorno
gamma=-U/D; alfa=-U*c_in/D;
[x,chD4]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,gamma,delta);
plot(x,chD4,'r')
% gtext('D=4')
% title
% xlabel
% ylabel
hold off

% CREACIÓN DE LA TABLA
D=1;    % se corresponde a valores de D=1
gamma=-U/D; alfa=-U*c_in/D;
% cálculo del número de pasos para cada uno de los Delta_x dado
num_pas=round([L/0.125; L/0.25; L/2.5]);
disp('Concentración en el reactor en x=7.5m')
disp('_______________________________________')
texto=sprintf('h (m) \t\t\t c (mol/m^3)');
disp(texto)
texto=sprintf('Valor exacto \t\t %6.4f ', subs(solucion,'x',7.5));
disp(texto)
for i=1:3
    [y,chD1h]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas(i),iopc,gamma,delta);
    [valor,j]=min(abs(y-7.5)); % identificamos la componente más próxima a 7.5
    h=(b-a)/num_pas(i);
    texto=sprintf('%4.3f \t \t \t %6.4f', h, chD1h(j));
    disp(texto)
end 

% CÁLCULO DE LA DENSIDAD DE FLUJO
D=1;
gamma=-U/D; alfa=-U*c_in/D;
num_pas=150;
[x,ch,h]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,delta);
derx_aprox=(ch([3:num_pas+1])-ch([1:num_pas-1]))/(2*h);
plot(x(2:num_pas),-D*derx_aprox,'r')
% gtext
% title
% xlabel
% ylabel
hold off

% INESTABILIDADES
D=0.01; gamma=-U/D; alfa=-U*c_in/D;
num_pas=5;
[x,ch]=diffinc(fu,fv,fw,a,b,alfa,beta,num_pas,iopc,delta);
plot(x,ch,'g')
hold on
