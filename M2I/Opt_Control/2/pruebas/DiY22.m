clear all; close all;
global xx;
xx=[];

% APARTADO 1

f=@(x) (x(1)-6)^2+(x(2)-7)^2;
options=optimset('Display','iter');%,'PlotFcns',@optimplotfval);
n=2;
a=0; b=15; v0=[1 2];%v0 = (b-a).*rand(1,n) + a;

disp('Solución con fminunc')
[vmin,fmin] =fminunc(f,v0,options)

figure()
v1 = 0:.1:15;
v2 = 0:.1:15;
[v1,v2] = meshgrid(v1,v2); F=(v1-6).^2 +(v2-7).^2; contour(v1,v2,F,20),hold on

title('Solución')
hold on
plot(vmin(:,1),vmin(:,2),'ro')
hold off

% APARTADO 2

mu_range=[0.1 1 10 100 1000; 0.1 1 10 100 1000; 0.1 1 10 100 1000; 0.1 1 10 100 1000];

V_MIN1=[];
F_MIN1=[];
index=1;
for i=1:5
    for j=1:5
        for k=1:5
            for l=1:5
                fp =@(x) (x(1)-6)^2+(x(2)-7)^2+...
                    mu_range(1,i)*max([0 (-3*x(1)-2*x(2)+6)^2]) +...
                    mu_range(2,j)*max([0 (-x(1)+x(2)-3)^2]) +...
                    mu_range(3,k)*max([0 (x(1)+x(2)-7)^2]) +...
                    mu_range(4,l)*max([0 (2/3*x(1)-x(2)-4/3)^2]);
                [vmin,fmin] =fminunc(fp,v0,options);
                factible=test_DIY2(vmin');
                if factible 
                    V_MIN1(index,:)=vmin;
                    F_MIN1(index)=fmin;
                    index=index+1;
                end
            end
        end
    end
end

[M,min_index1]=min(F_MIN1);

figure(1)
contour(v1,v2,F,20),hold on
for i=1:length(F_MIN1)
    plot(V_MIN1(i,1),V_MIN1(i,2),'bo'), hold on
end
plot(V_MIN1(min_index1,1),V_MIN1(min_index1,2),'sk','MarkerSize',8,'MarkerFaceColor',[0 0 0])
title(V_MIN1(min_index1,:)')
hold off

% APARTADO 3

% Barrera inversa
V_MIN2=[];
F_MIN2=[];
index=1;
% for i=1:4
%     for j=1:4
%         for k=1:4
%             for l=1:4
%                 fp =@(x) (x(1)-6)^2+(x(2)-7)^2+...
%                     1/mu_range(1,i)*(-3*x(1)-2*x(2)+6)^(-1) +...
%                     1/mu_range(2,j)*(-x(1)+x(2)-3)^(-1) +...
%                     1/mu_range(3,k)*(x(1)+x(2)-7)^(-1) +...
%                     1/mu_range(4,l)*(2/3*x(1)-x(2)-4/3)^(-1);
%                 [vmin,fmin] =fminunc(fp,v0,options);
%                 V_MIN2(index,:)=vmin;
%                 F_MIN2(index)=fmin;
%                 index=index+1;
%             end
%         end
%     end
% end

for i=1:5
    fp =@(x) (x(1)-6)^2+(x(2)-7)^2 + 1/mu_range(1,i)*(...
        (-3*x(1)-2*x(2)+6)^(-1) +...
        (-x(1)+x(2)-3)^(-1) +...
        (x(1)+x(2)-7)^(-1) +...
        (2/3*x(1)-x(2)-4/3)^(-1));
    [vmin,fmin] =fminunc(fp,v0,options);
    factible=test_DIY2(vmin');
    if factible 
        V_MIN2(index,:)=vmin;
        F_MIN2(index)=fmin;
        index=index+1;
    end
end

[M,min_index2]=min(F_MIN2);

figure(2)
contour(v1,v2,F,20),hold on
for i=1:length(F_MIN2)
    plot(V_MIN2(i,1),V_MIN2(i,2),'bo'), hold on
end
plot(V_MIN2(min_index2,1),V_MIN2(min_index2,2),'sk','MarkerSize',8,'MarkerFaceColor',[0 0 0])
title(V_MIN2(min_index2,:)')
hold off

% Barrera log

V_MIN3=[];
F_MIN3=[];
index=1;
for i=1:5
    fp =@(x) (x(1)-6)^2+(x(2)-7)^2 -1/mu_range(1,i)*(...
        log((-3*x(1)-2*x(2)+6)*(-1)) +...
        log((-x(1)+x(2)-3)*(-1)) +...
        log((x(1)+x(2)-7)*(-1)) +...
        log((2/3*x(1)-x(2)-4/3)*(-1)));
    [vmin,fmin] =fminunc(fp,v0,options);
    factible=test_DIY2(vmin');
    if factible 
        V_MIN3(index,:)=vmin;
        F_MIN3(index)=fmin;
        index=index+1;
    end
end


[M,min_index3]=min(F_MIN3);

figure(3)
contour(v1,v2,F,20),hold on
for i=1:length(F_MIN3)
    plot(V_MIN3(i,1),V_MIN3(i,2),'bo'), hold on
end
plot(V_MIN3(min_index3,1),V_MIN3(min_index3,2),'sk','MarkerSize',8,'MarkerFaceColor',[0 0 0])
title(V_MIN3(min_index3,:)')
hold off




% TEST
test_DIY2(V_MIN1(min_index1,:)');
fprintf('f(v_min)=%f\n',f(V_MIN1))

test_DIY2(V_MIN2(min_index2,:)');
fprintf('f(v_min)=%f\n',f(V_MIN2))

test_DIY2(V_MIN3(min_index3,:)');
fprintf('f(v_min)=%f\n',f(V_MIN3))
