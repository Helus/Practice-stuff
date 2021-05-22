function [x,t,Y]=evol_elfin1dNL(fp,fdp,fq,fr,ff,c0,p,a,b,datos_a,datos_b,nel,l,t0,T,npast,iopcoef,iopblo,tol,maxit,iopNL)
global xnodos phi0 Dt

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


Y = zeros(nel+1,npast+1); % matriz solucion (npas+1) x (npast+1); toda ceros, la primera columna es y0
Y(:,1)=c0(x);

if p==1
    % caso LINEAL
    for j=2:length(t)
        fp_Lin= @(x) Dt*fp(x);
        fdp_Lin= @(x) Dt*fdp(x);
        fr_Lin= @(x) Dt*fr(x);
        fq_Lin= @(x) (Dt*fq(x)+ones(1,length(x)));
        phi0=Y(:,j-1);
        ff_Lin=@ff_evol;
        [x,Y(:,j)] = elfin1dns(fp_Lin,fdp_Lin,fr_Lin,fq_Lin,ff_Lin,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo);
        % 				-p u''(x)+ru'(x)+q u(x)=f  en (a,b)
    end
    
%     elseif iopNL=='IF' 
%     % caso ITERACIÓN FUNCIONAL
%      for j=2:length(t)
%         fp_IF=fp;
%         fdp_IF= @(x) v(x,t(j));
%         fr_IF= @(x) w(x,t(j));
%         fq_IF= @(x) l(x,t(j))/Dt;
%         ff_IF= @(x) zeros(1,length(x));
%         phi0=Y(:,j-1);
%         % -(p(x)u'(x))'+r(x)u'(x)+q(x) u^p(x)=f  en (a,b)
%         [x,Y(:,j)]=elfin1dNoLinealIF(fp_IF,fdp_IF,fr_IF,fq_IF,ff_IF,p,a,b,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit);
%      end
%      if j==maxit
%         disp(['No hay convergencia para el tiempo t=',num2str(t0+j*Dt)])
%      end
% %      
% % elseif datNL.iopNL=='NW' 
% %     % caso NEWTON
% %     for j=2:length(t)
% %         up_N= @(x) u(x,t(j),datNL.p)-l(x,t(j)).*Y(:,j-1)'/Dt;
% %         vp_N= @(x) v(x,t(j));
% %         wp_N= @(x) w(x,t(j));
% %         lp_N= @(x) l(x,t(j))/Dt;
% %         alfap_N= datCC.alfa(t(j));
% %         betap_N= datCC.beta(t(j));
% %         [x,Y(:,j),k] = diffincNoLinealN_evol(lp_N,up_N,vp_N,wp_N,datNL.p,a,b,alfap_N,betap_N,...
% %             npas,datCC.iopc,datCC.gamma,datCC.delta,datNL.tol,datNL.maxit);
% %         if k==datNL.maxit
% %             disp(['No hay convergencia para el tiempo t=',num2str(t0+j*Dt)])
% %         end
% %     end
% %     



end
