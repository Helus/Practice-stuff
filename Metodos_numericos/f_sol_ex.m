function [f]=f_sol_ex(x)
  f1=exp(sin(x.^2)) ;
  f2=exp(5*sin(x.^2)) ; 
  f3=sin(x.^2)+1 ; 
  f4= cos(x.^2) ; 
  f=[f1; f2; f3; f4];
end