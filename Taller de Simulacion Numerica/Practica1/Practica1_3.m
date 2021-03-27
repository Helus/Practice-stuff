% PRÁCTICA 1 ejercicio 3

clear all
global h
figure(1)
ecuacion='D2T+2/r*DT=0';
condicion='T(1)=0, T(2)=100';
solucion=dsolve(ecuacion,condicion,'r');
solucion=simplify(solucion)

% CALCULO DE LA SOLUCIÓN APROXIMADA
% fu=@u2; fv=@v2; fw=@w2;
fu=@(t) zeros(1,length(t)); fv=@(t) zeros(1,length(t)); fw=@(t) -2./t;

% extremos del intervalo
a=1; b=2;

% datos de las condiciones de contorno
alfa=0;
beta=100;

% parámetro del refinamiento de la malla
num_pas=100;
[r,T_aprox]=diffin(fu,fv,fw,a,b,alfa,beta,num_pas);

% MÁXIMO ERROR ABSOLUTO Y RELATIVO
T_exact=subs(solucion,'r',r);
max_err_abs=norm(T_exact-T_aprox, Inf)         % cómo pongo la expresion en decimales??

% REPRESENTACIÓN GRÁFICA

    % cómo funciona meshgrid
    % [X,Y]=meshgrid(linspace(-1,1,20), linspace(-2,2,20));
    % Z= X.^2+Y.^2;
    % figure()
    % mesh(X,Y,Z)
    
theta=linspace(0,2*pi,length(r)); % linspace('valor inicial','valor final','nº de puntos')
% X=r'*cos(theta); Y=r'sin(theta);
[R,Th]=meshgrid(r,theta); % coordenadas polares
X=R.*cos(Th);
Y=R.*sin(Th);
Z=zeros(length(r));
for k=1:length(r)
   Z(k,:)=T_aprox;
end
contourf(X,Y,Z)
colorbar('horiz')
title('Difusion del calor en cada meridiano')
xlabel('X'); ylabel('Y');
axis equal

% NORMA EN L2
% Del error en la variable radial
error=eval(T_exact-T_aprox);
norma=normal2(error,r,1);
texto=sprintf('La norma L^2 del error en la variable radial es %d',norma);
disp(texto)
% Del error en la corona esférica
norma=normal2(error.*r,r,1);
norma=(norma^2*4*pi)^0.5;
texto=sprintf('La norma L^2 del error en la corona esférica es %d',norma);
disp(texto)

% disp(['Norma L2(I): ' num2str(double(sqrt(trapz(r, (T_exact-T_aprox).^2))))]) % norma de L2(I)
% disp(['Norma L2(B): ' num2str(double(sqrt(4*pi*trapz(r, (r.*(T_exact-T_aprox)).^2))))]) % norma de L2(B)

