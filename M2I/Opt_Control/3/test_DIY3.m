% test_DIY3: función que comprueba si un punto es factible en el problema
% DIY3

function logical=test_DIY3(v)
A=[1 1; 1 0; -1 0; 0 -1]; b=[-5 -3 0 0]';
logical=A*v+b<=1.e-8;    % tol=10^(-8)
end