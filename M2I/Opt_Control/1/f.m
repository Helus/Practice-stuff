% f: función a minimizar f(x)=5*sum_{i=1}^n i*x(i)^2

function z=f(x)
global xx;
n=length(x);
z=5*dot(x.^2,[1:n]);

xx=[xx; x];
end
