clear

f=@(x) cos(3*x) ;
y_ex=@(x) (9*cos(x)-cos(3*x))/8 ;

y0=1 ; % valor y(0) 
y1=0; % valor y'(0)
a=0 ; b=3.2 ; ndim=10 ; % ndim=input('ndim ? ')

h=(b-a)/(ndim+1);
x=(a+h):h:(b-h);

% sistema: y'=Ay+b
A=[0 1;-1 0];

y=zeros(2,ndim);
y(1,1)=y0; 
y(1,2)=y1; 

for i=1:(ndim-1)
  y(:,i+1)=y(:,i)+ h*(A*(y(:,i))+[0;f(x(:,i))]);
end
%calculo del error
for i=1:ndim 
  error(i)=y(1,i)-y_ex(x(:,i));
end
fprintf('Error=%e \r\n',norm(error,Inf));

plot(x,y(1,:),'o',x,y_ex(x));

%https://math.stackexchange.com/questions/2476544/extending-numerical-euler-method-to-higher-order-differential-equations