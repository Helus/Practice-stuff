clear all
close all

datos
N=length(x);
tol=1.e-10;

Q=hermite(x,fx,dfx);

dif=zeros(1,2*N-1);
for i=1:N-1
    dif(2*i-1)=x_interp-x(i);
    dif(2*i)= x_interp-x(i);
end
dif(end)=x_interp-x(end);

H=[1];
for i=1:(2*N-1)
    prod=1;
    for j=1:i
        prod=prod*dif(j);
    end
    
    H=[H prod];
end
s=sum(Q.*H);
fprintf('valor de f(%4.3f)=%f\n',x_interp,s)