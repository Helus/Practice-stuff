function logical=test_DIY2(v)
A=[-3 -2; -1 1; 1 1; 2/3 -1]; b=[6 -3 -7 -4/3]';
logical=A*v+b<=1.e-8;    % tol=10^(-8)
% if logical
%     fprintf('[');
%     fprintf('%g', v);
%     fprintf('] es solución factible \n');
% else
%     disp('La solución NO es factible')
%     errores=A*v+b;
%     fprintf('Errores: \n');
%     fprintf('%f \n', errores);
end