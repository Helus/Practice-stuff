% PRACTICA 2
clear all;
close all;


% PARTE 1
q=5;
[alph,bet]=BDF(q);
[tipo,conv,error,orden]=comprobar_MLM(alph,bet);


% PARTE 2
tic
% ofi STANDS FOR "output file"
ofi = fopen('output.txt','wt');
%
data
%
fprintf(ofi,'\n\n**** COMPUTATION ****');

h=(b-a)/(N-1); % paso de discretización

% método de 1 paso que calculará los primeros orden-1 iterantes para el MLM 
[m,x,yh]=RK4(a,b,eta,N,ofi); % orden 4

% [m,x,yh] = EEmethod(a,b,eta,N,ofi); % orden 1
% [m,x,yh]=RK_b_ord2(a,b,eta,N,ofi); % orden 2
% [m,x,yh]=RK_c_ord3(a,b,eta,N,ofi); % orden 3

% iterantes iniciales
for i=1:orden
    Y0(i,:)=yh(i,:);
end

[m,x,yh]=BDF5(a,b,Y0,orden,alph,N,maxit,epsi,delta,ofi);
displayer
fclose(ofi);
%
plotter
%
toc
close all