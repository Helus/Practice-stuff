% EXPLICIT or FORWARD EULER METHOD.
% profile on
% profile clear
tic
clc
clear
close all
% ofi STANDS FOR "output file"
ofi = fopen('output.txt','wt');
%
data
%
fprintf(ofi,'\n\n**** COMPUTATION ****');
[m,x,yh] = THETAmethod(theta,a,b,eta,N,ofi,maxit,epsi,delta,sistSol);
%
displayer
fclose(ofi);
%
plotter
%
toc
% profile off
% profile report