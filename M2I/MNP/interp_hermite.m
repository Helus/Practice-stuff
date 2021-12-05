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
    juan=[ones(1,i),zeros(1,2*N-1-i)];
    vprod=juan.*dif;
    j=1; prod=1;
    while j<length(vprod) && abs(vprod(j))>tol
        prod=prod*vprod(j); j=j+1;
    end
    H=[H prod];
end

H=sum(Q.*H);
fprintf('valor de f(%4.3f)=%f\n',x_interp,H)