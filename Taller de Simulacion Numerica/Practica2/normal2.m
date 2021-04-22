function z=normal2(u,x,ireg)
% Función que calcula la norma L^2 de una finción 1-D, u
% x : puntos de discretización de un intervalo definido por [a,b]=[x(1),x(length(x))].
%   Se supone que x es un vector ordenado de menor a mayor valor.
% u: valor de la función en los puntos de discretización de la variable x
% ireg:  es un parámetro opcional que indica si la discretización es
% regular o no
% ireg=0 si la malla no es regular
% ireg=1 si la malla es regular
% z : variable de salida con el valor de la norma L^2
    switch nargin
        case 2
            ipoint=0;
        case 3
            if ireg==0
                ipoint=0;
            elseif ireg==1
                ipoint=1; h=x(2)-x(1);
            else
                error('Argumento de entrada ireg incorrecto')
            end
        otherwise 
            error('Número de argumentos de entrada incorrectos')
    end

num_pas=length(x)-1;
z=0;
% cálculo del cuadrado de la función para obtener el integrando
integrando=u.^2;
if ipoint==1;
    z=((integrando(1)/2 + sum(integrando(2:num_pas) + integrando(num_pas+1)/2)*h));
else
    z=trapz(x,integrando);
end

z=sqrt(z);
end