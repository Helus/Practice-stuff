% newton: función que calcula el iterante y_{n+q} a partir de los
% y_{n+q-1},...,y_n mediante el método de Newton.

function y1=newton(wq,h,x5,Y0,maxit,epsi,delta,m)

F=@(y) wq(1)*Y0(1,:)+wq(2)*Y0(2,:)+wq(3)*Y0(3,:)+wq(4)*Y0(4,:)+wq(5)*Y0(5,:)...
    +wq(6)*y -h*f(x5,y);
jacF=@(y) wq(6)*eye(m)-h*jacf(x5,y);
y0=Y0(5,:);
for i=1:maxit
    JF=jacF(y0);
    % y1=y0'-JF^(-1)*F(y0)';
    d=JF\(-F(y0)'); y1=d+y0'; 
    if norm(y1-y0',2)/(1+norm(y1,2))<epsi
        %fprintf(ofi,'\n\n* Convergencia: epsilon-test');
        return
    elseif norm(F(y1),2)<delta
        %fprintf(ofi,'\n\n* Convergencia: delta-test');
        return
    else
        y0=y1';
    end
end

end