% fixedpoint: función que calcula el iterante y_{n+1} a partir del y_n mediante
% el método del punto fijo.

function y1=fixedpoint(theta,h,x0,x1,y0,maxit,epsi,ofi) 

F=@(y) y0+h*(theta*f(x0,y0)+(1-theta)*f(x1,y));
for i=1:maxit
    y1=(F(y0))';
    if norm(y1-y0',2)/(1+norm(y1,2))<epsi
        fprintf(ofi,'\n\n* Convergencia: epsilon-test');
        return
    end
end

end