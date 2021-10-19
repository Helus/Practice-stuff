% Example 1c: Use of MATLAB function fmincon to minimize 
%            the constrained function:
%            min f= 3v1^2+2v2^2-v1-2v2
%                v1>=v2; v2>=v1^2-1 
%                

options=optimset('Display','iter');

v0=[4 1];  % Initial guess

disp('Solution with fmincon')
% Linear constraints and bounds
% How to introduce linear constraints:
% A*X  <= B, Aeq*X  = Beq (linear constraints)
% For example:
% x1+x2<=3; Define: a=[1 1] b=3
% How to introduce bounds:
% LB <= X <= UB        (bounds)
% For example:
% 0<=X1<=1; 0<=X2<=2; Define: lb = [0,0]; ub = [1,2];

% In our particular example we could use A and B for the linear constraint
% or, since we have one non-linear constraint, define both constraints in
% the constraint function

a=[]; b=[]; aeq=[]; beq=[]; lb=[]; ub=[];
% Call to fmincon
[vmin,fmin]=fmincon('f_ex1c',v0,a,b,aeq,beq,lb,ub)

figure()
plot_f_ex1, hold on
plot(vmin(1),vmin(2),'ro')