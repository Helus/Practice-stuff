function [f]=f_Euler_sist(x,y1,y2,y3,y4)
  f1=2.*x.*y4.*y1 ; % y1'
  f2=10.*x.*y4.*y1.^5 ; % y2'
  f3=2.*x.*y4 ; % y3'
  f4=-2.*x.*(y3-1) ; % y4'
  f=[f1; f2; f3; f4];
end