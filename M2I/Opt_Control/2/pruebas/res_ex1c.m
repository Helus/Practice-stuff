% Nonlinear constraints
  function [ineq, eq]=res_ex1c(v)
  
  ineq(1)=v(2)-v(1);
  ineq(2)=v(1)^2-v(2)-1;
  eq=[];