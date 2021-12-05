% INITIAL (LEFT) EXTREMUM:
fprintf(ofi,'***** DATA *****');
a = 0;
fprintf(ofi,'\n* Initial (left) extremum: \na = %-.5E.', a);
% FINAL (RIGHT) EXTREMUM:
b = 3;
fprintf(ofi,'\n\n* Final (right) extremum: \nb = %-.5E.', b);
% INITIAL CONDITION (VALUE OF THE SOLUTION y(x)=[y_1(x) ... y_m(x)] AT x=a):
% eta = [1,1,1,1];
eta = [1 0];
fprintf(ofi,'\n\n* Initial condition: \neta = ');
fprintf(ofi,'%-.5E ', eta);
% NUMBER OF POINTS (or NODES) OF THE MESH (= NUMBER OF SUBINTERVALS + 1):
N = 1000;
fprintf(ofi,'\n\n* Number of nodes of the mesh: \nN = %-i. ', N);
% DISPLAY FREQUENCY (the results are displayed only for the first node, the last node, and when
%the number of the node is a multiple of dfreq):
dfreq = max(1,round(N/10));
fprintf(ofi,'\n\n* Display frequency: \ndfreq = %-i ', dfreq);
fprintf(ofi,'(in order not to display too many lines, the results are displayed only for');
fprintf(ofi,'\nthe first node, the last node, and when the number of the node is a multiple of dfreq).');
% PLOT FREQUENCY (the results are plotted only for the first node, the last node, and when
%the number of the node is a multiple of plfreq):
plfreq = max(1,round(N/50));
fprintf(ofi,'\n\n* Plot frequency: \nplfreq = %-i ', plfreq);
fprintf(ofi,'(in order not to plot too many points, the results are plotted only for');
fprintf(ofi,'\nthe first node, the last node, and when the number of the node is a multiple of plfreq).');
% IS THE EXACT SOLUTION KNOWN (ex=1) OR NOT (otherwise)?
ex = 1;
fprintf(ofi,'\n\n* Option for exact solution: \nex = %-i', ex);
if (ex == 1)
    fprintf(ofi,' (the exact solution is known).');
else
    fprintf(ofi,' (the exact solution is not known).');
end

% Método de resolución del sistema
fprintf(ofi,'\n\n* Método escogido para la resolución del sistema: MÉTODO DE NEWTON');

% Número máximo de iteraciones
maxit=2000;
fprintf(ofi,'\n\n* Número máximo de iteraciones: %-i', maxit);

% eps-delta de parada
epsi=1.e-14; delta=1.e-14;
fprintf(ofi,'\n\n* Epsilon de parada: \n epsilon = %-.5E.', epsi);
fprintf(ofi,'\n* Delta de parada: \n delta = %-.5E.', delta);