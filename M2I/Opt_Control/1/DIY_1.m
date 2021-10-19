clear all; close all;
global xx;
xx=[];

options=optimset('Display','iter')%,'PlotFcns',@optimplotfval);
n=2;
a=-5; b=5; v0 = (b-a).*rand(1,n) + a;
%v0=ones(1,n);  % Initial guess

% Utilizando fminsearch
% disp('Solución con fminsearch')
% [vmin,fmin,exitflag,outputs] =fminsearch('f',v0,options)

% Utilizando fminunc
disp('Solución con fminunc')
[vmin,fmin] =fminunc('f',v0,options)


% PLOT
figure()
v1 = -5:.1:5;
v2 = -5:.1:5;
[v1,v2] = meshgrid(v1,v2); F=5*(v1.^2 +2*v2.^2); contour(v1,v2,F,20),hold on

title('Solución')
hold on
plot(v0(1,1), v0(1,2),'k^','MarkerSize',8,'MarkerFaceColor',[0 0 0])
hold on
plot(xx(:,1),xx(:,2),'ro')
hold on
plot(vmin(:,1),vmin(:,2),'sk','MarkerSize',8,'MarkerFaceColor',[0 0 0])
hold off
