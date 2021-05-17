function y = dpN(t)
global xnodos phi0 p dphi0
[v,i] = min(abs(xnodos-t)); %calcula la componente de xnodos mas cercana a t
if t < xnodos(i)
    i0 = i-1; i1 = i;
else
    i0 = i; i1 = i+1;
end
dphi0= (phi0(3:end)-phi0(1:end-2))/(2*(xnodos(2)-xnodos(1)));
phi0t = interp1([xnodos(i0),xnodos(i1)], [phi0(i0),phi0(i1)], t);
%dphi0t = interp1([xnodos(i0),xnodos(i1)], [dphi0(i0),dphi0(i1)], t);
%y = dfp(t)+(1-p)*(dq(t)*phi0t^p+ p*q(t)*phi0t^(p-1)*dphi0t);
y = dfp(t)+(1-p)*dq(t)*phi0t^p;
end