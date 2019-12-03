function [A, b, x0, itmax, tol]=datos_grad_conj()
  n=3; %orden del sistema

  A=hilb(3);

  b=[11/6; 13/12; 47/60];

  x0=0*ones(1,n); % punto inicial
  
  %n=4; %orden del sistema

  %A=3*eye(n)+flip(diag([-2 2 2 -2]), 2);

  %b=[-5; 0; 5; -10];

  % x0=0*ones(1,n); % punto inicial

  itmax=1.e2; % nº de iteraciones maximas
  tol=1.e-10; % tolerancia del test de parada 
  
end

% Datos Ejercicio 4 a)