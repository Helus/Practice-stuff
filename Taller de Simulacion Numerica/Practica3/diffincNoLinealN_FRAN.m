% diffincNoLinealN de FRAN 
% no se utiliza en ninguna práctica pero es interesante

function [x,phi]=diffincNoLinealN(u,v,w,p,a,b,alfa,beta,num_pas,iopc,gamma,delta,tol,maxit,phi0)
uN= @(t) u(t)+(1-p)*v(t).*phi0.^p;
vN= @(t) p*v(t).*phi0.^(p-1);
d1= @(x,h) (x(3:end)-x(1:end-2))/(2*h); % aprox primera derivada
d2= @ (x,h) (x(3:end)-2*x(2:end-1)+x(1:end-2))/(h^2); % aprox. segunda derivada

for i=1:maxit
    [x,phi]=diffinc(uN,vN,w,a,b,alfa,beta,num_pas,iopc,gamma,delta);
    erx=norm((phi-phi0)./max(abs(phi0),eps),Inf);
    h=x(2)-x(1);
    ery=norm(d2(phi,h)-u(x(2:end-1))-v(x(2:end-1)).*phi(2:end-1).^p-w(x(2:end-1)).*d1(phi,h), Inf);
    if erx<tol || ery<tol
        disp(['Convergencia en ',num2str(i),' iteraciones'])
        return
    else
        phi0=phi;
        uN= @(t) u(t)+(1-p)*v(t).*phi0.^p;
        vN= @(t) p*v(t).* phi0.^(p-1);
    end
end