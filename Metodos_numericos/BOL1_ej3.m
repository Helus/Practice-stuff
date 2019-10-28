a=0.75; 

# a)
error=1;
s0=1; 
tol=1.e-10;
k=1;
fid=fopen('ej3.txt','w');
fprintf(fid,'APARTADO a) \r\n');
while error>=tol
  s=s0*a+1;
  error=abs(s-s0);
  fprintf(fid, 'it=%i sn=%21.14e error=%21.14e \r\n',k,s,error);
  s0=s;
  k=k+1;
end

# b)
fprintf(fid,'APARTADO b) \r\n');
x0=1;
k=1;
en=1;
while en>=tol
  xn=2*x0-(1-a)*x0^2;
  en=abs(xn-x0);
  fprintf(fid, 'it=%i xn=%21.14e error=%21.14e \r\n',k,xn,en);
  x0=xn;
  k=k+1;
end

fclose(fid);
