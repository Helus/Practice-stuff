clear all; close all;

f=@(x) [4*x(1)^2+4*x(2)^2 (x(1)-5)^2+(x(2)-5)^2];
v0=5*rand(2,1);

% Pesos
w1=0:0.01:1; w2=1-w1;

V=[];

for i=1:length(w1)
    fw=@(x) w1(i)*(4*x(1)^2+4*x(2)^2) + w2(i)*((x(1)-5)^2+(x(2)-5)^2);
    [vmin,fmin] = fminsearch(fw,v0);
    factible=test_DIY5(vmin');
    if factible 
        V=[V vmin];
    end
end

F=[];
for i=1:length(V(1,:))
    F(:,i)=f(V(:,i));
end

x = -2:.1:7;

figure(1)
plot(V(1,:),V(2,:),'bo'), hold on
plot(zeros(length(x)),x,'k','Linewidth',1), hold on 
plot(5*ones(length(x),1),x,'k','Linewidth',1), hold on 
plot(x,zeros(length(x),1),'k','Linewidth',1), hold on 
plot(x,5*ones(length(x),1),'k','Linewidth',1), hold on 
axis([-2 7 -2 7])
title('Frente de Pareto (pesos)')
hold off

figure(2)
plot(F(1,:),F(2,:),'-bo'), hold on
title('Valores del frente de Pareto (pesos)')
hold off

% e-constrained
f1=@(x) 4*x(1)^2+4*x(2)^2;
f2=@(x) (x(1)-5)^2+(x(2)-5)^2;

A=[]; b=[]; Aeq=[]; beq=[]; lb=[0 0]; ub=[5 5]; nonlcon1=@f2_eps; nonlcon2=@f1_eps;
[vmin_1,fmin_1]=fmincon(f1,v0,A,b,Aeq,beq,lb,ub,nonlcon1);
[vmin_2,fmin_2]=fmincon(f2,v0,A,b,Aeq,beq,lb,ub,nonlcon2);

F=[f(vmin_1); f(vmin_2)];

figure(1)
plot([vmin_1(1),vmin_2(1)],[vmin_1(2),vmin_2(2)],'bo'), hold on
plot(zeros(length(x)),x,'k','Linewidth',1), hold on 
plot(5*ones(length(x),1),x,'k','Linewidth',1), hold on 
plot(x,zeros(length(x),1),'k','Linewidth',1), hold on 
plot(x,5*ones(length(x),1),'k','Linewidth',1), hold on 
axis([-2 7 -2 7])
title('Frente de Pareto (e-constrained)')
hold off

figure(2)
plot(F(1,:),F(2,:),'-bo'), hold on
title('Valores del frente de Pareto (e-constrained)')
hold off

% NSGAII
% Resuelto utilizando el programa principal DIY5_NSGAII.m y la función
% DIY5_objfun.m, que se encuentran en la subcarpeta NGPM_v1.4
