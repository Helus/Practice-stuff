function y = evol_qN(t)
global xnodos phi0 p Dt Gamma
[v,i] = min(abs(xnodos-t)); %calcula la componente de xnodos mas cercana a t
if t < xnodos(i)
    i0 = i-1; i1 = i;
else
    i0 = i; i1 = i+1;
end
phi0t = interp1([xnodos(i0),xnodos(i1)], [phi0(i0),phi0(i1)], t);
y = -q(t)*phi0t^(p-1)*Dt*p+1; % el menos en la q es porque q(t)= -Gamma*...

end