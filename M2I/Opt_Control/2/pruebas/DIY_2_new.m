clear all; close all;
global xx;
xx=[];


% APARTADO 1

f=@(x) (x(1)-6)^2+(x(2)-7)^2;
options=optimset('Display','iter');%,'PlotFcns',@optimplotfval);
%n=2;
v0=[1 2]; 

disp('Solución con fminunc')
[vmin,fmin] =fminunc(f,v0,options)

figure()
x = -2:.1:12;
y = -2:.1:12;
[v1,v2] = meshgrid(x,y); F=(v1-6).^2 +(v2-7).^2; contour(v1,v2,F,20),hold on

title('Mínimo sin restricciones')
plot(vmin(1),vmin(2),'ko','MarkerSize',8,'MarkerFaceColor',[1 0 0])
hold off


% APARTADO 2
tic

mu_range=[0.1 1 10 100 1000]; % rango de los pesos

V=[];
F_MIN1=f(v0); % F_MIN1 será el valor mínimo de f entre todos los puntos vmin que vayamos calculando
V_MIN1=v0; % V_MIN1 será el punto que minimice a f entre todos los calculados
index=1;

% probando con todas las opciones posibles de mu_range para encontrar los mejores pesos posibles 
for i=1:length(mu_range)
    for j=1:length(mu_range)
        for k=1:length(mu_range)
            for l=1:length(mu_range)
                fp =@(x) (x(1)-6)^2+(x(2)-7)^2+...
                    mu_range(i)*max([0 (-3*x(1)-2*x(2)+6)^2]) +...
                    mu_range(j)*max([0 (-x(1)+x(2)-3)^2]) +...
                    mu_range(k)*max([0 (x(1)+x(2)-7)^2]) +...
                    mu_range(l)*max([0 (2/3*x(1)-x(2)-4/3)^2]);
                
                [vmin,fmin]=fminunc(fp,v0,options);
                factible=test_DIY2(vmin');
                if factible 
                    V(index,:)=vmin;
                    index=index+1;
                   if f(vmin)<F_MIN1
                       F_MIN1=f(vmin);
                       V_MIN1=vmin;
                       i_opt=i; j_opt=j; k_opt=k; l_opt=l;
                   end
                end
            end
        end
    end
end

figure(1)
contour(v1,v2,F,20), hold on
for i=1:length(V(:,1))
    plot(V(i,1),V(i,2),'bo'), hold on
end
plot(V_MIN1(1),V_MIN1(2),'ko','MarkerSize',8,'MarkerFaceColor',[1 0 0]), hold on
plot(x,(6-3*x)/2,'k','Linewidth',1), hold on % restricción 1
plot(x,x+3,'k','Linewidth',1), hold on % restricción 2
plot(x,7-x,'k','Linewidth',1), hold on % restricción 3
plot(x,2/3*x-4/3,'k','Linewidth',1), hold on % restricción 4
axis([-2 12 -2 12])
title('Mínimo con penalizaciones cuadráticas')
hold off

t_quad=toc;

% presentación de resultados
disp('MÉTODO DE PENALIZACIONES CUADRÁTICAS')
fprintf('v_min=[ '); fprintf('%g ', V_MIN1); fprintf('] \n');
fprintf('f(v_min)= %f\n',f(V_MIN1))
fprintf('Valores de los pesos mu_i en el óptimo: \n')
fprintf('mu_1= %4.1f \n',mu_range(i_opt))
fprintf('mu_2= %4.1f \n',mu_range(j_opt))
fprintf('mu_3= %4.1f \n',mu_range(k_opt))
fprintf('mu_4= %4.1f \n',mu_range(l_opt))
fprintf('\n')


% APARTADO 3

% Barrera inversa
tic

mu_range=[0.01:0.01:1 10 100];

V=[];
F_MIN2=f(v0);
V_MIN2=v0;
index=1;

for i=1:length(mu_range)
    fp =@(x) (x(1)-6)^2+(x(2)-7)^2 - 1/mu_range(i)*(...
        (-3*x(1)-2*x(2)+6)^(-1) +...
        (-x(1)+x(2)-3)^(-1) +...
        (x(1)+x(2)-7)^(-1) +...
        (2/3*x(1)-x(2)-4/3)^(-1));
    [vmin,fmin] =fminunc(fp,v0,options);
    factible=test_DIY2(vmin');
    if factible 
        V(index,:)=vmin;
        index=index+1;
        if f(vmin)<F_MIN2
            F_MIN2=f(vmin);
            V_MIN2=vmin;
            i_opt=i;
        end
    end
end

figure(2)
contour(v1,v2,F,20),hold on
for i=1:length(V(:,1))
    plot(V(i,1),V(i,2),'bo'), hold on
end
plot(V_MIN2(1),V_MIN2(2),'ko','MarkerSize',8,'MarkerFaceColor',[1 0 0]), hold on
plot(x,(6-3*x)/2,'k','Linewidth',1), hold on % restricción 1
plot(x,x+3,'k','Linewidth',1), hold on % restricción 2
plot(x,7-x,'k','Linewidth',1), hold on % restricción 3
plot(x,2/3*x-4/3,'k','Linewidth',1), hold on % restricción 4
axis([-2 12 -2 12])
title('Mínimo con método de barrera inversa')
hold off

t_inv=toc;

% presentación de resultados
disp('MÉTODO BARRERA INVERSA')
fprintf('v_min=[ '); fprintf('%g ', V_MIN2); fprintf('] \n');
fprintf('f(v_min)= %f\n',f(V_MIN2))
fprintf('Valor del peso mu en el óptimo: \n')
fprintf('mu= %4.3f \n',mu_range(i_opt))
fprintf('\n')


% Barrera log
tic

mu_range=[0.1 10 100:100:1e4];

V=[];
F_MIN3=f(v0);
V_MIN3=v0;
index=1;

for i=1:length(mu_range)
    fp =@(x) (x(1)-6)^2+(x(2)-7)^2 - 1/mu_range(i)*(...
        log((-3*x(1)-2*x(2)+6)*(-1)) +...
        log((-x(1)+x(2)-3)*(-1)) +...
        log((x(1)+x(2)-7)*(-1)) +...
        log((2/3*x(1)-x(2)-4/3)*(-1)));
    [vmin,fmin] =fminunc(fp,v0,options);
    factible=test_DIY2(vmin');
    if factible 
        V(index,:)=vmin;
        index=index+1;
        if f(vmin)<F_MIN3
            F_MIN3=f(vmin);
            V_MIN3=vmin;
            i_opt=i;
        end
    end
end

figure(3)
contour(v1,v2,F,20),hold on
for i=1:length(V(:,1))
    plot(V(i,1),V(i,2),'bo'), hold on
end
plot(V_MIN3(1),V_MIN3(2),'ko','MarkerSize',8,'MarkerFaceColor',[1 0 0]), hold on
plot(x,(6-3*x)/2,'k','Linewidth',1), hold on % restricción 1
plot(x,x+3,'k','Linewidth',1), hold on % restricción 2
plot(x,7-x,'k','Linewidth',1), hold on % restricción 3
plot(x,2/3*x-4/3,'k','Linewidth',1), hold on % restricción 4
axis([-2 12 -2 12])
title('Mínimo con método de barrera log')
hold off

t_log=toc;

% presentación de resultados
disp('MÉTODO BARRERA LOG')
fprintf('v_min=[ '); fprintf('%g ', V_MIN3); fprintf('] \n');
fprintf('f(v_min)= %f\n',f(V_MIN3))
fprintf('Valor del peso mu en el óptimo: \n')
fprintf('mu= %5.1f \n',mu_range(i_opt))
fprintf('\n')


% RESULTADOS FINALES

disp('TIEMPOS DE LOS MÉTODOS (s)')
fprintf('Tiempo penalizaciones cuadráticas: %4.5f \n',t_quad)
fprintf('Tiempo barrera inversa: %4.5f \n',t_inv)
fprintf('Tiempo barrera log: %4.5f \n',t_log)
fprintf('\n')