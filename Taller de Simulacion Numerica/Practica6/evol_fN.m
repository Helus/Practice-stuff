function y = evol_fN(t)
global xnodos c0 Dt p phi0
[v,i] = min(abs(xnodos-t)); %calcula la componente de xnodos mas cercana a t
if t < xnodos(i)
    i0 = i-1; i1 = i;
else
    i0 = i; i1 = i+1;
end
c0t = interp1([xnodos(i0),xnodos(i1)], [c0(i0),c0(i1)], t);
phi0t = interp1([xnodos(i0),xnodos(i1)], [phi0(i0),phi0(i1)], t);
y = Dt*f(t)+c0t-(p-1)*Dt*q(t)*phi0t^p;  % el menos en la q es porque q(t)= -Gamma*...
end