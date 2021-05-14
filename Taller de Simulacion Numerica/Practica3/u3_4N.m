function z=u3_4N(t)
global p x_0
z=exp(t)-cos(t)-(exp(t)+cos(t)).^p;     % u del problema
z=z+(1-p)*x_0.^p;   % u de Newton