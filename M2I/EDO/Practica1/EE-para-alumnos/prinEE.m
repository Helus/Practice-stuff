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
[m,x,yh] = EEmethod(a,b,eta,N,ofi);
%
displayer
fclose(ofi);
%
plotter
%
toc
% profile off
% profile report