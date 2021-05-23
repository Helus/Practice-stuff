function y = ff_evol(t)
global xnodos c0 Dt
[v,i] = min(abs(xnodos-t)); %calcula la componente de xnodos mas cercana a t
if t < xnodos(i)
    i0 = i-1; i1 = i;
else
    i0 = i; i1 = i+1;
end
phi0t = interp1([xnodos(i0),xnodos(i1)], [c0(i0),c0(i1)], t);
y = Dt*f(t)+phi0t;
end