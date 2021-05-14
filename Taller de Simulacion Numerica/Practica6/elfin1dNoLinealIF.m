function [x,phi]=elfin1dNoLinealIF(fp,fq,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit)
global phi0 p xnodos

nver=nel+1; % número de vértices
h=(b-a)/nel; % tamaño de discretización
nodos=l*nel+1;  % número total de grados de libertad
i=1:nver; x=a+(i-1)*h;

if l==1
    xnodos=x;
else
   xnodos=[];
   xmed=(x(1:nver-1)+x(2:nver))/2;
   for i=1:nver-1
       xnodos=[xnodos,x(i),xmed(i)];
   end
   xnodos=[xnodos,x(nver)];
end

phi0=ones(1,nodos); % iterante inicial

% Coeficiente en x(t) de la ecuación linealizada
fqIF=@(t) feval(fq,t).*feval(phi0,t).^(p-1);

for i=1:maxit
    % Resolución del modelo linealizado
    [x,phi]=elfin1d(fp,fqIF,ff,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
    phi2=phi0+(phi==0)*eps;
    error_rel=norm((phi-phi0)./phi2,Inf);
   
    if error_rel<tol
        fprintf(1,'Se ha alcanzado la convergencia en %5.0f iteraciones \n',i)
        return
    else 
        % Actualizanción del coefeiciente del modelo linealizado
        phi0=phi;
        fqIF=@(t) feval(fq,t).*feval(phi0,t).^(p-1);
    end 
end

if i==maxit
    disp('No hay convergencia')
    disp(['Nº iteraciones= ',num2str(i), ' error entre iterantes = ', num2str(error_rel)])
end

