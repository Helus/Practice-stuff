clear all; close all;

A=10; n=2;
f=@(x) A*n + sum(x.^2-A*cos(2*pi*x));

lb=-5.12*ones(1,n); ub=5.12*ones(1,n);
n_starts=200;


% MULTISTART
for i=1:n_starts
    v0(i,:)=lb+rand(1,2).*(ub-lb);
    a=[]; b=[]; aeq=[]; beq=[]; 
    [vmin(i,:),fmin_start(i)]=fmincon(f,v0(i,:),a,b,aeq,beq,lb,ub);
end

[fbest beststart]=min(fmin_start);
vbest=vmin(beststart,:);
fprintf('Mejor candidato a vmin: [ '); fprintf('%g ', vbest); fprintf('] \n');
fprintf('Mejor valor de f: %.4f \n',fbest)

figure(1)
plot_f
hold on
plot(v0(:,1),v0(:,2),'*b') % valores iniciales
plot(vmin(:,1),vmin(:,2),'*r') % mejor candidato a vmin
hold off

% Histograma de las distintas soluciones optimas obtenidas
figure(2)
hist(fmin_start,20)


% MÉTODO GLOBAL: SIMULATED ANNEALING 

v0=[0.5 0.5];
% Opciones de SA
options = struct(...
        'CoolSched',@(T,k) 0.9*T,...    % Deafult 0.8*T ;(2000/(1+k)); 0.99*T
        'Generator',@(x) (x+(randperm(length(x))==length(x))*randn/100),... 
        'InitTemp',2000,...
        'MaxConsRej',1000,...
        'MaxSuccess',20,...
        'MaxTries',100,...
        'StopTemp',1e-5,...
        'StopVal',-Inf,...
        'Verbosity',2);

figure(2)
plot_f
hold on
plot(v0(1),v0(2),'^k','MarkerSize',8,'MarkerFaceColor',[0 0 0])
hold on   
[vmin,fmin]=anneal(f,v0,lb,ub,options)
hold on
plot(vmin(1),vmin(2),'sk','MarkerSize',8,'MarkerFaceColor',[1 0 0])

