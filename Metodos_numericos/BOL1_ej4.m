clear 

x0=[1;1];
options=optimset('TolFun',1.e-10,'TolX',1.e-10,'MaxIter',300,'Display','iter');
[solu,fval,isal] = fsolve(@h2,x0,options)
