% Problema  que realiza el ajuste a un polinomio por MINIMOS CUADRADOS

clear

fid=fopen('datos_MinCuad.txt','r');

[A,b]=load_datos_MinCuad_polyfit; % funcion que carga los datos

% resolucion del problema
[m,n]=size(A);

[Q,R]=qr(A);
b=Q'*b;
sol(1:n)=triu(R(1:n,1:n))\(b(1:n)); % solucion

% calculo del error
err=norm(b(n+1:m),2);
fprintf('Solucion x= \n'); % mirar en load_datos_MinCuad_polyfit para el ajuste exacto
fprintf('%e \n', sol);
fprintf('Error= %e \r\n',err);
if(m>n)
  display(b(n+1:m)); # residuo escalar
end
fclose(fid);