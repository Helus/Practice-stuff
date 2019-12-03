% Problema  que realiza el ajuste de MINIMOS CUADRADOS

clear

fid=fopen('datos_MinCuad.txt','r');

[A,b]=load_datos_MinCuad; % funcion que carga los datos

% resolucion del problema
[m,n]=size(A);

[Q,R]=qr(A);
b=Q'*b;
x(1:n)=triu(R(1:n,1:n))\(b(1:n)); % solucion

% calculo del error
err=norm(b(n+1:m),2);
fprintf('Solucion x= \n');
fprintf('%f \n', x);
fprintf('Error= %e \r\n',err);
if(m>n)
  fprintf('Residuo vectorial= \n');
  display(b(n+1:m)); # residuo escalar
end
fclose(fid);