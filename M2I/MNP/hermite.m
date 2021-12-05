function Q=hermite(x,fx,dfx)
% Q=hermite(x,fx,dfx)
%
% Permite obetener los coeficientes del polinomio de interpolación de
% Hermite H(x) en (n+1) nodos distintos x0,...,xn para la función f.
%
% INPUT: x=[x0,...,xn]
%        fx=[f(x0),...,f(xn)]
%        dfx=[df(x0),...,df(xn)]
%
% OUTPUT: Q=[Q00, Q11,..., Q(2n+1)(2n+1)]

N=length(x);
QQ=zeros(2*N,2*N);
z=zeros(1,2*N);

for i=1:N
    z(2*i-1)=x(i);
    z(2*i)=x(i);
    z(end)=x(i);
    QQ(2*i-1,1)=fx(i);
    QQ(2*i,1)=fx(i);
    QQ(end,1)=fx(i);
    QQ(2*i,2)=dfx(i);
    if i~=1
        QQ(2*i-1,2)=(QQ(2*i-1,1)-QQ(2*i-2,1))/(z(2*i-1)-z(2*i-2));
    end    
end

for i=3:(2*N)
    for j=3:i
       QQ(i,j)=(QQ(i,j-1)-QQ(i-1,j-1))/(z(i)-z(i-j+1)); 
    end
end

Q=diag(QQ)';