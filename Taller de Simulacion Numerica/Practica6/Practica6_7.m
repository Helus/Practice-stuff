% PRÁCTICA 6 ejercicio 7: utilizar elfin1dns.m


% PRÁCTICA 6 ejercicio 8

% esquema
D=1; U=1; gm=0.2; cin=100; L=10; p=2;
fp= @(t) D*ones(size(t));
fdp= @(t) zeros(size(t));
fr= @(t) U*ones(size(t));
fq= @(t) gm*ones(size(t));
ff= @(t) zeros*(size(t));
%...
[x,phi]=elfin1dNoLinealIF(fp,fq,ff,p,0,L,datos_a,datos_b,nel,l,iopcoef,iopblo,tol,maxit)
