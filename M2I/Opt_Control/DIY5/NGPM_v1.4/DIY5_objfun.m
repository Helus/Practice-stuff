function [y, cons] = DIY5_objfun(x)
y = [0,0];
cons = [];
y(1) = 4*x(1)^2+4*x(2)^2;
y(2) = (x(1)-5)^2+(x(2)-5)^2;
end