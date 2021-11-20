% newton: función que calcula el iterante y_{n+1} a partir del y_n mediante
% el método de Newton.

function y1=newton(theta,h,x0,x1,y0,maxit,epsi,delta,m,ofi)

F=@(y) y-y0-h*(theta*f(x0,y0)+(1-theta)*f(x1,y));
jacF=@(y) eye(m)-h*(1-theta)*jacf(x1,y);
y0=y0+h*f(x0,y0);
for i=1:maxit
    JF=jacF(y0);
    % y1=y0'-JF^(-1)*F(y0)';
    d=JF\(-F(y0)'); y1=d+y0'; 
    if norm(y1-y0',2)/(1+norm(y1,2))<epsi
        fprintf(ofi,'\n\n* Convergencia: epsilon-test');
        return
    elseif norm(F(y1),2)<delta
        fprintf(ofi,'\n\n* Convergencia: delta-test');
        return
    end
end

end