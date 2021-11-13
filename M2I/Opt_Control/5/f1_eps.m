function [c,ceq]=f1_eps(x)
eps=1.e-6;

c=4*x(1)^2+4*x(2)^2-eps;
ceq = [];
end