function [x,phi]=evol_elfin1dNoLinealIF(fp,fdp,fq,fr,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit)

% Para resolver en elfin1dns
%   -Dt*p*c''+ (q*phi0^(p-1)*Dt+1)*c + Dt*r*c' =Dt*f+phi0

global phi0 p xnodos Gamma Dt c0

nver=nel+1; % número de vértices
h=(b-a)/nel; % tamaño de discretización
Nodos=l*nel+1;  % número total de grados de libertad
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

phi0=ones(1,Nodos); % iterante inicial

% Coeficiente en x(t) de la ecuación linealizada
fq_IF=@evol_qIF;

for i=1:maxit
    % Resolución del modelo linealizado
    [x,phi]=elfin1dns(fp,fdp,fr,fq_IF,ff,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
    phi2=phi0+(phi0==0)*eps;
    error_rel=norm((phi-phi0)/phi2,Inf);
   
    if error_rel<tol
        fprintf(1,'Se ha alcanzado la convergencia en %5.0f iteraciones \n',i)
        return
    else 
    % Actualizanción del coefeiciente del modelo linealizado
    phi0=phi;
    end 
end

if i==maxit
    disp('No hay convergencia')
    disp(['Nº iteraciones= ',num2str(i), ' error entre iterantes = ', num2str(error_rel)])
end


end