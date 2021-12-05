% Function defining the ODE y' = f(x,y).
function jf = jacf(x,y)
jf = [0 1; -1 0];
% jf = [2*x*y(4) 0 0 2*x*y(1); 50*x*y(4)*y(1)^4 0 0 10*x*y(1)^5; 0 0 0 2*x; 0 0 -2*x 0];
end