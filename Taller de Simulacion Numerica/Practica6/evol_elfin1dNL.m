function [x,t,Y]=evol_elfin1dNL(fp,fdp,fq,fr,ff,c0,p,a,b,datos_a,datos_b,nel,l,t0,T,npast,iopcoef,iopblo,tol,maxit,iopNL)
global xnodos phi0 Dt Gamma c0

Dt = (T-t0)/npast;  % incremento de tiempo
t = t0+[0:npast]*Dt; 
nver=nel+1; % numero de vértices
h=(b-a)/nel; % tamaño de la discretizacion
j=1:nver; x=a+(j-1)*h;

if l==1
    xnodos=x;
else
   xnodos=[];
   xmed=(x(1:nver-1)+x(2:nver))/2;
   for j=1:nver-1
       xnodos=[xnodos,x(j),xmed(j)];
   end
   xnodos=[xnodos,x(nver)];
end


Y = zeros(nel+1,npast+1); % matriz solucion (nel+1) x (npast+1); toda ceros, la primera columna es y0
Y(:,1)=c0(x);

if p==1
    % caso LINEAL
    for j=2:length(t)
        % -pu''+ru'+q(x)u=f 
        fp_Lin= @(x) Dt*fp(x);
        fdp_Lin= @(x) Dt*fdp(x);
        fr_Lin= @(x) Dt*fr(x);
        fq_Lin= @(x) (Dt*fq(x)+ones(1,length(x)));
        c0=Y(:,j-1);
        ff_Lin=@ff_evol;
        [x,Y(:,j)] = elfin1dns(fp_Lin,fdp_Lin,fr_Lin,fq_Lin,ff_Lin,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
        % 				-p u''(x)+ru'(x)+q u(x)=f  en (a,b)
    end
    
    elseif iopNL=='IF' 
    % caso ITERACIÓN FUNCIONAL
     for j=2:length(t)
        % -pu''+ru'+q(x)u^p=f 
        fp_IF= @(x) Dt*fp(x);
        fdp_IF= @(x) Dt*fdp(x);
        fr_IF= @(x) Dt*fr(x);
        c0=Y(:,j-1);
        [x,Y(:,j)]=evol_elfin1dNoLinealIF(fp_IF,fdp_IF,fq,fr_IF,@ff_evol,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit);
     end
     
     
elseif iopNL=='NW' 
    % caso NEWTON
    for j=2:length(t)
        % -pu''+ru'+q(x)u^p=f 
        fp_N= @(x) Dt*fp(x);
        fdp_N= @(x) Dt*fdp(x);
        fr_N= @(x) Dt*fr(x);
        c0=Y(:,j-1);
        [x,Y(:,j)] = evol_elfin1dNoLinealN(fp_N,fdp_N,fq,fr_N,ff,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit);
    end
    



end
