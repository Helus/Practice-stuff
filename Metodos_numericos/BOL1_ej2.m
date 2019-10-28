e=0.75;
errl1=e; errl2=e; errc=e;
salida=fopen('conver_sal.txt','w');

fprintf(salida, 'iter=%i lin(0.5)=%e lin(0.01)=%e cuad=%e \n',0,errl1,errl2,errc);
for i=1:10
  errl1=errl1*0.5;
  errl2=errl2*0.01;
  errc=errc^2;
  fprintf(salida, 'iter=%i lin(0.5)=%e lin(0.01)=%e cuad=%e \n',i,errl1,errl2,errc);
end
fclose(salida);